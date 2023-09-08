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
}