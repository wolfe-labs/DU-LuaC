module.exports = function prettyPrintSize (size) {
  // kB
  if (size > 1024)
    return `${ (size / 1024).toFixed(2) } kB`

  // bytes
  return `${ size } bytes`
}