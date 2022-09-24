import fs from "fs";
import Colors from "colors";
import prompts from "prompts";
import { CLI } from "../lib/CLI";
import Project from "../types/Project";
import Command, { CommandData } from "./Command";
import GitIgnoreBuilder from "../lib/GitIgnoreBuilder";

/**
 * A command that initializes a new project
 */
export default class InitializeProjectCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'init';
  description = `Creates a new project on current directory`;

  // This is what runs our command
  async run({ args, options }: CommandData) {
    // Our current project directory
    const projectDirectory = process.cwd();

    // Creates a project from current directory
    const project = new Project(projectDirectory);

    // Checks if a project.json file already exists here
    if (fs.existsSync(project.getProjectFile())) {
      throw new Error('Project already exists on current directory!');
    }

    // Runs project creation prompt
    const answers = await prompts([
      {
        type: 'text',
        name: 'name',
        message: `Enter your project name`,
        initial: options.newProjectName || '',
      },
      {
        type: 'text',
        name: 'description',
        message: `Enter your project description`
      },
      {
        type: 'text',
        name: 'sourcePath',
        message: `Enter your project's source directory`,
        initial: 'src',
      },
      {
        type: 'text',
        name: 'outputPath',
        message: `Enter your project's output directory`,
        initial: 'out',
      },
      {
        type: 'toggle',
        name: 'scaffolding',
        message: 'Do you want to initialize your project with a pre-set script and build target?',
        initial: true,
        active: 'yes',
        inactive: 'no',
      },
      {
        type: 'toggle',
        name: 'codeCompletion',
        message: 'Do you want to initialize your project with code completion?',
        initial: true,
        active: 'yes',
        inactive: 'no',
      },
      {
        type: 'toggle',
        name: 'ignoreDefaults',
        message: 'Do you want to prevent built-in DU libraries from showing up as errors?',
        initial: true,
        active: 'yes',
        inactive: 'no',
      },
    ]);

    // Fails when user cancels
    if (undefined === answers.ignoreDefaults) {
      throw new Error('Cancelled by the user!');
    }

    // Fails with invalid name
    if (0 == answers.name.trim().length) {
      throw new Error('Invalid project name!');
    }

    // Fails with source directory
    if (0 == answers.sourcePath.trim().length) {
      throw new Error('Invalid source directory!');
    }

    // Fails with output directory
    if (0 == answers.outputPath.trim().length) {
      throw new Error('Invalid output directory!');
    }

    // Debug
    CLI.print(`Creating ${Colors.yellow('project.json')} file...`);

    // Fills-in data
    project.name = answers.name;
    project.description = answers.description;
    project.sourcePath = answers.sourcePath;
    project.outputPath = answers.outputPath;

    // Debug
    CLI.print(`Creating ${Colors.yellow('.gitignore')} file...`);

    // Creates our .gitignore
    const gitignore = new GitIgnoreBuilder(...[
      `libs/`,
      `temp/`,
      `${project.outputPath}/`,
    ]);
    gitignore.save(projectDirectory);

    // Saves project
    project.save();
  }
}