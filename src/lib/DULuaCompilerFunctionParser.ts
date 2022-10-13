import CompilerFunction from "../compiler_functions/CompilerFunction";
import LibraryEmbedFileFunction from "../compiler_functions/LibraryEmbedFileFunction";
import { SimpleMap } from "../types/SimpleMap";
import { CLI } from "./CLI";
import ColorScheme from "./ColorScheme";
import { DULuaCompiler, DULuaCompilerRegex } from "./DULuaCompiler";

/**
 * Helper to parse compiler functions
 */
export class DULuaCompilerFunctionParser {
  /**
   * Those are our registered functions
   */
  private regsiteredFunctions: CompilerFunction[] = [];

  /**
   * Creates a new parser
   */
  constructor() {
    // Registers our functions
    [
      LibraryEmbedFileFunction,
    ].forEach((fn) => this.registerFunction(fn));
  }

  /**
   * Registers a new compiler function
   */
  private registerFunction(fn: new () => CompilerFunction) {
    this.regsiteredFunctions.push(new fn);
  }

  /**
   * Tries to parse a Lua value
   * @param value The Lua of the value being parsed
   */
  private parseLuaValue(value: string): any {
    // Clean-up
    value = value.trim();

    // Parses strings
    if (
      value.startsWith('\'') && value.endsWith('\'') ||
      value.startsWith('\"') && value.endsWith('\"')
    ) return value.substring(1, value.length - 1)
        .replace(/\\\'/g, '\'')
        .replace(/\\\"/g, '\"');

    // Nil
    if ('nil' == value.toLowerCase())
      return null;

    // Booleans
    if ('true' == value.toLowerCase()) return true;
    if ('false' == value.toLowerCase()) return false;

    // Tries parsing a number
    try {
      return parseFloat(value);
    } catch (e) { }

    // Fails
    throw new Error('Invalid Lua expression!');
  }

  /**
   * Converts our functions into regex
   * @param prefix A prefix for our functions
   */
  generateRegex(compilerState: DULuaCompiler, prefix: string = 'fn__'): SimpleMap<DULuaCompilerRegex> {
    // This will be our result
    const result: SimpleMap<DULuaCompilerRegex> = {};

    // Processes our registered functions
    this.regsiteredFunctions.forEach((fn) => {
      // Pre-processes our function name
      const functionName = fn.name
        .replace(/\./g, '\\.');

      // Creates our regex
      const regex = new RegExp(`${functionName}[\\s]*\\((.*?)\\)`, 'g');

      // Creates our handler code
      const handler = (fullMatch: string, rawArguments: string): string => {
        // Parses Lua arguments
        const args: any[] = rawArguments.split(',')

          // Clean-up
          .map((arg) => arg.trim())

          // Processes arguments
          .map((arg) => {
            try {
              // Tries to parse this value
              return this.parseLuaValue(arg);
            } catch (err) {
              CLI.panic(`Invalid argument ${ColorScheme.highlight(arg)} for function ${ColorScheme.highlight(fn.name)}`);
            }
          });

        // Pipes data into our function
        return fn.invoke(compilerState, ...args);
      };

      // Done with this function
      result[`${prefix}${fn.name}`] = {
        expression: regex,
        handler,
      };
    });

    // Done
    return result;
  }
}