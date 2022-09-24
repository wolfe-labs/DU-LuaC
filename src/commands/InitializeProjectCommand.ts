import Command, { CommandData } from "./Command";

/**
 * A command that initializes a new project
 */
export default class InitializeProjectCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'init';
  description = `Creates a new project on current directory`;

  // This is what runs our command
  async run({ args, options }: CommandData) {
    throw new Error('Not implemented yet!');
  }
}