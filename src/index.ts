#!/usr/bin/env node

import Colors from 'colors';
import { CLI, LogLevel } from './lib/CLI';
import GitClient from './lib/GitClient';

import CommandManager from './lib/CommandManager';
import CheckForUpdatesCommand from './commands/CheckForUpdatesCommand';
import Application from './Application';

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
  await CommandManager.runUnregistered(new CheckForUpdatesCommand, true, true);

  // Checks for Git
  if (!GitClient.isGitInstalled()) {
    CLI.warn(`No Git version detected! Install from ${Colors.yellow('https://git-scm.com/download')}`);
  }

  console.log(args);
}

// Invokes our main function, passes down the arguments without first two (which point to the node executable and the script)
main(process.argv.slice(2));