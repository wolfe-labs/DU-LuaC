#!/usr/bin/env node

/**
 * Simple Lua processor for combining and minifying Lua code for distribution
 */

const fs = require('fs')
const path = require('path')

// The compiler
const compile = require('./compiler')

// The minifier
const minify = require('luamin').minify

// The currently loaded libs
const libraries = {}

// The thing that boots up wrap.lua
const { spawnSync } = require('child_process')

// The default project file
const defaultBuildFile = 'project.json'
    
// Our wrap.lua file
const buildProg = path.join(__dirname, 'wrap.lua')

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
  library.root = path.dirname(path.join(library.path, library.project.sourcePath || 'src'))

  // Add to libraries
  libraries[library.id] = library
}

// Load package info
const cPackage = require(path.join(__dirname, 'package.json'))

// Welcome msg :)
console.info(`DU-LuaC compiler v${cPackage.version}`)

// The project JSON file
const projectSource = process.argv[2] || path.join(process.cwd(), defaultBuildFile)

// Logs
console.info(`Loading project file: ${projectSource}`)

// Check if project exists
if (!fs.existsSync(projectSource)) {
  console.error(`Project file [${projectSource}] was not found.`)
  process.exit(1)
}

// Read project file
const project = JSON.parse(fs.readFileSync(projectSource).toString())

// Load current project as library
loadLibrary({ id: project.name, path: process.cwd() })

// Read libraries
if (project.libs) {
  project.libs.map(loadLibrary)
}

// Runs builds
(project.builds || []).map(buildSpec => {
  // Info
  console.info(`Compiling build "${buildSpec.name}"...`)

  // Does the compile step
  const result = compile(project, buildSpec.name, libraries)

  // Gets the slots for autoconf
  const slots = Object.keys(buildSpec.slots || {}).map(slot => {
    // Get slot metadata
    const meta = buildSpec.slots[slot]

    // Generate string
    let slotString = slot

    // Include type, if possible
    if (meta.type) slotString += `:type=${meta.type}`

    // Done, returns the slot string
    return slotString
  });

  // Runs the build targets
  (project.targets || []).map(buildTarget => {
    // Info
    console.info(`Generating build files for target "${buildTarget.name}"...`)

    // Get a clean copy of the compile output
    let output = result.output

    // Minify?
    if (buildTarget.minify) output = minify(result.outputAST)

    // The base filename
    const file = path.join(process.cwd(), project.outputPath, buildTarget.name, buildSpec.name)

    // Generate build arguments
    const buildArgs = [
      // Add error-handling code?
      (buildTarget.handleErrors) ? '--handle-errors' : null,

      // Add slots for auto-mapping
      (slots.length > 0) ? '--slots' : null,
      ...slots,
    ].filter(arg => !!arg)

    // Create output dirs if needed
    if (!fs.existsSync(path.dirname(file))) {
      fs.mkdirSync(path.dirname(file), { recursive: true })
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
  })
})