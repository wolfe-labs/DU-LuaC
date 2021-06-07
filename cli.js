const colors = require('colors')
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
  code() {
    console.error.apply(console, [
      colors.magenta(
        ...Array.from(arguments).slice(0),
      ),
    ])
  },
  info(title) {
    console.info.apply(console, [
      colors.blue(`[${ title }]`),
      ...Array.from(arguments).slice(1),
    ])
  },
  status(title) {
    console.info.apply(console, [
      colors.gray(`[${ title }]`),
      ...Array.from(arguments).slice(1),
    ])
  },
  success() {
    console.info.apply(console, [
      colors.green('[SUCCESS]'),
      ...Array.from(arguments).slice(0),
    ])
  },
  skip() {
    console.info('')
  },
}