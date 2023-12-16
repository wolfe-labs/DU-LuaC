import _, { head } from "lodash";
import fs, { link } from "fs";
import { CLI } from "../lib/CLI";
import Project from "../types/Project";
import Command, { CommandData } from "./Command";
import ElementTypes, { ElementType, ElementTypeEvent } from "../types/ElementType";
import Application from "../Application";
import path from "path";
import GitIgnoreBuilder from "../lib/GitIgnoreBuilder";
import Codex, { CodexClass } from "../types/Codex";
import BuildLinkedElement from "../types/BuildLinkedElement";

function generateEventAutocompleteHints(elementName: string, elementClass: string, eventSignatures: ElementTypeEvent[], codex: Codex, headerLinkedElementEvents: string): string {
  // Builds a list of events
  const codexEvents = codex.classes![elementClass].events || {};
  const events = eventSignatures.map(event => {
    const parsed = Array.from(/(.+?)\((.*?)\)/g.exec(event.signature)!).slice(1);
    const eventName = parsed[0];
    const eventArgs = parsed.length > 1 ? parsed[1].split(',') : [];
    const codexEvent = codexEvents[eventName];
    
    // If we have that data on Codex, great! Extract from it!
    if (codexEvent) {
      return {
        name: eventName,
        args: (codexEvent.params || []).map(param => Object.assign({
          name: param.name,
          type: param.type,
        }))
      };
    }

    // Gets a more generic data instead
    return {
      name: eventName,
      args: eventArgs.map(name => Object.assign({
        name: name,
        type: 'any',
      }))
    };
  });

  // Creates our headers
  const overloadsOnEvent: string[] = [];
  const overloadsClearEvent: string[] = [];
  const overloadsTriggerEvent: string[] = [];

  events.forEach((event) => {
    // Builds argument string
    const argsString = event.args.length > 0
      ? `,${event.args.map(arg => `${arg.name}:${arg.type}`)}`
      : '';

    // Generates new overloads
    overloadsOnEvent.push(`---@overload fun(event:'${event.name}',handler:fun(self:${elementClass}${argsString})):number`);
    overloadsClearEvent.push(`---@overload fun(event:'${event.name}',handlerId:number)`)
    overloadsTriggerEvent.push(`---@overload fun(event:'${event.name}',...:any)`)
  });

  return `${elementName} = ${elementClass}()\n${
    headerLinkedElementEvents
      .replace(/___OVERLOADS_ONEVENT___/g, overloadsOnEvent.join('\n'))
      .replace(/___OVERLOADS_CLEAREVENT___/g, overloadsClearEvent.join('\n'))
      .replace(/___OVERLOADS_TRIGGEREVENT___/g, overloadsTriggerEvent.join('\n'))
      .replace(/__OBJECT_TYPE__/g, elementClass)
      .replace(/__OBJECT_NAME__/g, elementName)
      .replace(/__OBJECT_EVENTS__/g, () => {
        return [
          'string',
          ...eventSignatures.map(event => `"'${event.signature.split('(').shift()}'"`),
        ].join(' | ');
      })
  }`;
}

function generateElementEventAutocompleteHints(linkedElement: BuildLinkedElement, codex: Codex, headerLinkedElementEvents: string): string | null {
  // Gets the element type
  const elementType = ElementTypes.getElementByType(linkedElement.type);

  // If a valid type with Lua class, adds it to our Codex (will become a global)
  if (elementType && elementType.luaClass) {
    return generateEventAutocompleteHints(linkedElement.name, elementType.luaClass, linkedElement.getElementEvents(), codex, headerLinkedElementEvents);
  }

  // If everything fails, returns null (will be filtered out)
  return null;
}

