import Command, { CommandData } from "../commands/Command";
import { SimpleMap } from "../types/SimpleMap";
import CommandParser from "./CommandParser";

/**
 * Represents a command that can be registered
 */
export type RegisterableCommand = new () => Command;

export type CommandResult = {
  commandExists: boolean,
  commandOutput: any,
}

/**
 * This class will manage all of the CLI's commands
 */
export default class CommandManager {
  /**
   * A list of all commands we have
   */
  private static commands: SimpleMap<Command>;

  /**
   * Registers a command
   * @param command The command's class
   */
  static registerCommand(command: RegisterableCommand) {
    this.commands[command.name] = new command;
  }

  /**
   * Runs a command
   * @param command The command being executed
   * @param data The arguments and options for that command
   */
  static async run(command: string, data: CommandData = { args: [], options: {} }): Promise<CommandResult> {
    // Fails when command is non-existent
    if (!this.commands[command]) return {
      commandExists: false,
      commandOutput: null,
    }

    // Runs command and returns result
    return {
      commandExists: true,
      commandOutput: await this.commands[command].run(data),
    };
  }

  /**
   * Runs a command instance that has not been registered
   * @param command The command being executed
   * @param data The arguments and options for that command
   */
  static async runUnregistered(command: Command | RegisterableCommand, data: CommandData = { args: [], options: {} }): Promise<CommandResult> {
    // Gets our command instance
    const commandInstance: Command = (command as Command).run
      ? command as Command
      : new (command as RegisterableCommand);

    // Runs command and returns result
    return {
      commandExists: true,
      commandOutput: await commandInstance.run(data),
    };
  }

  /**
   * Executes a command based on its pieces
   * @param params The pieces of the command
   */
  static async execute(...params: string[]): Promise<CommandResult> {
    // Parses command
    const parsedCommand = CommandParser.parse(...params);

    // Handles case when the parsed command is null
    if (!parsedCommand) {
      return {
        commandExists: false,
        commandOutput: null,
      };
    }

    // Runs our command
    return await this.run(parsedCommand.command, parsedCommand);
  }
}