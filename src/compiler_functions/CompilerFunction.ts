import { DULuaCompiler } from "../lib/DULuaCompiler";

/**
 * Represents a Lua function callable by the compiler
 */
export default interface CompilerFunction {
  /**
   * The function name
   */
  readonly name: string;

  /**
   * The function args
   */
  readonly args: string[];

  /**
   * The function description
   */
  readonly description: string;

  /**
   * Invokes our function
   */
  invoke(compilerState: DULuaCompiler, ...args: any[]): string;
}