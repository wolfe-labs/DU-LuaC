#!/usr/bin/env node

/**
 * Simple Lua processor for combining and minifying Lua code for distribution
 */

const fs = require('fs')
const path = require('path')
const luamin = require('luamin')
const luaparse = require('luaparse')
const { spawnSync } = require('child_process')

const srcpath = []
const requires = []

function handleRequire (file) {
  // Process the file name
  const filename = handleFilename(file)

  // File not found?
  if (!filename) {
    console.error(`File not found: ${file}`)
    process.exit(1)
  }

  // Check if this file was not already included
  if (~requires.indexOf(filename)) {
    console.info(`File already included, skipping: ${filename}`)
    return ''
  }

  // Setup current path
  srcpath.unshift(path.dirname(file))

  // Gets the file contents
  const source = fs.readFileSync(filename).toString()

  // Process the file source and return it
  const result = handleSource(source)

  // Removes from path to keep working
  srcpath.shift()

  // Returns processed source
  return result
}

function handleFilename (file) {
  // Get absolute path
  file = path.join(srcpath[0], file)

  // Works on file
  if (fs.existsSync(file)) return file
  if (fs.existsSync(file + '.lua')) return file + '.lua'
  return null
}

function handleSource (source) {
  // All regexes go here
  const regex = {
    require: {
      expression: /require[\s]+[\'\"](.+?)[\'\"]/gi,
      handle: function (match, file) {
        return handleRequire(file)
      },
    },
  }

  // Executes each regex
  for (let key in regex) {
    source = source.replace(
      regex[key].expression,
      regex[key].handle
    );
  }

  // Returns processed source
  return source
}

// Push CWD into the compile directory
srcpath.unshift(process.cwd())

// The project JSON file
const projectSource = process.argv[2] || path.join(srcpath[0], 'build.json')

// Logs
console.info(`Loading project file: ${projectSource}`)

// Check if project exists
if (!fs.existsSync(projectSource)) {
  console.error(`Project file [${projectSource}] was not found.`)
  process.exit(1)
}

// Read project file
const project = JSON.parse(fs.readFileSync(projectSource).toString())

// Get entry point
const fileInput = process.argv[2] || 'src/main'
const fileOutput = process.argv[3] || 'out/main'

// Logs
console.info(`Fetching project entry point: ${project.entryPoint}`)

// Load first file and process it
let output = handleRequire(project.entryPoint)

// Logs
console.info(`Building LUA AST and checking for syntax errors...`)

// Generate the AST for error checking
let outputAST
try {
  outputAST = luaparse.parse(output)
} catch (e) {
  console.error('Error while parsing LUA file:')
  console.error(e)
  process.exit(1)
}

// Generate autoconf slots
const slots = Object.keys(project.slots || {}).map(slot => {
  // Get slot metadata
  const meta = project.slots[slot]

  // Generate string
  let slotString = slot

  // Include type, if possible
  if (meta.type) slotString += `:type=${meta.type}`

  // Done, returns the slot string
  return slotString
})

// Create output dir if needed
if (!fs.existsSync(path.dirname(project.output.path))) {
  fs.mkdirSync(path.dirname(project.output.path))
}

// Generate build arguments
const buildProg = path.join(__dirname, 'wrap.lua')
const buildArgs = [
  (project.handleErrors) ? '--handle-errors' : '',

  (slots.length > 0) ? '--slots' : '',
  ...slots,
]

// Build (normal)
if (project.output.complete) {
  // File output
  const file = path.resolve(project.output.path)

  // Output some logs
  console.info(`Preparing Lua output: ${file}`)

  // Write Lua files
  fs.writeFileSync(`${file}.lua`, output)

  // More logs
  console.info(`Generating autoconf file with following flags: ${buildArgs.join(' ')}`)

  // Generate autoconf
  const outputAutoconf = spawnSync('lua', [buildProg, `${file}.lua`, `${file}.json`, ...buildArgs]).output.join('\n').trim()
  
  // Shows any outputs
  if (outputAutoconf.length > 0) {
    console.log(outputAutoconf)
  }
}

// Build (minified)
if (project.output.minify) {
  // File output
  const file = path.resolve(project.output.path) + '.min'

  // Output some logs
  console.info(`Preparing Lua output: ${file}`)

  // Write Lua files
  fs.writeFileSync(`${file}.lua`, `-- ${(project.output.minifyHeaders || []).join("\n-- ")}\n${luamin.minify(outputAST)}`)

  // More logs
  console.info(`Generating autoconf file with following flags: ${buildArgs.join(' ')}`)

  // Generate autoconf
  const outputAutoconf = spawnSync('lua', [buildProg, `${file}.lua`, `${file}.json`, ...buildArgs]).output.join('\n').trim()
  
  // Shows any outputs
  if (outputAutoconf.length > 0) {
    console.log(outputAutoconf)
  }
}

// Yay!
console.info('Done.')