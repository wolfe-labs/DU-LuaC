import Colors from "colors";
import Command, { CommandData } from "./Command";

/**
 * A command that initializes a new project
 */
export default class AddCodeCompletionCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'add-code-completion';
  description = `Adds the Codex files to enable code completion`;

  // This is what runs our command
  async run({ args, options }: CommandData) {
    throw new Error('Not implemented yet!');
  }
}