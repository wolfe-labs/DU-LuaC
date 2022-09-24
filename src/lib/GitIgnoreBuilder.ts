import fs from "fs";
import path from "path";

/**
 * A simple class for creating .gitignore files
 */
export default class GitIgnoreBuilder {
  /**
   * The entries to our file
   */
  private entries: string[] = [];

  /**
   * Creates a new .gitignore file
   * @param entries The entries to the .gitignore file
   */
  constructor(...entries: string[]) {
    this.addEntries(...entries);
  }

  /**
   * Removes duplicates from our entry list
   */
  private clearDuplicates() {
    const existingEntries: string[] = [];
    this.entries = this.entries.filter((entry) => {
      // Maintains empty lines
      if (entry.trim().length == 0) return true;

      // Maintains comments lines
      if (entry.trim().startsWith('#')) return true;

      // If the entry does not exist, let's register it
      if (!existingEntries.includes(entry)) {
        existingEntries.push(entry);
        return true;
      }

      // If we got here then chances are we got a repeating entry
      return false;
    });
  }

  /**
   * Adds new entires to be ignored
   * @param entries The entries being added to the .gitignore file
   */
  addEntries(...entries: string[]) {
    // Creates a new list with all the entries, some may be repeated
    this.entries = [
      ...this.entries,
      ...entries,
    ];

    // Removes duplicates
    this.clearDuplicates();
  }

  /**
   * Removes entires from the file
   * @param entries The entries to remove from the .gitignore file
   */
  removeEntries(...entries: string[]) {
    // Does some pre-trimming
    const trimmedEntries = entries.map((entry) => entry.trim());

    // Creates a new list with all the entries, some may be repeated
    this.entries = this.entries.filter((entry) => !trimmedEntries.includes(entry.trim()));

    // Removes duplicates
    this.clearDuplicates();
  }

  /**
   * Gets all entries on the .gitignore file
   */
  getEntries(): string[] {
    return this.entries;
  }

  /**
   * Gets a .gitignore-formatted string
   */
  toString(): string {
    return this.entries.join('\n');
  }

  /**
   * Saves the current .gitignore into a file
   * @param directory The directory where the .gitignore will be created
   */
  save(directory: string) {
    // Sanity check
    if (!fs.existsSync(directory) || !fs.statSync(directory).isDirectory()) {
      throw new Error('Invalid directory!');
    }

    // Writes our data
    fs.writeFileSync(path.join(directory, '.gitignore'), this.toString());
  }

  /**
   * Creates a new instance from a string
   * @param str The string of the .gitignore file
   */
  static fromString(str: string): GitIgnoreBuilder {
    return new this(...str.split('\n'));
  }

  /**
   * Creates a new instance from an existing file
   * @param file The file or directory path to the .gitignore file
   */
  static fromFile(file: string): GitIgnoreBuilder {
    // When file is a directory, try its .gitignore
    if (fs.statSync(file).isDirectory()) file = path.join(file, '.gitignore');

    // Checks if it extists
    if (!fs.existsSync(file)) throw new Error('Invalid .gitignore file!');

    // Does initialization
    return this.fromString(fs.readFileSync(file).toString());
  }
}