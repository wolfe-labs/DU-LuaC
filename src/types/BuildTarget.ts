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
}