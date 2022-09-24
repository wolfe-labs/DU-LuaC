import Colors from "colors";
import Command, { CommandData } from "./Command";

/**
 * A command that initializes a new project
 */
export default class IgnoreNativeLibrariesCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'ignore-native-libraries';
  description = `Adds project configuration to ignore errors from using DU's native Lua libraries (cpml, pl, util/event)`;

  // This is what runs our command
  async run({ args, options }: CommandData) {
    throw new Error('Not implemented yet!');
  }
}