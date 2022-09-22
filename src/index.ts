#!/usr/bin/env node

import { CLI, LogLevel } from './CLI';

/**
 * The main entry-point of our script
 * @param args The arguments for our main function
 */
async function main(args: string[]) {
  CLI.print('Hello!');
  CLI.status('TESTING', 'Hello!');
  CLI.success('Works');
  CLI.warn('Oops');
  CLI.error('Nope');
}

// Invokes our main function, passes down the arguments without first two (which point to the node executable and the script)
main(process.argv.slice(2));