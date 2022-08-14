/**
 * Simple Lua processor for combining and minifying Lua code for distribution
 */

module.exports = async function (argv) {

  const fs = require('fs-extra')
  const path = require('path')

  const CLI = require('./cli')
  const CLITag = 'BUILDER'

  const clipboardy = (await import('clipboardy')).default
  
  const prettyPrintSize = require('./prettyPrintSize')

  // Unified error handling
  const BuildError = require('./BuildError')

  // The YAML utility
  const YAML = require('yaml')

  // The compiler
  const compile = require('./compiler')

  // The minifier
  const minify = require('@wolfe-labs/luamin').minify

  // The autoconf generators
  const buildJsonOrYaml = require('./buildJsonConf')
  const buildAutoconfig = require('./buildAutoConf')

  // The currently loaded libs
  const libraries = {}

  // The thing that boots up wrap.lua
  const { spawnSync } = require('child_process')

  // The default project file
  const defaultBuildFile = 'project.json'

  // This validates the builds
  const luaparse = require('luaparse')

  // Stubs to run DU Lua scripts in CLI
  const stubs = minify(fs.readFileSync(`${ __dirname }/lua/Stubs.lua`).toString())

  // Parses arg options
  const options = {}
  argv.forEach((arg) => {
    // Is that an option?
    if ('--' == arg.substr(0, 2)) {
      const raw = arg.substr(2).split('=')
      const name = raw.shift()
      const value = raw.join('=')
      options[name] = value
    }
  })

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
      CLI.error('Invalid library entry, missing "id" field:', library)
      process.exit(1)
    }

    // If library is already loaded, skip loading it
    if (libraries[library.id]) return

    // Check if the library is still pending download
    if (library.remote && library.remote.git && !fs.existsSync(library.path)) {
      // Tell user
      CLI.status(CLITag, `Fetching remote library "${library.id}"...`)

      // Fetches library
      await require('./library').loadExternalLibrary(library.remote.git, 'libs', library.path)
    }

    // Looks for the library file
    library.path = path.resolve(library.path)

    // Check if it exists
    if (!fs.existsSync(library.path)) {
      CLI.error(`Library path not found for library "${library.id}": ${library.path}`)
      process.exit(1)
    }

    // Checks if we're dealing with a "raw" library
    const isRawLibrary = (library.type && 'raw' == library.type);
    if (isRawLibrary) {
      CLI.status(CLITag, `Loading RAW library: "${library.id}"`)
      library.project = {
        name: library.name,
        libs: [],
        sourcePath: '/',
        outputPath: '/',
      };
    } else {
      // Check if the project file also exists
      const libProject = path.join(library.path, defaultBuildFile)
      if (!fs.existsSync(libProject)) {
        CLI.error(`Project file missing for library "${library.id}": ${libProject}`)
        process.exit(1)
      }

      // Log
      CLI.status(CLITag, `Loading project library: "${library.id}"`)

      // Fetch the library project
      library.project = JSON.parse(fs.readFileSync(libProject).toString())
    }

    // Checks for any missing dependencies from the library
    if (library.project.libs) {
      for (let k in library.project.libs) {
        await loadLibrary(library.project.libs[k])
      }
    }

    // Resolve the library root
    library.root = isRawLibrary 
      ? library.path 
      : path.dirname(path.join(library.path, defaultBuildFile))

    // Add to libraries
    libraries[library.id] = library
  }

  // Lua info
  const luaVersion = getLuaVersion()
  if (luaVersion) {
    CLI.print('Lua CLI tools found: ' + luaVersion.trim())
  } else {
    CLI.print('No Lua tools found on your system. This will not affect builds.')
    CLI.print('You can download the binaries at: http://luabinaries.sourceforge.net/')
  }

  // Skip line
  CLI.skip()

  // The project JSON file
  const projectSource = options.project
    ? path.resolve(options.project)
    : path.join(process.cwd(), defaultBuildFile)

  // The project working directory
  const projectWorkingDirectory = path.dirname(projectSource)

  // Logs
  CLI.info('PROJECT', `Loading project file: ${projectSource}`)

  // Check if project exists
  if (!fs.existsSync(projectSource)) {
    CLI.error(`Project file [${projectSource}] was not found.`)
    process.exit(1)
  }

  // Read project file
  const project = JSON.parse(fs.readFileSync(projectSource).toString())

  // Load current project as library
  await loadLibrary({ id: project.name, path: projectWorkingDirectory })

  // Read libraries
  if (project.libs) {
    for (let k in project.libs) {
      await loadLibrary(project.libs[k])
    }
  }

  // Skip line
  CLI.skip()

  // This will be true when clipboard has been used
  let hasUsedClipboard = false

  // Runs builds
  ;('object' == typeof project.builds ? Object.keys(project.builds) : project.builds || [])
    .map(buildName => Object.assign({ buildName, buildSpec: project.builds[buildName] }))
    .map(({ buildName, buildSpec }) => {
      // Skips line to keep things organized
      CLI.skip()

      // Info
      CLI.info(CLITag, `Compiling build "${ buildName.blue }"...`)

      // Supported export formats
      const exportFormats = []
      
      // Build type
      const buildType = buildSpec.type || 'control'
      switch (buildType) {
        case 'control':
          // Sets export formats
          exportFormats['json'] = true
          exportFormats['yaml'] = true
          exportFormats['conf'] = true
          exportFormats['lua'] = true
          break;
        case 'screen':
          // Sets export formats
          exportFormats['lua'] = true

          // Preset options
          buildSpec.noEvents = (undefined === buildSpec.noEvents) ? true : buildSpec.noEvents
          buildSpec.noPreload = (undefined === buildSpec.noPreload) ? true : buildSpec.noPreload
          buildSpec.noHelpers = (undefined === buildSpec.noHelpers) ? true : buildSpec.noHelpers
          break;
        default:
          CLI.error(`Invalid build type: "${ buildType }". Valid options: control, screen`);
          process.exit(1);
      }

      // Does the compile step
      const result = compile(project, buildName, buildSpec.name, libraries)

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
        // The build target identifier
        const buildTargetIdentifier = `"${ buildTarget.name.cyan }/${ buildName.blue }"`
        const buildTargetIdentifierRaw = `"${ buildTarget.name }/${ buildName }"`

        // Skips line to keep things organized
        CLI.skip()

        // Info
        CLI.info(CLITag, `Generating build files for target ${ buildTargetIdentifier }...`)

        // The build directory
        const dir = path.join(projectWorkingDirectory, project.outputPath, buildTarget.name)

        // The base filename
        const file = path.join(dir, buildSpec.name)

        // The autoconfig file (YAML, JSON)
        const autoconfBase = buildJsonOrYaml(project, buildSpec, result.resources.main, result.resources.libs, buildTarget.minify)

        // Estimates final Lua file size
        const limitLuaSize = 150 * 1024 // 150kb. TODO: This value needs some fixing, but considering there are scripts around 180kb working this should leave some headroom available
        const finalLuaSize = Buffer.byteLength(
          autoconfBase.handlers
            .map((handler) => handler.code)
            .join('\n'),
          'utf8'
        )

        // Checks if over the limit
        if (limitLuaSize > finalLuaSize) {
          CLI.info(CLITag, `Estimated Lua size: ${ prettyPrintSize(finalLuaSize) } (${ (100 * finalLuaSize / limitLuaSize).toFixed(2) }% out of ${ prettyPrintSize(limitLuaSize) })`)
        } else {
          CLI.warn(`Estimated Lua size over known limit: ${ prettyPrintSize(finalLuaSize) } (${ (100 * finalLuaSize / limitLuaSize).toFixed(2) }% out of ${ prettyPrintSize(limitLuaSize) })`)
        }

        // Verifies output of everything but events for syntax errors, generates Lua output too
        CLI.info(CLITag, `Generating LUA AST and checking for syntax errors...`)
        const output = autoconfBase.handlers.filter(handler => handler.filter.signature == 'start()').sort((a, b) => {
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
          // Runs the Lua parsing library just to check for any errors
          luaparse.parse(output)

          // Info
          CLI.success('No syntax errors found! Writing output files.')

          // Makes sure the directory exists first
          fs.ensureDirSync(path.dirname(file))

          // Write files

          // Lua
          if (exportFormats['lua']) {
            CLI.status(CLITag, 'Writing Lua output...')
            fs.writeFileSync(`${ file }.lua`, output)
          }

          // Lua + Stubs
          if (exportFormats['lua']) {
            CLI.status(CLITag, 'Writing Lua output (with stubs)...')
            fs.writeFileSync(`${ file }.stubs.lua`, `${ stubs }\n${ output }`)
          }

          // JSON
          if (exportFormats['json']) {
            CLI.status(CLITag, 'Writing JSON autoconfig...')
            fs.writeFileSync(`${ file }.json`, JSON.stringify(autoconfBase))
          }

          // YAML
          if (exportFormats['yaml']) {
            CLI.status(CLITag, 'Writing YAML autoconfig...')
            fs.writeFileSync(`${ file }.yaml`, YAML.stringify(autoconfBase))
          }

          // CONF
          if (exportFormats['conf']) {
            CLI.status(CLITag, 'Writing CONF autoconfig...')
            const autoconfConf = buildAutoconfig(project, autoconfBase)
            fs.writeFileSync(`${ file }.conf`, YAML.stringify(autoconfConf))
          }

          // Clipboard
          if (!hasUsedClipboard && options.copy) {
            const clipboardCopyName = ~options.copy.indexOf('/')
              ? `"${ options.copy }"`
              : `"${ buildTarget.name }/${ options.copy }"`

            if (clipboardCopyName == buildTargetIdentifierRaw) {
              hasUsedClipboard = true

              // Writes JSON (if format supports) or Lua to clipboard
              if (exportFormats['json']) {
                clipboardy.writeSync(JSON.stringify(autoconfBase))
              } else {
                clipboardy.writeSync(output)
              }

              CLI.status(CLITag, `Copied JSON contents into clipboard!`)
            }
          }

          // Done
          CLI.success(`Done writing files for build ${ buildTargetIdentifier }!`)
        } catch (err) {
          BuildError('Error parsing output', err, output)
        }
      })

      // Warns user if copy failed
      if (!!options.copy && !hasUsedClipboard)
        CLI.warn(`No build found matching '${ options.copy }' - didn't copy anything to clipboard!`)
    })

}