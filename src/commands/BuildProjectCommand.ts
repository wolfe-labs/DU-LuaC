import fs from "fs";
import path from "path";
import YAML from "yaml";
import { CLI } from "../lib/CLI";
import ColorScheme from "../lib/ColorScheme";
import { DULuaCompiler } from "../lib/DULuaCompiler";
import { DULuaConfig } from "../lib/DULuaConfig";
import { BuildType } from "../types/Build";
import Project from "../types/Project";
import Command, { CommandData } from "./Command";

/**
 * A command that builds the project
 */
export default class BuildProjectCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'build';
  description = `Builds the current project`;
  options = {
    copy: {
      format: `target-name/${ColorScheme.highlightArgument('build-name')}`,
      description: `Copies the specified build's JSON into your clipboard. If no target is provided, the first is selected`,
    },
  };

  // This is out CLI tag to show when building
  private CLITag = 'BUILDER';

  // This is what runs our command
  async run({ args, options }: CommandData) {
    // Gets current project
    const project = Project.load(process.cwd());

    // Determines whether clipboard has been used or not
    let hasUsedClipboard = false;

    // Builds each of the entry-points
    const builds = project.getProjectBuilds();
    for (let iBuild in builds) {
      // This is the current build, let's let the end-user know
      const build = builds[iBuild];
      CLI.status(this.CLITag, `Starting build ${ColorScheme.highlight(build.name)}`);

      // Those are the formats we're exporting to
      const exportFormats = {
        JSON: false,
        YAML: false,
        CONF: false,
        LUA: false,
      };

      // In old projects, build types use "control" as default build type
      if (project.getProjectFormat() < 5) build.type = build.type || BuildType.ControlUnit;

      // Properly assigns the export formats
      switch (build.type) {
        case BuildType.ControlUnit:
          exportFormats.CONF = true;
          exportFormats.JSON = true;
          exportFormats.YAML = true;
          break;
        case BuildType.RenderScript:
          exportFormats.LUA = true;
          break;
        default:
          throw new Error([
            `Invalid build type ${ColorScheme.highlight(build.type)} on build ${ColorScheme.highlight(build.name)}`,
            `Valid options: ${ColorScheme.highlight('control')}, ${ColorScheme.highlight('screen')}`
          ].join('\n'));
      }

      // Invokes our compiler step
      const buildResult = await DULuaCompiler.compile(project, build);

      // Loops for every build target
      const buildTargets = project.getProjectBuildTargets();
      for (let iBuildTarget in buildTargets) {
        // Gets the said build target
        const buildTarget = buildTargets[iBuildTarget];

        // Generates the files
        CLI.status(this.CLITag, `Generating files for build target ${ColorScheme.highlight(buildTarget.name)}...`);
        const configFile = DULuaConfig.fromCompilerResult(buildResult, buildTarget);

        // Creates output directory
        const buildTargetPath = path.join(project.getOutputDirectory(), buildTarget.name);

        // The output directory for the file, without extension
        const buildOutputFile = path.join(buildTargetPath, build.name);

        // Ensures the path exists
        if (!fs.existsSync(path.dirname(buildOutputFile))) {
          fs.mkdirSync(path.dirname(buildOutputFile), { recursive: true });
        }

        // Exports our Lua file (if needed)
        if (exportFormats.LUA) {
          // Generates output Lua
          const output = DULuaConfig.restoreExports(buildTarget.minify ? DULuaConfig.runMinifier(buildResult.output) : buildResult.output, buildTarget.minify);
          fs.writeFileSync(`${buildOutputFile}.lua`, output);

          // Measures output size when Render Script
          if (build.type == BuildType.RenderScript) {
            this.printScriptUsage(this.getStringByteSize(output), 50000);
          }
        }

        // Exports our JSON file
        if (exportFormats.JSON) {
          fs.writeFileSync(`${buildOutputFile}.json`, JSON.stringify(configFile.toDUUnitConfig()));
        }

        // Exports our YAML file
        if (exportFormats.YAML) {
          fs.writeFileSync(`${buildOutputFile}.yaml`, YAML.stringify(configFile.toDUUnitConfig()));
        }

        // Exports our CONF file
        if (exportFormats.CONF) {
          // Generates output YAML
          const output = YAML.stringify(configFile.toDUAutoConfig());
          fs.writeFileSync(`${buildOutputFile}.conf`, output);

          // Measures output size
          this.printScriptUsage(this.getStringByteSize(output), 180000);
        }

        // Copies our build to the clipboard
        if (options.copy && !hasUsedClipboard) {
          // Checks for matching build and target
          if (build.name == options.copy || build.getFullName(buildTarget) == options.copy) {
            // Marks clipboard as used
            hasUsedClipboard = true;

            // Loads clipboardy
            const clipboard = (await import("clipboardy")).default;

            // Copies to clipboard
            switch (build.type) {
              case BuildType.ControlUnit:
                clipboard.writeSync(JSON.stringify(configFile.toDUUnitConfig()));
                break;
              case BuildType.RenderScript:
                clipboard.writeSync(DULuaConfig.restoreExports(buildTarget.minify ? DULuaConfig.runMinifier(buildResult.output) : buildResult.output, buildTarget.minify));
                break;
            }

            // Notifies user
            CLI.success(`Build ${ColorScheme.highlight(build.getFullName(buildTarget))} successfully copied to clipboard!`);
          }
        }
      }

      // Empty line for visibility
      CLI.skip();
    }

    // Done
    CLI.success('Build completed successfully!');
  }

  /**
   * Gets the Byte size of a string
   * @param str The string
   */
  private getStringByteSize(str: string): number {
    return Buffer.byteLength(str, 'utf8');
  }

  /**
   * Prints script size usage
   * @param currentBytes The current size of script
   * @param maxBytes The max size of the script
   */
  private printScriptUsage(currentBytes: number, maxBytes: number) {
    const percentage = 100 * currentBytes / maxBytes;
    const message = `${CLI.formatByteSize(currentBytes)} out of ${CLI.formatByteSize(maxBytes)} (${percentage.toFixed(2)}%)`;
    
    if (percentage > 100) {
      CLI.error(`Build is too large! Using ${message}`);
      CLI.error('Script contents might not persist in-game!');
    } else if (percentage > 90) {
      CLI.warn(`Build size: ${message}`);
    } else {
      CLI.status(this.CLITag, `Build size: ${message}`);
    }
  }
}