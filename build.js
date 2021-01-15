#!/usr/bin/env node

/**
 * Simple Lua processor for combining and minifying Lua code for distribution
 */

const fs = require('fs')
const path = require('path')
const luamin = require('luamin')
const luaparse = require('luaparse')
const { spawnSync } = require('child_process')
const { parse } = require('path')

const srcpath = []
const requires = []
const currentFiles = []
const currentLib = []

const preloads = []
const libraries = {}

const defaultBuildFile = 'build.json'

// Load package info
const cPackage = require(path.join(__dirname, 'package.json'))

// Welcome msg :)
console.info(`DU-LuaC compiler v${cPackage.version}`)

// Build script routine
function build (file, output, buildArgs) {
  // Our wrap.lua file
  const buildProg = path.join(__dirname, 'wrap.lua')

  // Output some logs
  console.info(`Preparing Lua output: ${file}`)

  // If output is a FUNCTION, execute it
  if ('function' == typeof output) {
    output = output(file)
  } else {
    output = output.toString()
  }

  // Write Lua files
  fs.writeFileSync(`${file}.lua`, output)

  // More logs
  console.info(`Generating autoconf file with following flags: ${buildArgs.join(' ')}`)

  // Generate autoconf
  const outputAutoconf = spawnSync('lua', [buildProg, `${file}.lua`, `${file}.json`, ...buildArgs]).output.join('\n').trim()
  
  // Shows any outputs
  if (outputAutoconf.length > 0) {
    console.info(outputAutoconf)
  }
}

// Load library
function loadLibrary (library) {
    // Checks if the "id" field is present
    if (!library.id) {
      console.error('Invalid library entry, missing "id" field:', library)
      process.exit(1)
    }

    // If library is already loaded, skip loading it
    if (libraries[library.id]) return

    // TODO: Handle library downloads

    // Looks for the library file
    library.path = path.resolve(library.path)

    // Check if it exists
    if (!fs.existsSync(library.path)) {
      console.error(`Library path not found for library "${library.id}": ${library.path}`)
      process.exit(1)
    }

    // Check if the project file also exists
    const libProject = path.join(library.path, defaultBuildFile)
    if (!fs.existsSync(libProject)) {
      console.error(`Project file missing for library "${library.id}": ${libProject}`)
      process.exit(1)
    }

    // Log
    console.info(`Loading project: "${library.id}"`)

    // Fetch the library project
    library.project = JSON.parse(fs.readFileSync(libProject).toString())

    // Resolve the library root
    library.root = path.dirname(path.join(library.path, library.project.entryPoint))

    // Add to libraries
    libraries[library.id] = library
}

function handleRequire (filename) {
  // Is this the root file
  const isRoot = !currentFiles[0]

  // Process the file name)
  const required = handleFilename(filename)

  // File not found?
  if (!required) {
    console.warn(`Required library/file not found: "${filename}" on file "${currentFiles[0]}", leaving statement alone...`)
    return null
  }

  // Extract the filename from require
  const file = required.file

  // Generate the require string
  const requireString = `${required.lib}:${required.filename}`

  // Check if this file was not already included
  if (~requires.indexOf(file)) {
    // console.info(`File already included, skipping: "${filename}"`)
    return { fqn: requireString, output: '' }
  }

  // Prevents file from being included twice
  requires.push(file)

  // Setup current path
  srcpath.unshift(path.dirname(file))

  // Info
  console.info(`Building file: ${file}`)

  // Gets the file contents
  const source = fs.readFileSync(file).toString()

  // Sets as active library/file
  currentLib.unshift(required.lib)
  currentFiles.unshift(file)

  // Process the file source and return it
  const result = handleSource(source)

  // Adds to preload list if not root file
  if (!isRoot) {
    preloads[requireString] = result
  }

  // Removes current library/file to move on to next one
  currentFiles.shift()
  currentLib.shift()

  // Removes from path to keep working
  srcpath.shift()

  // Returns processed source
  return { fqn: requireString, output: result }
}

