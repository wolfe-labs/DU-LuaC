import _ from "lodash";
import fs, { link } from "fs";
import { CLI } from "../lib/CLI";
import Project from "../types/Project";
import Command, { CommandData } from "./Command";
import ElementTypes from "../types/ElementType";
import Application from "../Application";
import path from "path";
import GitIgnoreBuilder from "../lib/GitIgnoreBuilder";

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

    // Prepares our project's Codex file
    const projectCodex = [
      // The default Codex
      fs.readFileSync(Application.getPath('Codex/Codex.lua')).toString(),

      // Our slots 
      ...linkedElements.map((element) => {
        // Gets the element type
        const elementType = elementTypes[element.type];

        // If a valid type with Lua class, adds it to our Codex (will become a global)
        if (elementType && elementType.luaClass) {
          return `${element.name} = ${elementType.luaClass}()`;
        }

        // If everything fails, returns null (will be filtered out)
        return null;
      }).filter((element) => !!element),
    ].join('\n\n').replace(/[\n]+/g, '\n');

    // Writes our project's Codex file
    fs.writeFileSync(path.join(project.getUtilityDirectory(), 'Codex.lua'), projectCodex);

    // Status message
    CLI.success(`Codex file generated successfully!`);

    // Creates EmmyLua config file
    const emmyLuaConfig = fs.readFileSync(Application.getPath('templates/emmy.config.json')).toString()
      .replace(/\$\{srcpath\}/g, project.sourcePath);
    
    // Writes EmmyLua config file
    fs.writeFileSync(path.join(project.getProjectDirectory(), 'emmy.config.json'), emmyLuaConfig);

    // Status message
    CLI.success(`Code completion config generated successfully!`);

    // Reads our .gitignore
    const gitignorePath = path.join(project.getProjectDirectory(), '.gitignore');
    const gitignore = fs.existsSync(gitignorePath)
      ? GitIgnoreBuilder.fromFile(project.getProjectDirectory())
      : new GitIgnoreBuilder;
    
    // Updates data on .gitignore
    gitignore.addEntries('util/Codex.lua');
    gitignore.save(project.getProjectDirectory());

    // Status message
    CLI.success(`Codex added to .gitignore!`);
  }
}