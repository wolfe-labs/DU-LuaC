import Colors from "colors";
import Command, { CommandData } from "./Command";

/**
 * A command that initializes a new project
 */
export default class AddBuildCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'script-add';
  description = `Creates a new entry-point and its corresponding .lua script file`;
  args = ['script-name'];

  // This is what runs our command
  async run({ args, options }: CommandData) {
    throw new Error('Not implemented yet!');
  }
}