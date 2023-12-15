import prompts from "prompts";
import { CLI } from "../lib/CLI";
import ColorScheme from "../lib/ColorScheme";
import BuildTarget from "../types/BuildTarget";
import Project from "../types/Project";
import Command, { CommandData } from "./Command";

/**
 * A command that adds a new build target
 */
export default class AddBuildTargetCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'target-add';
  description = `Adds a build target to the project (development/production)`;

  // This is what runs our command
  async run({ args, options }: CommandData) {
    // Gets current project
    const project = Project.load(process.cwd());

    // Skips prompt, uses options instead
    const targetOptions = options.noPrompt
      ? {
        name: options.name || 'development',
        minify: options.minify || false,
        handleErrors: options.handleErrors || false,
      }
      : await prompts([
        {
          type: 'text',
          name: 'name',
          message: `Enter your build target name`,
          initial: options.newProjectName || '',
        },
        {
          type: 'toggle',
          name: 'minify',
          message: 'Do you want to enable minified outputs for this build target? Recommended for production',
          initial: false,
          active: 'yes',
          inactive: 'no',
        },
        {
          type: 'toggle',
          name: 'handleErrors',
          message: 'Do you want to enable redirection of errors to the Lua chat? Recommended for production',
          initial: false,
          active: 'yes',
          inactive: 'no',
        },
      ]);

    // Handles cancelled by user
    if (undefined === targetOptions.handleErrors) {
      throw new Error('Cancelled by user!');
    }

    // Creates our build target
    const buildTarget = new BuildTarget(targetOptions);

    // Adds our target to the project
    project.registerBuildTarget(buildTarget);

    // Saves our project
    project.save();

    // Done
    CLI.success(`Build target ${ColorScheme.highlight(buildTarget.name)} added successfully!`);
  }
}