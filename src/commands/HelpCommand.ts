import Colors from "colors";
import { CLI } from "../lib/CLI";
import CommandManager from "../lib/CommandManager";
import Command, { CommandData } from "./Command";

/**
 * A command that initializes a new project
 */
export default class HelpCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'help';
  description = `Lists all the available commands on the CLI`;

  // This is what runs our command
  async run() {
    // Gets all available commands
    const commands = CommandManager.getCommandList();

    // Prepares list of commands
    const commandLines: { left: string, right: string }[] = [];
    commands.forEach((command) => {
      // Adds command data
      commandLines.push({
        left: `${Colors.blue(command.command)} ${Colors.gray((command.args || []).join(' '))}`,
        right: command.description.trim(),
      })

      // When the command has options, adds those too
      const options = command.options || {};
      for (let optionName in options) {
        // Gets option details
        const option = options[optionName];

        // Adds option data
        commandLines.push({
          left: `  ` + Colors.gray(`--${optionName}=${option.format}`),
          right: option.description,
        });
      }
    });

    // Gets the maximum size for the left side
    const regexCleanup = /\u001b\[.*?m/g;
    const maxLeftSize = commandLines
      .map((line) => line.left.replace(regexCleanup, '').length)
      .reduce((acc, line) => Math.max(line, acc), 0);

    // Renders the command header
    CLI.print(`Usage: ${Colors.yellow('du-lua')} ${Colors.blue('command')} ${Colors.gray('args')} ${Colors.gray('--option=value')}`);
    CLI.print(Colors.yellow('du-lua'));

    // Renders the command list
    commandLines.forEach((commandLine) => {
      // Calculates our padding
      const padding = ' '.repeat(Math.max(0, maxLeftSize - commandLine.left.replace(regexCleanup, '').length));

      // Does actual printing
      CLI.print(`  ${commandLine.left}${padding} : ${commandLine.right}`);
    });
  }
}