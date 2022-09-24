import Colors from "colors";
import Command, { CommandData } from "./Command";

/**
 * A command that initializes a new project
 */
export default class AddBuildTargetCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'target-add';
  description = `Adds a build target to the project (development/production)`;

  // This is what runs our command
  async run({ args, options }: CommandData) {
    // Skips prompt, uses options instead
    if (options.noPrompt) {
      
    }

    throw new Error('Not implemented yet!');
  }
}