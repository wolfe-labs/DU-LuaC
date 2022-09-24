import Colors from "colors";
import Command, { CommandData } from "./Command";

/**
 * A command that initializes a new project
 */
export default class AddRenderScriptCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'script-add-screen';
  description = `Creates a new render script and its corresponding .lua script file`;
  args = ['script-name'];

  // This is what runs our command
  async run({ args, options }: CommandData) {
    throw new Error('Not implemented yet!');
  }
}