function handleFilename (filename) {
  // The file we'll resolve
  let file = filename

  // Are we pointing to another project or the current one?
  const parsedProjectFile = file.split(':')

  // If no library exists, then use the current one
  if (parsedProjectFile.length == 1) parsedProjectFile.unshift(currentLib[0])

  // Handle external library files
  const lib = libraries[parsedProjectFile[0]]

  // Check if the library exists
  if (!lib) {
    return null
  }

  // If this is the first file we're working on, up one dir from the lib root
  if (!currentFiles[0]) {
    // Get the filename from the library
    file = path.join(path.dirname(lib.root), parsedProjectFile[1])
  } else {
    // Get the filename from the library
    file = path.join(lib.root, parsedProjectFile[1])
  }

  // Works on file
  if (fs.existsSync(file)) file = file
  else if (fs.existsSync(file + '.lua')) file = file + '.lua'
  else return null
  
  return {
    lib: parsedProjectFile[0],
    file: file,
    filename: parsedProjectFile[1],
  }
}

function handleSource (source) {
  // Validate source AST
  try {
    luaparse.parse(source)
  } catch (err) {
    handleParseError(err, source)
  }

  // All regexes go here
  const regex = {
    require: {
      expression: /require[\s\()]*[\'\"](.+?)[\'\"][\s]*[\)]*/gi,
      handle: function (match, file) {
        const fqn = handleRequire(file).fqn
        return `require('${fqn}')`
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

function handleParseError (err, code) {
  console.error(`Error parsing ${currentFiles[0] ? `file "${currentFiles[0]}"` : `output`} at line ${err.line}, column ${err.column}, index: ${err.index}:\n${err.message}`)
  console.error(`Problematic code line:`)
  console.error(code.split('\n')[err.line - 1])
  // console.error('----------------------------')
  // console.error(code)
  process.exit(1)
}

// Push CWD into the compile directory
srcpath.unshift(process.cwd())

// The project JSON file
const projectSource = process.argv[2] || path.join(srcpath[0], defaultBuildFile)

// Logs
console.info(`Loading project file: ${projectSource}`)

// Check if project exists
if (!fs.existsSync(projectSource)) {
  console.error(`Project file [${projectSource}] was not found.`)
  process.exit(1)
}

// Read project file
const project = JSON.parse(fs.readFileSync(projectSource).toString())

// Set it as current project
loadLibrary({ id: project.name, path: process.cwd() })
currentLib.unshift(project.name)

// Read libraries
if (project.libs) {
  project.libs.map(loadLibrary)
}

// Get entry point
const fileInput = process.argv[2] || 'src/main'
const fileOutput = process.argv[3] || 'out/main'

// Logs
console.info(`Fetching project entry point: ${project.entryPoint}`)

// Load first file and process it
const outputSource = handleRequire(project.entryPoint).output

// Combine preloads
const outputPreloads = []
for (let file in preloads) {
  let source = preloads[file]

  // Minify require statements if the complete flag is not enabled
  if (!project.output.complete) {
    source = luamin.minify(source)
  }

  outputPreloads.push(`package.preload['${file}'] = (function (...) ${source}; end)`)
}

// Combine all outputs
const output = outputPreloads.join('\n') + '\n' + outputSource

// Logs
console.info('Main script compilation done!')
console.info(`Building LUA AST and checking for syntax errors...`)

// Generate the AST for error checking
let outputAST
try {
  outputAST = luaparse.parse(output)
} catch (e) {
  handleParseError(e, output)
}

// Info
console.info('AST generated! Processing build outputs...')

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
const buildArgs = [
  (project.handleErrors) ? '--handle-errors' : null,

  (slots.length > 0) ? '--slots' : null,
  ...slots,
].filter(arg => !!arg)

// Build (normal)
build(
  path.resolve(project.output.path),
  output,
  buildArgs
)

// Build (minified)
if (project.output.minify) {
  build(
    path.resolve(project.output.path) + '.min',
    `${(project.output.minifyHeaders || []).map(header => `-- ${header}`).join("\n")}\n${luamin.minify(outputAST)}`,
    buildArgs
  )
}

// Yay!
console.info('Done.')