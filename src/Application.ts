import path from "path";

export default class Application {
  /**
   * Returns the path to the root of the app
   */
  static getPath(...pieces: string[]): string {
    return path.join(path.resolve(__dirname), '../', ...pieces);
  }
}