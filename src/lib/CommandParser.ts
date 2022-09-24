import { CommandArguments, CommandOptions } from "../commands/Command";
import { SimpleMap } from "../types/SimpleMap";

/**
 * Represents a parsed command
 */
export type ParsedCommand = {
  command: string,
  options: CommandOptions,
  args: CommandArguments,
};

/**
 * Helper class to parse commands
 */
export default class CommandParser {
  /**
   * Parses a command
   * @param params The pieces of the command
   */
  static parse(...params: string[]): ParsedCommand | null {
    // Extracts main command
    const command = params[0];

    // If no command is provided, returns null
    if (!command) return null;

    // This will store our arguments
    const args: any[] = [];

    // This will store any special options
    const options: SimpleMap<any> = {};

    // Now let's parse the args
    params.slice(1).forEach((arg) => {
      if (arg.startsWith('--')) {
        // Parses option
        const option = arg.split('=');
        const optionName = option[0].substring(2);

        // Handles --name options
        if (option.length == 1) {
          options[optionName] = true;
          return;
        }

        // Parses --name=value
        const optionValue = option.slice(1).join('=');

        // Saves our option
        options[optionName] = optionValue;
      } else {
        // Save argument
        args.push(arg);
      }
    });

    // Returns our finished object
    return {
      command,
      options,
      args,
    };
  }
}