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
   * Whether we should minify DU's globals (system, unit, etc)
   */
  minifyOptions: any = {};

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
    this.minifyOptions = data.minifyOptions || null;
    this.handleErrors = data.handleErrors || false;
    this.stripComments = data.stripComments || false;
    this.variables = data.variables || {};
  }
}