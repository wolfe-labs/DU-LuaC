import { DULuaCompiler } from "../lib/DULuaCompiler";

/**
 * Represents a Lua function callable by the compiler
 */
export default abstract class CompilerFunction {
  /**
   * The function name
   */
  readonly abstract name: string;

  /**
   * The function args
   */
  readonly abstract args: string[];

  /**
   * The function description
   */
  readonly abstract description: string;

  /**
   * Invokes our function
   */
  abstract invoke(compilerState: DULuaCompiler, ...args: any[]): string;

  /**
   * Parses an argument
   */
  parseArgument(value?: string|null, defaultValue: any = null): any {
    // Handles unknown value
    if (!value) {
      return defaultValue;
    }

    // Attempts to parse the JSON, returns default value if it fails
    try {
      return JSON.parse(value) || defaultValue;
    } catch (ex) {
      return defaultValue;
    }
  }
}