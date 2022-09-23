import Command from "../commands/Command";
import { SimpleMap } from "../types/SimpleMap";

/**
 * Represents a command that can be registered
 */
type RegisterableCommand = new () => Command;

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
   * @param args The arguments for that command
   */
  static async run(command: string, ...args: any[]): Promise<any> {
    return await this.commands[command].run(...args);
  }

  /**
   * Runs a command instance that has not been registered
   * @param command The command being executed
   * @param args The arguments for that command
   */
  static async runUnregistered(command: Command | RegisterableCommand, ...args: any[]): Promise<any> {
    if ((command as Command).run) {
      return await (command as Command).run(...args);
    } else {
      return await (new (command as RegisterableCommand)).run(...args);
    }
  }
}