import Command, { CommandData } from "./Command";

/**
 * A command that adds a new link to a build
 */
export default class AddBuildLinkCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'script-link';
  description = `Adds a linked element and its events to a script`;
  args = ['script-name'];

  // This is what runs our command
  async run({ args, options }: CommandData) {
    throw new Error('Not implemented yet!');
  }
}