import fs from "fs";
import Colors from "colors";
import Project from "../types/Project";
import Command, { CommandData } from "./Command";
import Library from "../types/Library";
import { CLI } from "../lib/CLI";
import ColorScheme from "../lib/ColorScheme";

/**
 * A command that initializes a new project
 */
export default class ImportLibraryCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'import';
  description = `Imports a library into the project, where '${Colors.cyan('library')}' is either a directory or Git path`;
  args = ['library'];

  // This is what runs our command
  async run({ args, options }: CommandData) {
    // Gets our args
    const [libraryPath] = args;

    // Gets current project
    const project = Project.load(process.cwd());

    // This will be our library
    let library: Library;

    // Checks if this is a valid path first
    if (fs.existsSync(libraryPath) && fs.statSync(libraryPath).isDirectory()) {
      // Status update
      CLI.print(`Loading library from local path...`);

      // Okay, let's import from local filesystem
      library = Library.loadFromLocalPath(project, libraryPath);
    } else {
      // Status update
      CLI.print(`Loading library from Git repository...`);

      // Okay, let's try to import from Git
      library = Library.loadFromGit(project, libraryPath);
    }

    // Adds our library to our project
    project.registerLibrary(library);

    // Saves project changes
    project.save();

    // Status update
    CLI.success(`Library ${ColorScheme.highlight(library.id)} registered successfully!`);
  }
}