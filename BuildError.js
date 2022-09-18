const CLI = require('./cli')

module.exports = function BuildError (message, err, source) {
  CLI.error(`${message} at line ${err.line}, column ${err.column}, index: ${err.index}: ${err.message}`)
  CLI.error(`Problematic code line:`)
  if (source) {
    CLI.code(source.split('\n')[err.line - 1], CLI.LogLevel.error)
  }
  process.exit(1)
}