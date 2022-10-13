import _ from "lodash";
import Colors from "colors";
import Project from "../types/Project";
import Command, { CommandData } from "./Command";
import { CLI } from "../lib/CLI";

/**
 * A command that initializes a new project
 */
export default class IgnoreNativeLibrariesCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'ignore-native-libraries';
  description = `Adds project configuration to ignore errors from using DU's native Lua libraries (cpml, pl, util/event)`;

  // This is what runs our command
  async run({ args, options }: CommandData) {
    // Gets the current project
    const project = Project.load(process.cwd());

    // Updates list of ignored libraries
    project.internalPaths = _.uniq(project.internalPaths.concat(
      `autoconf/`,
      `cpml/`,
      `pl/`,
      `utils/event`,
    ));

    // Saves project
    project.save();

    // Done
    CLI.success(`Native libraries successfully registered`);
  }
}