import fs from "fs";
import path from "path";
import ColorScheme from "../lib/ColorScheme";
import CommandManager from "../lib/CommandManager";
import Command, { CommandData } from "./Command";
import InitializeProjectCommand from "./InitializeProjectCommand";

/**
 * A command that initializes a new project
 */
export default class CreateProjectCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'create';
  description = `Creates a new project on the '${ColorScheme.highlightArgument('project-name')}' directory`;
  args = ['project-name'];

  // This is what runs our command
  async run({ args, options }: CommandData) {
    // Gets our args
    const [projectName] = args;

    // Saves current working directory
    const cwd = process.cwd();

    // Checks if it already doesn't exist
    const projectDir = path.join(cwd, projectName);
    if (fs.existsSync(projectDir)) {
      throw new Error('Project with this name already exists!');
    }

    // Creates directory and sets current directory to it
    fs.mkdirSync(projectDir, { recursive: true });
    process.chdir(projectDir);

    // Invokes the init command
    await CommandManager.runUnregistered(InitializeProjectCommand, {
      args: [],
      options: {
        isNewDir: true,
        newProjectName: projectName,
      },
    });

    // When done, go back to current directory
    process.chdir(cwd);
  }
}