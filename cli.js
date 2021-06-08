module.exports = {
  text: console.log,
  print() {
    console.log.apply(console, [
      ...Array.from(arguments).slice(0),
    ])
  },
  error() {
    console.error.apply(console, [
      '[ERROR]'.bold.brightRed,
      ...Array.from(arguments).slice(0),
    ])
  },
  warn() {
    console.warn.apply(console, [
      '[WARNING]'.bold.brightYellow,
      ...Array.from(arguments).slice(0),
    ])
  },
  code(code) {
    console.error.apply(console, [
      code.trim().magenta,
    ])
  },
  info(title) {
    console.info.apply(console, [
      `[${ title }]`.bold.blue,
      ...Array.from(arguments).slice(1),
    ])
  },
  status(title) {
    console.info.apply(console, [
      `[${ title }]`.bold.gray,
      ...Array.from(arguments).slice(1),
    ])
  },
  success() {
    console.info.apply(console, [
      '[SUCCESS]'.bold.green,
      ...Array.from(arguments).slice(0),
    ])
  },
  skip() {
    console.info('')
  },
}