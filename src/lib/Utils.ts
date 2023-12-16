import fs from "fs";
import path from "path";

export default class Utils {
  /**
   * Reads a directory and all its subdirectories
   * @param dir The directory we're reading
   */
  static deepReadDirectory(dir: string): string[] {
    // Reads directory recursively
    const entries = fs.readdirSync(dir, { withFileTypes: true });
    const files: string[] = [];

    // Processes entries
    entries.forEach((entry) => {
      if (entry.isDirectory()) {
        files.push(
          ...this.deepReadDirectory(path.join(dir, entry.name)).map((file) => path.join(entry.name, file)),
        );
      } else {
        files.push(entry.name);
      }
    });

    // Done
    return files;
  }

  /**
   * Returns a deep copy of a certain object
   */
  static deepCopy<T>(object: T): T {
    return JSON.parse(JSON.stringify(object));
  }

  /**
   * Replaces a regex pattern in async mode
   * @param str 
   * @param regex 
   * @param replacer 
   */
  static async replaceAsync(str: string, regex: RegExp, replacer: (match: string, ...args: string[]) => Promise<string>): Promise<string> {
    const promises: Promise<string>[] = [];

    // Does first matching so we find all replacement strings
    str.replace(regex, (match: string, ...args: string[]) => {
      promises.push(
        replacer(match, ...args)
      );
      return match;
    });

    // Gets all replacements
    const data = await Promise.all(promises);

    // Does actual replacement of data
    return str.replace(regex, () => data.shift()!);
  }
}