import fs from "fs";
import ColorScheme from "../lib/ColorScheme";
import Build, { BuildType } from "../types/Build";
import Project from "../types/Project";
import Command, { CommandData } from "./Command";
import path from "path";
import { CLI } from "../lib/CLI";
import Application from "../Application";

/**
 * A command that adds a new build (entry-point)
 */
export default class AddBuildCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'script-add';
  description = `Creates a new entry-point and its corresponding .lua script file`;
  args = ['script-name'];
  options = {
    type: {
      format: `control`,
      description: `Sets the entry-point type, either to a Control Unit (${ColorScheme.highlightArgument('control')}) or Render Script (${ColorScheme.highlightArgument('screen')})`,
    },
  };

  // This is what runs our command
  async run({ args, options }: CommandData) {
    // Gets our args
    const [buildName] = args;

    // Handles no build passed
    if (!buildName || buildName.length == 0) {
      throw new Error('No build name provided!');
    }

    // Gets current project
    const project = Project.load(process.cwd());

    // Creates our entry-point
    const build = new Build({
      name: buildName.replace(/\\/g, '/'),
      type: options.type || BuildType.ControlUnit,
    });

    // Tries to add our entry-point
    project.registerBuild(build);

    // Handles file already existing
    const buildFilePath = path.join(project.getSourceDirectory(), build.getFilePath());
    if (fs.existsSync(buildFilePath)) {
      CLI.warn(`The file for build ${ColorScheme.highlight(build.name)} already exists, new file not created.`);
    } else {
      fs.writeFileSync(buildFilePath, fs.readFileSync(Application.getPath(`lua/templates/${build.type}.lua`)));
    }

    // Saves our project
    project.save();

    // Done
    CLI.success(`Entry-point ${ColorScheme.highlight(build.name)} added successfully!`);
  }
}