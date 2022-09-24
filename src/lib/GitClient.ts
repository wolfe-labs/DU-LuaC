import parseGitUrl, { GitUrl } from "git-url-parse";
import child_process from 'child_process';

/**
 * A result from a Git command
 */
type GitClientResult = {
  status: number,
  output: string,
};

/**
 * A simple interface with the installed (CLI) Git client
 */
export default class GitClient {
  /**
   * Executes a Git command
   * @param command The Git command we're running
   * @param args The optional arguments for the Git command
   * @returns The result of that command or null, if it fails
   */
  static runGitCommand(command: string, ...args: string[]): GitClientResult | null {
    try {
      // Runs our Git process as a separate process
      const result = child_process.spawnSync('git', [command, ...args]);

      // Returns our status and output
      return {
        status: result.status || 0,
        output: result.output.toString(),
      };
    } catch (err) {
      // Returns nothing when something internal happens (usually when Git is not installed)
      return null;
    }
  }

  /**
   * Gets the current Git version
   * @returns The Git version, as string
   */
  static getVersion(): string | null {
    // Calls the Git command to get version
    const result = this.runGitCommand('version');

    // If the result is valid (should not be only when Git is not installed), parses and returns version
    if (result) {
      return Array.from(result.output.match(/git version (.*)/) || [])[1];
    }

    // If we got down here, then no version is available
    return null;
  }

  /**
   * Returns whether Git is installed or not on the current environment
   * @returns Whether Git is installed
   */
  static isGitInstalled(): boolean {
    return !!this.getVersion();
  }

  /**
   * Clones a Git repository locally
   * @param repository The repository URL we're cloning from
   * @param destination The destination path we're cloning to
   */
  static clone(repository: string, destination: string): GitClientResult {
    // Sanity check
    if (!this.isGitInstalled()) {
      throw new Error('You must have Git installed to clone this package!');
    }

    // Runs the command
    const result = this.runGitCommand('clone', repository, destination);

    // The value of result should never be null, unless some underlying problem happened in the system
    if (!result) {
      throw new Error('Unknown error');
    }

    // Handles Git errors
    if (result.status != 0) throw new Error(result.output);

    // Returns the command result
    return result;
  }

  /**
   * Parses a Git URL
   * @param url The Git URL being parsed
   */
  static parseGitUrl(url: string): GitUrl {
    return parseGitUrl(url);
  }
}