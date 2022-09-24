import Colors from "colors";

/**
 * The color scheme used by the CLI
 */
export default class ColorScheme {
  /**
   * Highlights some text
   * @param str The text being highlighted
   */
  static highlight(str: string) {
    return Colors.yellow(str);
  }

  /**
   * Colors a normal command
   * @param str The command being printed
   */
  static command(str: string) {
    return Colors.blue(str);
  }

  /**
   * Colors a normal argument
   * @param str The argument being printed
   */
  static argument(str: string) {
    return Colors.gray(str);
  }

  /**
   * Highlights some argument
   * @param str The argument being highlighted
   */
  static highlightArgument(str: string) {
    return Colors.cyan(str);
  }
}