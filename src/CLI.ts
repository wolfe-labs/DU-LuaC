import { SimpleMap } from './types/SimpleMap';

// This will be used for colors
import Colors from 'colors';

/**
 * A list of all valid log levels
 */
enum LogLevel {
  DEBUG = 'debug',
  INFO = 'info',
  WARNING = 'warning',
  ERROR = 'error',
  NONE = 'none',
}

/**
 * Representas the value of each logging level
 */
const logLevelValues: SimpleMap<number> = {
  debug: 0,
  info: 1,
  warning: 2,
  error: 3,
  none: 999,
}

// Our default log level
const defaultLogLevel = 'info';

// Gets log level from the environment
const environmentLogLevel = process.env.LOG_LEVEL || defaultLogLevel;

// Gets the actual level value
const currentLogLevel = logLevelValues[environmentLogLevel];

/**
 * Represents our command-line wrapper
 */
class CLI {
  /**
   * Checks if we can print something at this log level
   * @param logLevel The log level for the desired message
   */
  static canPrint(logLevel: LogLevel): boolean {
    return currentLogLevel <= logLevelValues[logLevel];
  }

  /**
   * Prints data to the console depending on log level, same as console.log
   * @param data The data being printed
   */
  static print(...data: any[]) {
    // Checks for valid logging level
    if (!this.canPrint(LogLevel.INFO)) return;

    // Prints data
    console.log(...data);
  }

  /**
   * Prints an warning to the command-line
   * @param data The warning information
   */
  static warn(...data: any[]) {
    // Checks for valid logging level
    if (!this.canPrint(LogLevel.WARNING)) return;

    // Prints data
    console.warn(
      Colors.yellow('[WARNING]'),
      ...data
    );
  }

  /**
   * Prints an error to the command-line
   * @param data The error information
   */
  static error(...data: any[]) {
    // Checks for valid logging level
    if (!this.canPrint(LogLevel.ERROR)) return;

    // Prints data
    console.error(
      Colors.red('[ERROR]'),
      ...data
    );
  }

  /**
   * Prints some code to the command-line
   * @param code The code being logged
   * @param logLevel The log level for this print
   */
  static code(code: string, logLevel: LogLevel = LogLevel.INFO) {
    // Checks for valid logging level
    if (!this.canPrint(logLevel)) return;

    // Prints data
    console.info(code.trim());
  }

  /**
   * Prints some data with the "[TITLE] Data" format
   * @param title The title or area of the application sending the message
   * @param data The data being printed
   */
  static status(title: string, ...data: string[]) {
    // Checks for valid logging level
    if (!this.canPrint(LogLevel.INFO)) return;

    // Prints data
    console.info(
      Colors.gray(`[${title}]`),
      ...data
    );
  }

  /**
   * Prints a success message
   * @param data The data being printed
   */
  static success(...data: string[]) {
    // Checks for valid logging level
    if (!this.canPrint(LogLevel.INFO)) return;

    // Prints data
    console.info(
      Colors.green(`[SUCCESS]`),
      ...data
    );
  }

  /**
   * Skips a line on the command-line
   */
  static skip() {
    // Checks for valid logging level
    if (!this.canPrint(LogLevel.INFO)) return;

    // Prints a new empty line
    console.log('');
  }
}

// Exposes our stuff
export {
  CLI,
  LogLevel,
};