import path from "path";

export default class Application {
  /**
   * Detects debug mode
   */
  static isDebugging(): boolean {
    return !!JSON.parse(process.env.DEBUG || 'false');
  }

  /**
   * Returns the path to the root of the app
   */
  static getPath(...pieces: string[]): string {
    return path.join(path.resolve(__dirname), '../', ...pieces);
  }

  /**
   * Returns the path to a resource in the temp directory
   */
  static getTempPath(...pieces: string[]): string {
    return this.getPath('temp', ...pieces);
  }
}