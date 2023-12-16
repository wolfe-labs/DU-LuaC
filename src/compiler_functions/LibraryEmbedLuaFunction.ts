import fs from "fs";
import path from "path";
import ColorScheme from "../lib/ColorScheme";
import { DULuaCompiler } from "../lib/DULuaCompiler";
import CompilerFunction from "./CompilerFunction";
import { CLI } from "../lib/CLI";
import Build, { BuildType } from "../types/Build";
import BuildTarget from "../types/BuildTarget";
import { DULuaConfig } from "../lib/DULuaConfig";

export default class LibraryEmbedLuaFunction extends CompilerFunction {
  readonly name = 'library.embedLua';
  readonly args = ['file', 'compile', 'minify'];
  readonly description = `Embeds the provided Lua file into the resulting Lua code, optionally compiling and minifying it`;

  async invoke(compilerState: DULuaCompiler, file: string, compile?: string, minify?: string): Promise<string> {
    const cliTag = ' EMBED ';

    // Parses our parameters
    const shouldCompile = this.parseArgument(compile, false);
    const shouldMinify = this.parseArgument(minify, false);

    // Asserts our file is inside the project (should be)
    const currentProject = compilerState.getCurrentProject()
    if (!currentProject) {
      throw new Error(`Embedding files is only allowed from inside a valid project!`);
    }

    // Uses our compiler to get the path to a local (or library) Lua file
    const fileInfo = compilerState.getRequiredFileInfo(file);

    // Handles cases where the file is not found
    if (!fileInfo) {
      throw new Error([
        `Embedded file was not found!`,
        `File: ${ColorScheme.highlight(file)}`,
        `Source File: ${ColorScheme.highlight(compilerState.getCurrentFile())}`,
      ].join('\n'));
    }

    // Reads raw source code
    let luaOutput = fs.readFileSync(fileInfo.fullpath).toString();

    // Does compilation step (if necessary)
    if (shouldCompile) {
      // Invokes our compiler step
      CLI.status(cliTag, `Compiling embedded file ${ColorScheme.highlight(file)}...`);

      // Creates a new temp build object
      const build = new Build({
        name: `__TEMP__${file}`,
        type: BuildType.RenderScript,
      });

      // Generates a build target
      const buildTarget = new BuildTarget({ name: 'memory' });
      buildTarget.minify = shouldMinify;

      // Compiles
      const buildResult = await DULuaCompiler.compileRequire(compilerState.getCurrentProject()!, build, file, buildTarget, buildTarget.variables);

      // Saves our resulting file
      luaOutput = DULuaConfig.fromCompilerResult(buildResult, buildTarget).getMainCode();
    }

    // Does the actual embedding
    const embedContent = luaOutput
      // Escapes out any \r
      .replace(/\r/g, '')

      // Escapes our back slashes
      .replace(/\\/g, '\\\\')

      // Escapes our single quotes
      .replace(/\'/g, '\\\'')

      // Replaces new lines
      .replace(/\n/g, '\\n');

    // Returns our Lua value
    return `'${embedContent}'`;
  }
}