import { CLI } from "../lib/CLI";
import prompts from "prompts";
import ColorScheme from "../lib/ColorScheme";
import Project from "../types/Project";
import Command, { CommandData } from "./Command";
import ElementTypes from "../types/ElementType";
import { DULuaConfig } from "../lib/DULuaConfig";

/**
 * A command that adds a new link to a build
 */
export default class AddBuildLinkCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'script-link';
  description = `Adds a linked element and its events to a script`;
  args = ['script-name'];

  // This is what runs our command
  async run({ args, options }: CommandData) {
    // Gets our args
    const [buildName] = args;

    // Gets current project
    const project = Project.load(process.cwd());

    // Checks if build exists
    if (!buildName) {
      CLI.panic(`No build provided!`);
    }
    if (!project.hasBuild(buildName)) {
      CLI.panic(`Invalid build: ${ColorScheme.highlight(buildName)}`);
    }

    // This is our build
    const build = project.getBuild(buildName);

    // Those are the linked elements
    const buildLinkedElements = build.getLinkedElements();

    // Loads element types
    const elementTypes = ElementTypes.getAllTypesForSelection();

    // Prompts user for info
    const linkData: {
      name: string,
      type: string,
    } = await prompts([
      {
        type: 'text',
        name: 'name',
        message: 'Give your element link a name, it will be used as a variable in Lua',
        validate: (value) => {
          // If empty
          if (0 == value.length) {
            return 'You must give your element a name';
          }

          // Prevent adding stuff with system names
          if (DULuaConfig.getInternalSlotNames().includes(value)) {
            return 'You cannot override a system slot or variable!'
          }

          // If already exists
          if (buildLinkedElements.find(
            (element) => element.name == value
          )) {
            return 'A slot with this name already exists!';
          }

          // Passed
          return true;
        }
      },
      {
        type: 'select',
        name: 'type',
        message: 'Select your element type, it will be used to filter events from this element',
        choices: Object.values(elementTypes),
      }
    ]);

    // Sanity check
    if (!linkData || !linkData.name || !linkData.type) {
      CLI.panic('Cancelled by the user!');
    }

    // Gets events
    const selectedElementType = ElementTypes.getElementByType(linkData.type)!;
    const availableEventsOptions = (selectedElementType.events || []).map(event => Object.assign({
      title: event.signature,
      value: event.signature.split('(').shift()!,
      selected: true,
    }));
    let events: any = undefined;
    if (availableEventsOptions.length > 0) {
      const eventResults = await prompts({
        type: 'multiselect',
        name: 'events',
        message: 'Which events would you like to use from this element?',
        choices: availableEventsOptions,
      });

      // Sanity check
      if (!eventResults || !eventResults.events) {
        CLI.panic('Cancelled by the user!');
      }

      events = eventResults.events;
    }
    
    // Adds to list
    build.addLinkedElement(linkData.name, linkData.type, {
      events: events,
    });

    // Saves project
    project.save();

    // Done
    CLI.success(`Slot ${ColorScheme.highlight(linkData.name)} added successfully!`);
  }
}