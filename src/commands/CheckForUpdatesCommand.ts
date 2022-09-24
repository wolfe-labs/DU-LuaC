import fs from 'fs';
import path from "path";
import Command, { CommandData } from "./Command";
import semver from "semver";
import axios from "axios";
import { CLI } from "../lib/CLI";
import ColorScheme from '../lib/ColorScheme';
import Application from "../Application";

export type UpdateInformation = {
  currentVersion: string,
  latestVersion: string,
  hasUpdate: boolean,
}

/**
 * A command that checks for new updates
 */
export default class CheckForUpdatesCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'check-updates';
  description = `Checks for new CLI updates`;

  // This is what runs our command
  async run({ options }: CommandData): Promise<UpdateInformation | null> {
    // This is our update cache location
    const updateCacheLocation = Application.getPath('cache.json');

    // Initializes a new cache if none is found
    if (!fs.existsSync(updateCacheLocation)) fs.writeFileSync(updateCacheLocation, '{}');

    // Loads up our cache
    const updateCache = require(updateCacheLocation);

    // Time between automated updates
    const timeBetweenChecks = 3 * 3600 * 1000; // 3 hours delay between update checks

    // Informs user
    if (!options.silent) CLI.print('Checking for updates...');

    // Reads our current CLI package
    const currentPackage = require(Application.getPath('package.json'));

    // By default use cached data
    let latestVersion = updateCache.lastUpdateAvailable;
    if (!options.useCache || !latestVersion || !updateCache.lastUpdateCheck || Date.now() >= updateCache.lastUpdateCheck + timeBetweenChecks) {
      try {
        // Reads our most recent CLI package
        const remotePackage = (await axios.get(`https://registry.npmjs.org/${currentPackage.name}`)).data;
        latestVersion = remotePackage['dist-tags'].latest;

        // Updates latest update info
        updateCache.lastUpdateAvailable = latestVersion;
        updateCache.lastUpdateCheck = Date.now();

        // Saves cache
        fs.writeFileSync(updateCacheLocation, JSON.stringify(updateCache));
      } catch (err) {
        // If we fail to check, warn on CLI and return null
        CLI.warn('Could not check for package updates!');
        return null;
      }
    }

    // Builds our result object
    const result = {
      currentVersion: currentPackage.version,
      latestVersion: latestVersion,
      hasUpdate: semver.lt(currentPackage.version, latestVersion),
    };

    // Shows update message
    if (result.hasUpdate) {
      const updateCommand = `npm i -g ${currentPackage.name}`
      CLI.print(`New version ${ColorScheme.highlight(`v${result.latestVersion}`)} available, run ${ColorScheme.highlight(updateCommand)} to update`);
    }

    // Done
    return result;
  }
}