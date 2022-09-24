import Colors from "colors";
import Command, { CommandData } from "./Command";

/**
 * A command that initializes a new project
 */
export default class CreateProjectCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'create';
  description = `Creates a new project on the '${Colors.cyan('project-name')}' directory`;
  args = ['project-name'];

  // This is what runs our command
  async run({ args, options }: CommandData) {
    throw new Error('Not implemented yet!');
  }
}