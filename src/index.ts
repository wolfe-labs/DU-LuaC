#!/usr/bin/env node

import Colors from 'colors';
import { CLI, LogLevel } from './lib/CLI';
import GitClient from './lib/GitClient';

import CheckForUpdatesCommand from './commands/CheckForUpdatesCommand';
import HelpCommand from './commands/HelpCommand';
import InitializeProjectCommand from './commands/InitializeProjectCommand';
import CreateProjectCommand from './commands/CreateProjectCommand';
import ImportLibraryCommand from './commands/ImportLibraryCommand';
import AddBuildCommand from './commands/AddBuildCommand';
import AddRenderScriptCommand from './commands/AddRenderScriptCommand';
import AddBuildLinkCommand from './commands/AddBuildLinkCommand';
import AddBuildTargetCommand from './commands/AddBuildTargetCommand';
import AddCodeCompletionCommand from './commands/AddCodeCompletionCommand';
import IgnoreNativeLibrariesCommand from './commands/IgnoreNativeLibrariesCommand';
import UpdateCodexCommand from './commands/UpdateCodexCommand';

import Application from './Application';
import CommandManager from './lib/CommandManager';
import CommandParser from './lib/CommandParser';
import BuildProjectCommand from './commands/BuildProjectCommand';

/**
 * The main entry-point of our script
 * @param args The arguments for our main function
 */
async function main(args: string[]) {
  // Reads our current CLI package
  const currentPackage = require(Application.getPath('package.json'));

  // Welcome message
  CLI.print(`Lua CLI Utility for Dual Universe v${currentPackage.version} by Wolfe Labs @ Node ${process.version}`);

  // Checks for updates
  await CommandManager.runUnregistered(CheckForUpdatesCommand, {
    args: [],
    options: {
      silent: true,
      useCache: true,
    },
  });

  // Checks for Git
  if (!GitClient.isGitInstalled()) {
    CLI.warn(`No Git version detected! Install from ${Colors.yellow('https://git-scm.com/download')}`);
  }

  // If no arguments are passed, let's do "help" instead
  if (args.length == 0) {
    args = ['help'];
  }

  // Registers a list of commands
  [
    HelpCommand,
    InitializeProjectCommand,
    CreateProjectCommand,
    ImportLibraryCommand,
    AddBuildCommand,
    AddRenderScriptCommand,
    AddBuildLinkCommand,
    AddBuildTargetCommand,
    BuildProjectCommand,
    AddCodeCompletionCommand,
    IgnoreNativeLibrariesCommand,
    UpdateCodexCommand,
  ].forEach((command) => CommandManager.registerCommand(command));

  // Executes commands
  CommandManager.execute(...args);
}

// Invokes our main function, passes down the arguments without first two (which point to the node executable and the script)
main(process.argv.slice(2));