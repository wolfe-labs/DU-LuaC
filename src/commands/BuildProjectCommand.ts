import ColorScheme from "../lib/ColorScheme";
import Command, { CommandData } from "./Command";

/**
 * A command that initializes a new project
 */
export default class BuildProjectCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'build';
  description = `Builds the current project`;
  options = {
    copy: {
      format: `target-name/${ColorScheme.highlightArgument('build-name')}`,
      description: `Copies the specified build's JSON into your clipboard. If no target is provided, the first is selected`,
    },
  };

  // This is what runs our command
  async run({ args, options }: CommandData) {
    throw new Error('Not implemented yet!');
  }
}