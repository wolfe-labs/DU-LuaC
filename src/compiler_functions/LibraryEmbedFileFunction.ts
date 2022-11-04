import fs from "fs";
import path from "path";
import ColorScheme from "../lib/ColorScheme";
import { DULuaCompiler } from "../lib/DULuaCompiler";
import CompilerFunction from "./CompilerFunction";

export default class LibraryEmbedFileFunction implements CompilerFunction {
  readonly name = 'library.embedFile';
  readonly args = ['file'];
  readonly description = `Embeds the provided file into the resulting Lua code`;

  invoke(compilerState: DULuaCompiler, file: string): string {
    // Asserts our file is inside the project (should be)
    const currentProject = compilerState.getCurrentProject()
    if (!currentProject) {
      throw new Error(`Embedding files is only allowed from inside a valid project!`);
    }

    // Gets the current file
    const currentFilePath = compilerState.getCurrentFile();

    // Gets the current directory
    const currentDirectory = path.dirname(currentFilePath);
    
    // Gets the desired path
    const embedFilePath = path.join(currentDirectory, file);

    // Asserts the file is inside our current project
    if (!currentProject.containsPath(embedFilePath)) {
      throw new Error([
        `Attempted to load file from outside project!`,
        `File: ${ColorScheme.highlight(embedFilePath)}`,
        `Source: ${ColorScheme.highlight(currentFilePath)}`,
        `Project: ${ColorScheme.highlight(currentProject.name)}`,
      ].join('\n'));
    }

    // Does the actual embedding
    const embedContent = fs.readFileSync(embedFilePath).toString()
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