function generateEventAutocompleteFromCodex(name: string, className: string, codex: Codex, headerLinkedElementEvents: string): string | null {
  const codexEntry = codex.classes![className];

  // Handles invalid entry
  if (!codexEntry) {
    return null;
  }

  // Generates list of event signatures
  const eventSignatures: ElementTypeEvent[] = [];
  Object.keys(codexEntry.events || {}).forEach(eventName => {
    const event = codexEntry.events![eventName];
    eventSignatures.push({
      signature: `${eventName}(${(event.params || []).map(param => param.name).join(',')})`,
    })
  });

  // Does normal generation
  return generateEventAutocompleteHints(name, className, eventSignatures, codex, headerLinkedElementEvents);
}

/**
 * A command that adds code completion
 */
export default class AddCodeCompletionCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'add-code-completion';
  description = `Adds the Codex files to enable code completion`;

  // This is what runs our command
  async run({ args, options }: CommandData) {
    // Gets the current project
    const project = Project.load(process.cwd());

    // Gets list of element types
    const elementTypes = ElementTypes.getAllTypes();

    // Gets a list of all linked elements on the project
    const linkedElements = _.flatten(
      project.getProjectBuilds()
        .map((build) => build.getLinkedElements())
    );

    // Creates utility directory as needed
    if (!fs.existsSync(project.getUtilityDirectory())) fs.mkdirSync(project.getUtilityDirectory(), { recursive: true });

    // This is our Codex
    const codex = JSON.parse(fs.readFileSync(Application.getPath('Codex/Codex.json')).toString()) as Codex;

    // The linked element events header
    const headerLinkedElementEvents = fs.readFileSync(Application.getPath('lua/extra-headers/LinkedEvents.lua')).toString();

    // Our global definitions
    const globals = [
      { name: 'DULibrary', class: 'Library' },
      { name: 'library', class: 'Library' },
      { name: 'DUSystem', class: 'System' },
      { name: 'system', class: 'System' },
      { name: 'DUPlayer', class: 'Player' },
      { name: 'player', class: 'Player' },
      { name: 'DUConstruct', class: 'Construct' },
      { name: 'construct', class: 'Construct' },
      { name: 'unit', class: 'ControlUnit' },
    ];

    // Prepares our project's Codex file
    const projectCodex = [
      // The default Codex
      fs.readFileSync(Application.getPath('Codex/Codex.lua')).toString(),

      // Our global autocomplete
      ...globals.map(global => generateEventAutocompleteFromCodex(global.name, global.class, codex, headerLinkedElementEvents)),

      // Our linked elements autocomplete
      ...linkedElements.map((element) => generateElementEventAutocompleteHints(element, codex, headerLinkedElementEvents)).filter((element) => !!element),
    ].join('\n\n').replace(/[\n]+/g, '\n');

    // Writes our project's Codex file
    fs.writeFileSync(path.join(project.getUtilityDirectory(), 'Codex.lua'), projectCodex);

    // Status message
    if (!options.quiet) {
      CLI.success(`Codex file generated successfully!`);
    }

    // Creates EmmyLua config file
    const emmyLuaConfig = fs.readFileSync(Application.getPath('templates/emmy.config.json')).toString()
      .replace(/\$\{srcpath\}/g, project.sourcePath);
    
    // Writes EmmyLua config file
    fs.writeFileSync(path.join(project.getProjectDirectory(), 'emmy.config.json'), emmyLuaConfig);

    // Status message
    if (!options.quiet) {
      CLI.success(`Code completion config generated successfully!`);
    }

    // Reads our .gitignore
    const gitignorePath = path.join(project.getProjectDirectory(), '.gitignore');
    const gitignore = fs.existsSync(gitignorePath)
      ? GitIgnoreBuilder.fromFile(project.getProjectDirectory())
      : new GitIgnoreBuilder;
    
    // Updates data on .gitignore
    gitignore.addEntries('util/Codex.lua');
    gitignore.save(project.getProjectDirectory());

    // Status message
    if (!options.quiet) {
      CLI.success(`Codex added to .gitignore!`);
    }
  }
}