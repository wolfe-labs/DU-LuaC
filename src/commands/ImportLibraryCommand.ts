import Colors from "colors";
import Command, { CommandData } from "./Command";

/**
 * A command that initializes a new project
 */
export default class ImportLibraryCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'import';
  description = `Imports a library into the project, where '${Colors.cyan('library')}' is either a directory or Git path`;
  args = ['library'];

  // This is what runs our command
  async run({ args, options }: CommandData) {
    throw new Error('Not implemented yet!');
  }
}