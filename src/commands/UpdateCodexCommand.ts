import Colors from "colors";
import Command, { CommandData } from "./Command";

/**
 * A command that initializes a new project
 */
export default class UpdateCodexCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'update-codex';
  description = `Updates the built-in Codex to the latest one available on OpenData. For development use only!`;

  // This is what runs our command
  async run({ args, options }: CommandData) {
    throw new Error('Not implemented yet!');
  }
}