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
import { CompilerVariableSet } from "../types/CompilerVariable";
import CommandManager from "../lib/CommandManager";

/**
 * A command that builds the project
 */
export default class BuildProjectCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'build';
  description = `Builds the entire project or the provided build target (and single build name)`;
  args = ['build-target/build-name'];
  options = {
    copy: {
      format: `target-name/${ColorScheme.highlightArgument('build-name')}`,
      description: `Copies the specified build's JSON into your clipboard. If no target is provided, the first is selected`,
    },
    'var:name': {
      format: `true`,
      description: 'Sets the compiler variable "name" to "true"',
    },
  };

  // This is out CLI tag to show when building
  private CLITag = 'BUILDER';

  // This is what runs our command
  async run({ args, options }: CommandData) {
    // Gets current project
    const project = Project.load(process.cwd());

    // Optionally build a single target
    const specificBuildArg = args[0] || null;
    let specificBuildTarget: string | null = null;
    let specificBuildName: string | null = null;
    if (specificBuildArg) {
      const parsed = specificBuildArg.split('/');
      specificBuildTarget = parsed.shift();
      specificBuildName = parsed.length > 0 ? parsed.join('/') : null;
    }

    // Determines whether clipboard has been used or not
    let hasUsedClipboard = false;

    // Gets a list of command-line vars
    const variablePrefix = 'var:';
    const variables: CompilerVariableSet = {};
    for (const option in options) {
      if (option.startsWith(variablePrefix)) {
        // Sets variable
        const variable = option.substring(variablePrefix.length);
        const valueRaw = options[option];

        // Here we try to convert the value into a JS value
        let value = valueRaw;
        try {
          value = JSON.parse(valueRaw);
        } catch (ex) {
          // Nothing necessary
        }
        
        // Assigns and cleans-up
        variables[variable] = value;
        delete options[option];
      }
    }

    // Fetches list of builds
    const builds = specificBuildName
      ? project.getProjectBuilds().filter(build => build.name == specificBuildName)
      : project.getProjectBuilds();

    // If we have specified a build name, checks if it exists
    if (specificBuildName && builds.length == 0) {
      CLI.error(`Build ${ColorScheme.highlight(specificBuildName)} was not found on this project`)
      CLI.error(`Available builds: ${project.getProjectBuilds().map(build => ColorScheme.highlight(build.name)).join(', ')}`)
      process.exit(1);
    }

    // Builds each of the entry-points
    for (const build of builds) {
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

      // Fetches valid build targets
      const buildTargets = specificBuildTarget
        ? project.getProjectBuildTargets().filter(target => target.name == specificBuildTarget)
        : project.getProjectBuildTargets();

      // If we have specified a target, checks if it exists
      if (specificBuildTarget && buildTargets.length == 0) {
        CLI.error(`Build target ${ColorScheme.highlight(specificBuildTarget)} was not found on this project`)
        CLI.error(`Available build targets: ${project.getProjectBuildTargets().map(target => ColorScheme.highlight(target.name)).join(', ')}`)
        process.exit(1);
      }

      // Loops for every build target
      for (const buildTarget of buildTargets) {
        // Invokes our compiler step
        CLI.status(this.CLITag, `Starting build ${ColorScheme.highlight(build.name)} for target ${ColorScheme.highlight(buildTarget.name)}...`);
        const buildResult = await DULuaCompiler.compile(project, build, buildTarget, variables);

        // Generates the files
        CLI.status(this.CLITag, `Generating output files for target ${ColorScheme.highlight(buildTarget.name)}...`);
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
          const output = configFile.getMainCode();
          fs.writeFileSync(`${buildOutputFile}.lua`, output);

          // Measures output size when Render Script
          if (build.type == BuildType.RenderScript) {
            this.printScriptUsage(this.getStringByteSize(output), 50000, 'Render Script');
          }
        }

        // Exports our JSON file
        if (exportFormats.JSON) {
          fs.writeFileSync(`${buildOutputFile}.json`, JSON.stringify(configFile.toDUUnitConfig()));

          // Measures output size
          this.printScriptUsage(this.getStringByteSize(JSON.stringify(configFile.toDUUnitConfig(), null, 2)), 200000, 'JSON build');
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
          this.printScriptUsage(this.getStringByteSize(output), 180000, 'CONF build');
        }

        // Copies our build to the clipboard
        if (options.copy && !hasUsedClipboard) {
          // When passing a specific build and --copy, use that build name
          if (specificBuildName) {
            options.copy = specificBuildName;
          }

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
                clipboard.writeSync(configFile.getMainCode());
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

    // Silently rebuild local Codex for autocomplete
    await CommandManager.execute('add-code-completion', '--quiet');

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
  private printScriptUsage(currentBytes: number, maxBytes: number, buildType: string = 'Build') {
    const percentage = 100 * currentBytes / maxBytes;
    const message = `${CLI.formatByteSize(currentBytes)} out of ${CLI.formatByteSize(maxBytes)} (${percentage.toFixed(2)}%)`;
    
    if (percentage > 100) {
      CLI.warn(`${buildType} is too large! Using ${message}`);
      CLI.warn(`${buildType} contents might not persist in-game!`);
    } else if (percentage > 90) {
      CLI.warn(`${buildType} size: ${message}`);
    } else {
      CLI.status(this.CLITag, `${buildType} size: ${message}`);
    }
  }
}