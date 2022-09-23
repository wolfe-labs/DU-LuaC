export default interface Command {
  /**
   * The command string used to invoke this command
   */
  readonly command: string;

  /**
   * The arguments for this command
   */
  readonly arguments?: string[];

  /**
   * The options for this command
   */
  readonly options?: string[];

  /**
   * The command description
   */
  readonly description: string;

  /**
   * Runs the specified command
   * @param args The arguments for that command
   */
  run(...args: any[]): Promise<any>;
}