import path from "path";
import fs from "fs";

export default class Application {
  /**
   * Returns the current version string
   */
  static getVersionString(): string {
    const latestBuildFile = this.getPath('.latestbuild');

    if (fs.existsSync(latestBuildFile)) {
      return fs.readFileSync(latestBuildFile).toString();
    }

    return `v${require(this.getPath('package.json')).version}`;
  }

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