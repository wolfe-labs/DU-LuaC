// Known log levels
const LogLevel = {
  debug: 0,
  info: 1,
  warning: 2,
  error: 3,
  none: 999,
};

// Gets current logging level
const currentLogLevel = LogLevel[(process.env.LOG_LEVEL || 'info').toLowerCase()] || LogLevel.info;

module.exports = {
  text: console.log,
  LogLevel,
  canPrint(logLevel) {
    return !(logLevel < currentLogLevel);
  },
  print() {
    if (!this.canPrint(LogLevel.info)) return;
    console.log.apply(console, [
      ...Array.from(arguments).slice(0),
    ])
  },
  error() {
    if (!this.canPrint(LogLevel.error)) return;
    console.error.apply(console, [
      '[ERROR]'.bold.brightRed,
      ...Array.from(arguments).slice(0),
    ])
  },
  warn() {
    if (!this.canPrint(LogLevel.warning)) return;
    console.warn.apply(console, [
      '[WARNING]'.bold.brightYellow,
      ...Array.from(arguments).slice(0),
    ])
  },
  code(code, level) {
    if (!this.canPrint(level || LogLevel.info)) return;
    console.error.apply(console, [
      code.trim().magenta,
    ])
  },
  info(title) {
    if (!this.canPrint(LogLevel.info)) return;
    console.info.apply(console, [
      `[${ title }]`.bold.blue,
      ...Array.from(arguments).slice(1),
    ])
  },
  status(title) {
    if (!this.canPrint(LogLevel.info)) return;
    console.info.apply(console, [
      `[${ title }]`.bold.gray,
      ...Array.from(arguments).slice(1),
    ])
  },
  success() {
    if (!this.canPrint(LogLevel.info)) return;
    console.info.apply(console, [
      '[SUCCESS]'.bold.green,
      ...Array.from(arguments).slice(0),
    ])
  },
  skip() {
    if (!this.canPrint(LogLevel.info)) return;
    console.info('')
  },
}