/**
 * Simple Lua processor for combining and minifying Lua code for distribution
 */

module.exports = async function (argv) {

  const fs = require('fs-extra')
  const path = require('path')

  // The YAML utility
  const YAML = require('yaml')

  // The compiler
  const compile = require('./compiler')

  // The minifier
  const minify = require('luamin').minify

  // The autoconf generator
  const autoconfig = require('./autoconf')

  // The currently loaded libs
  const libraries = {}

  // The thing that boots up wrap.lua
  const { spawnSync } = require('child_process')

  // The default project file
  const defaultBuildFile = 'project.json'

  // This validates the builds
  const luaparse = require('luaparse')

  // Gets current Lua version
  function getLuaVersion () {
    const luaVersion = spawnSync('lua', ['-v'])
    if (luaVersion && luaVersion.stdout) {
      return luaVersion.stdout.toString()
    } else {
      return null
    }
  }

  // Load library
  async function loadLibrary (library) {
    // Checks if the "id" field is present
    if (!library.id) {
      console.error('Invalid library entry, missing "id" field:', library)
      process.exit(1)
    }

    // If library is already loaded, skip loading it
    if (libraries[library.id]) return

    // Check if the library is still pending download
    if (library.remote && library.remote.git && !fs.existsSync(library.path)) {
      // Tell user
      console.info(`Fetching remote library "${library.id}"...`)

      // Fetches library
      await require('./library').loadExternalLibrary(library.remote.git, 'libs', library.path)
    }

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
    console.info(`Loading project library: "${library.id}"`)

    // Fetch the library project
    library.project = JSON.parse(fs.readFileSync(libProject).toString())

    // Checks for any missing dependencies from the library
    if (library.project.libs) {
      for (let k in library.project.libs) {
        await loadLibrary(library.project.libs[k])
      }
    }

    // Resolve the library root
    library.root = path.dirname(path.join(library.path, library.project.sourcePath || 'src'))

    // Add to libraries
    libraries[library.id] = library
  }

  // Lua info
  const luaVersion = getLuaVersion()
  if (luaVersion) {
    console.info('Lua CLI tools found: ' + luaVersion.trim())
  } else {
    console.warn('No Lua tools found on your system. This will not affect builds.')
    console.warn('You can download the binaries at: http://luabinaries.sourceforge.net/')
  }

  // Skip line
  console.info('')

  // The project JSON file
  const projectSource = argv[0] || path.join(process.cwd(), defaultBuildFile)

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
  await loadLibrary({ id: project.name, path: process.cwd() })

  // Read libraries
  if (project.libs) {
    for (let k in project.libs) {
      await loadLibrary(project.libs[k])
    }
  }

  // Skip line
  console.info('')

  // Runs builds
  ;('object' == typeof project.builds ? Object.values(project.builds) : project.builds || []).map(buildSpec => {
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
    })

    // Runs the build targets
    ;('object' == typeof project.targets ? Object.values(project.targets) : project.targets || []).map(buildTarget => {
      // Info
      console.info(`Generating build files for target "${buildTarget.name}"...`)

      // The base filename
      const file = path.join(dir, buildSpec.name)

      // The autoconfig file
      const autoconf = autoconfig(project, buildSpec, result.resources.main, result.resources.libs, buildTarget.minify)

      // Verifies output of everything but events for syntax errors, generates Lua output too
      console.info(`Building LUA AST and checking for syntax errors...`)
      const output = autoconf.handlers.filter(handler => handler.filter.signature == 'start()').sort((a, b) => {
        // Different slots, priority by slot position
        if (a.filter.slotKey < b.filter.slotKey) return -1
        if (a.filter.slotKey > b.filter.slotKey) return 1

        // Same slot, priority of which handler is first
        if (a.key < b.key) return -1
        if (a.key > b.key) return 1

        // This should not happen but anyways...
        return 0
      }).map(handler => handler.code).join('\n\n')

      try {
        // Generate the AST for error checking
        const outputAST = luaparse.parse(output)

        // Info
        console.info('-> No syntax errors found!')

        // Makes sure the directory exists first
        fs.ensureDirSync(dir)

        // Write files

        // Lua
        console.info('-> Writing Lua output...')
        fs.writeFileSync(`${ file }.lua`, output)

        // JSON
        console.info('-> Writing JSON autoconfig...')
        fs.writeFileSync(`${ file }.json`, JSON.stringify(autoconf))

        // JSON
        console.info('-> Writing YAML autoconfig...')
        fs.writeFileSync(`${ file }.yaml`, YAML.stringify(autoconf))
      } catch (err) {
        console.error(`Error parsing output at line ${err.line}, column ${err.column}, index: ${err.index}:\n${err.message}`)
        console.error(`Problematic code line:`)
        console.error(output.split('\n')[err.line - 1])
        process.exit(1)
      }
    })
  })

}