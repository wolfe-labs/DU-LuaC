import { CompilerVariableSet } from "./CompilerVariable";

export default class BuildTarget {
  /**
   * The build target name
   */
  name: string = '';

  /**
   * Whether we should inject error handling
   */
  handleErrors: boolean = false;

  /**
   * Whether we should minify the output
   */
  minify: boolean = false;

  /**
   * After how many repetitions should we minify DU's globals (system, unit, etc)
   */
  minifyGlobalsCount: number|null = null;

  /**
   * After how many repetitions should we minify DU's global members (system.print, etc)
   */
  minifyGlobalMembersCount: number|null = null;

  /**
   * Whether we should we strip comments
   */
  stripComments: boolean = false;

  /**
   * Custom build-target specific compiler variables
   */
  variables: CompilerVariableSet = {};

  /**
   * Hydrates our build target
   * @param data The data for our build target
   */
  constructor(data: any = {}) {
    if (!data.name) {
      throw new Error(`Can't initialize a Build Target without a name! Data: ${JSON.stringify(data)}`);
    }

    this.name = data.name;
    this.minify = data.minify || false;
    this.minifyGlobalsCount = (true === data.minifyGlobals || 'number' == typeof(data.minifyGlobals)) ? (data.minifyGlobals === true) ? 3 : data.minifyGlobals : null;
    this.minifyGlobalMembersCount = (true === data.minifyGlobalMembers || 'number' == typeof(data.minifyGlobalMembers)) ? (data.minifyGlobalMembers === true) ? 3 : data.minifyGlobalMembers : null;
    this.handleErrors = data.handleErrors || false;
    this.stripComments = data.stripComments || false;
    this.variables = data.variables || {};
  }

  /**
   * Are we allowed to minify globals?
   */
  public isAllowedToMinifyGlobals(): boolean {
    return this.minifyGlobalsCount !== null;
  }

  /**
   * Are we allowed to minify global members?
   */
  public isAllowedToMinifyGlobalMembers(): boolean {
    return this.minifyGlobalMembersCount !== null;
  }
}