import { CLI } from "../lib/CLI";
import ColorScheme from "../lib/ColorScheme";
import { DULuaCompiler } from "../lib/DULuaCompiler";
import { BuildType } from "../types/Build";
import Project from "../types/Project";
import Command, { CommandData } from "./Command";

/**
 * A command that initializes a new project
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

  // This is what runs our command
  async run({ args, options }: CommandData) {
    // Gets current project
    const project = Project.load(process.cwd());

    // This is out CLI tag to show when building
    const CLITag = 'BUILDER';

    // Builds each of the entry-points
    const builds = project.getProjectBuilds();
    for (let iBuild in builds) {
      // This is the current build, let's let the end-user know
      const build = builds[iBuild];
      CLI.status(CLITag, `Starting build ${ColorScheme.highlight(build.name)}`);

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
          exportFormats.LUA = true;
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

      // Test
      console.log(buildResult);
    }

    throw new Error('Not implemented yet!');
  }
}