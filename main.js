#!/usr/bin/env node

/**
 * CLI utility to work with DU-LuaC projects
 */

(async function main () {

  // Injects color-coding everywhere
  require('colors')

  const fs = require('fs-extra')
  const path = require('path')
  const exists = require('fs').existsSync

  const prompts = require('prompts')
  const library = require('./library')
  const elementTypes = require('./elementTypes')

  const Git = require('./GitClient')
  const semver = require('semver')
  const axios = require('axios')

  // Load package info
  const cPackage = require(path.join(__dirname, 'package.json'))

  // Cached data
  const cacheLocation = path.join(__dirname, 'cache.json')
  if (!fs.existsSync(cacheLocation))
    fs.writeFileSync(cacheLocation, '{}')
  const cache = require(cacheLocation)

  // Welcome msg :)
  console.info(`Lua CLI Utility for Dual Universe v${ cPackage.version } by Wolfe Labs @ Node ${ process.version }`)  

  // Update checks
  const timeBetweenChecks = 3 * 3600 * 1000 // 3 hours delay between update checks
  if (!cache.lastUpdateCheck || Date.now() >= cache.lastUpdateCheck + timeBetweenChecks) {
    // Runs update check
    try {
      const rPackage = (await axios.get(`https://registry.npmjs.org/${ cPackage.name }`)).data
      cache.lastUpdateAvailable = rPackage['dist-tags'].latest
    } catch (e) {
      console.info('Could not check for package updates!')
    }

    // Saves current update check time
    cache.lastUpdateCheck = Date.now()
  }

  // Update available message
  if (cache.lastUpdateAvailable && semver.lt(cPackage.version, cache.lastUpdateAvailable)) {
    console.info(`New version ${ `v${ cache.lastUpdateAvailable }`.blue } available, run ${ `npm i -g ${ cPackage.name }`.cyan } to update`)
  }

  // Notifies user if Git is missing
  if (!Git.isGitInstalled()) {
    console.info(`WARNING: No Git version detected! Install from https://git-scm.com/download`.yellow)
  }

  // Saves cache
  fs.writeFileSync(cacheLocation, JSON.stringify(cache))

  // Gets actual args, not the process name or "node"
  const args = process.argv.slice(2)

  // Gets the current command
  const command = args.shift()

  // Stores the possible new directory we'll be working on
  let newDir = null

  // Adds a new script
  async function scriptAdd (project, buildName, buildType, options) {
    // Gets the project builds
    project.builds = project.builds || {}

    // Generates the build path
    buildFile = path.join(project.sourcePath, `${buildName}.lua`)

    // If the build is not valid, errors
    if (!buildName) {
      console.error(`Invalid build name`)
      process.exit(1)
    }

    // If that already exists, notify user and exit
    if (library.projectHasBuild(project, buildName)) {
      console.info(`The build "${buildName}" already exists at current project. Exiting...`)
      process.exit(1)
    }

    // Adds file if not already existing
    if (!exists(buildFile)) {
      console.info(`Created new source file: ${buildFile}`)
      fs.ensureDirSync(path.dirname(buildFile))
      fs.writeFileSync(buildFile, fs.readFileSync(path.join(__dirname, 'lua', 'templates', `${ buildType || 'control' }.lua`)))
    } else {
      console.info(`Add existing source file: ${buildFile}`)
    }

    // Adds the new build definition
    project.builds[buildName] = Object.assign({
      name: buildName,
      type: buildType || 'control',
      slots: {},
    }, options || {})

    // Saves project and shows confirmation
    await library.saveProject(project)
  }

  // Addsa a new build target
  async function targetAdd (project, targetName, options) {
    // Options and defaults
    options = Object.assign({
      name: targetName,
      handleErrors: true,
      minify: false,
    }, options)

    // Gets the project builds
    project.targets = project.targets || {}

    // Adds the new build definition
    project.targets[targetName] = options

    // Saves project and shows confirmation
    await library.saveProject(project)
  }

  // Handles commands
  switch (command) {
    // Creates a new project, will chain down into 'init'
    case 'create':
      // Gets the project name and the directory
      newProjectName = args[0]
      newDir = args[0]

      // Checks for existing directory first
      if (exists(newDir)) {
        // Checks if the directory is empty
        if ((await fs.readdir(newDir)).length > 0) {
          console.error(`The directory "${newDir}" already exists and may contain files. Exiting...`)
          process.exit(1)
        }
      } else {
        // Makes the directory
        await fs.mkdir(newDir, { recursive: true })
      }

      // Changes CWD into the directory
      process.chdir(newDir)

    // Initializes at current directory
    case 'init':
      // Gets default project name
      newProjectName = args[0] || path.basename(process.cwd())

      // Gets a project file prototype
      project = Object.assign({ cli: { fmtVersion: 2 } }, await prompts([
        {
          type: 'text',
          name: 'name',
          message: `Enter your project name`,
          initial: newProjectName,
        },
        {
          type: 'text',
          name: 'description',
          message: `Enter your project description`
        },
        {
          type: 'text',
          name: 'sourcePath',
          message: `Enter your project's source directory`,
          initial: 'src',
        },
        {
          type: 'text',
          name: 'outputPath',
          message: `Enter your project's output directory`,
          initial: 'out',
        },
        {
          type: 'toggle',
          name: 'scaffolding',
          message: 'Do you want to initialize your project with a pre-set script and build target?',
          initial: true,
          active: 'yes',
          inactive: 'no',
        },
      ]))

      // Gets and clears scaffolding option
      const doScaffolding = !!project.scaffolding
      delete project.scaffolding

      // Sanity check
      if (!(project.name && project.sourcePath && project.outputPath)) {
        console.warn('Cancelled by the user!')
        process.exit()
      }

      // Makes the project.json file
      console.info(`Generating "project.json" file...`)
      await library.saveProject(project)

      // Makes the .gitignore
      console.info(`Generating ".gitignore" file...`)
      await fs.writeFile('.gitignore', [
        `libs/`,
        `temp/`,
        `${project.outputPath}/`,
      ].join('\r\n'))

      // Makes the README.md file
      console.info(`Generating "README.md" file...`)
      await fs.writeFile('README.md', [
        `# ${project.name}`,
        ``,
        `${project.description || 'No project description was provided'}`,
        ``,
        `This file was automatically generated by [DU-LuaC](https://github.com/wolfe-labs/DU-LuaC)'s interactive CLI.`,
      ].join('\r\n'))

      // Makes the source directory
      if (!fs.existsSync(project.sourcePath)) {
        console.info(`Generating source directory...`)
        await fs.mkdir(project.sourcePath)
      }
    
      // Adds default files and settings
      if (doScaffolding) {
        console.info(`Generating default build file and target...`)
        await scriptAdd(project, 'main')
        await targetAdd(project, 'development', {
          // Uses in-game error handling as it highlights the error on source
          handleErrors: false,

          // Disables minification
          minify: false,
        })
      }

      // Shows finished message
      console.info(`Project "${project.name}" created successfully!`)
    
      // For anyone using the "create" command, instruct them to "cd" into the directory
      if (newDir) {
        console.info(`To start working on your project, type "cd ${newDir}"`)
      }

      // Extra information
      console.info(`To build your project run either "du-lua build" or "du-luac" on your project's directory`)
      console.info(`Other commands are available by running "du-lua -h"`)
      break

    case 'script-add':
      // Gets current project
      project = await library.getProjectInfo(process.cwd())

      // Adds the build
      await scriptAdd(project, args[0], 'control')

      // Informs the user
      console.info(`The build "${args[0]}" was successfully added to your project!`)
      
      break

    case 'script-add-screen':
      // Gets current project
      project = await library.getProjectInfo(process.cwd())

      // Adds the build
      await scriptAdd(project, args[0], 'screen')

      // Informs the user
      console.info(`The render script "${args[0]}" was successfully added to your project!`)
      
      break

    case 'script-link':
      // Gets current project
      project = await library.getProjectInfo(process.cwd())

      // Gets the project builds
      project.builds = project.builds || {}

      // The build name
      buildName = args[0]

      // If the build is not valid, errors
      if (!buildName) {
        console.error(`Invalid build name`)
        process.exit(1)
      }
      
      // If build is not found, warn user
      if (!library.projectHasBuild(project, buildName)) {
        console.error(`The build "${buildName}" was not found. Exiting...`)
        process.exit(1)
      }

      // Prompt user for infos
      linkInfo = await prompts([
        {
          type: 'text',
          name: 'name',
          message: 'Give your element link a name, it will be used as a variable in Lua',
          validate: (value) => {
            // If empty
            if (0 == value.length) return 'You must give your element a name'

            // Prevent adding stuff with system names
            if (~['system', 'unit'].indexOf(value)) return 'You cannot override a system slot or variable!'

            // If already exists
            if (project.builds[buildName].slots[value]) return 'A slot with this name already exists!'

            // Passed
            return true
          }
        },
        {
          type: 'select',
          name: 'type',
          message: 'Select your element type, it will be used to filter events from this element',
          choices: Object.values(elementTypes),
        }
      ])

      // Sanity check
      if (!(linkInfo.name && linkInfo.type !== undefined)) {
        console.warn('Cancelled by the user!')
        process.exit()
      }

      // Adds to list
      project.builds[buildName].slots[linkInfo.name] = linkInfo

      // Saves and notifies user
      library.saveProject(project)
      console.info(`Your slot was added successfully!`)
      
      break

    case 'target-add':
      // Gets current project
      project = await library.getProjectInfo(process.cwd())

      // Prompts options
      targetInfo = await prompts([
        {
          type: 'text',
          name: 'name',
          message: 'Create a name for your build target',
          initial: 'development',
          validate: (value) => {
            // If already exists
            if (project.targets[value]) return 'A build target with this name already exists!'

            // Passed
            return true
          }
        },
        {
          type: 'toggle',
          name: 'handleErrors',
          message: 'Do you want to enable verbose error messages for this target? It will skip errors in the game Lua editor. Recommended for production',
          initial: false,
          active: 'yes',
          inactive: 'no',
        },
        {
          type: 'toggle',
          name: 'minify',
          message: 'Do you want to enable minified outputs for this target? Recommended for production',
          initial: false,
          active: 'yes',
          inactive: 'no',
        },
      ])

      // Sanity check
      if (!(targetInfo.name)) {
        console.warn('Cancelled by the user!')
        process.exit()
      }

      // Creates the build target
      targetAdd(project, targetInfo.name, targetInfo)

      // Informs user
      console.info(`The build target "${targetInfo.name}" was successfully added to your project!`)
      
      break

    // Runs build script
    case 'build':
      require('./build')(args)
      break

    // Imports a library
    case 'import':

    // Builds the intellisense for the current project
    case 'add-code-completion':
      console.info('Preparing code completion support...');
      await (require('./buildCodeCompletion')(process.cwd()));
      console.info('Code completion support built!');
      break

    // Updates the built-in JSON Codex
    case 'update-codex':
      console.info('Updating JSON Codex from GitHub...');
      const updatedCodex = (await axios.get('https://raw.githubusercontent.com/wolfe-labs/DU-OpenData/main/dist/Lua/Codex.json')).data;
      fs.writeFileSync(path.join(__dirname, 'Codex/Codex.json'), JSON.stringify(updatedCodex));
      console.info('JSON Codex updated!');
      break

    // Builds the built-in LuaDoc (for intellisense)
    case 'update-luadoc':
      console.info('Building LuaDoc code completion helper...');
      const updatedLuaDoc = require('./buildLuaDoc')(require(path.join(__dirname, 'Codex/Codex.json')));
      fs.writeFileSync(path.join(__dirname, 'Codex/Codex.lua'), updatedLuaDoc);
      console.info('LuaDoc code completion helper built successfully!');
      break

    // By default shows help
    case '-h':
    default:
      const commands = [
        { command: 'init',
          text: `Creates a new project on current directory` },
        { command: 'create', args: ['project-name'],
          text: `Creates a new project on the '${ `project-name`.cyan }' directory` },
        { command: 'import', args: ['library-path'],
          text: `Adds the library specified at that directory` },
        { command: 'import', args: ['library-git-repo'],
          text: `Clones the specified repository and includes it as library` },
        { command: 'script-add', args: ['script-name'],
          text: `Creates a new entry-point and creates the corresponding .lua script file` },
        { command: 'script-add-screen', args: ['script-name'],
          text: `Creates a new render script and its corresponding .lua script file` },
        { command: 'script-link', args: ['script-name'],
          text: `Assigns an event filter and Lua variable to a script` },
        { command: 'target-add',
          text: `Creates a new build target entry (development/production)` },
        { command: 'build', opts: [
          [`--project=${ `project-file.json`.cyan }`, `Provides a custom path to a project file`],
          [`--copy=${ `target-name/`.brightCyan }${ `build-name`.cyan }`, `Copies the specified build's JSON into your clipboard. If no target is provided, the first is selected`],
        ],
          text: `Builds the project on current directory` },
        { command: 'add-code-completion',
          text: `Adds extra local files to aid with code completion` },
      ]

      console.info(`Usage: du-lua (command) [args]`)
      console.info(`du-lua`.gray)
      
      // Creates list of command lines
      const commandLines = []
      commands.forEach((cmd) => {
        // Main command
        commandLines.push({
          left: `${ cmd.command.blue } ${ (cmd.args || []).join(' ').gray }`,
          right: cmd.text.trim(),
        })

        // Command options
        if (cmd.opts) {
          cmd.opts.forEach((opt) => {
            commandLines.push({
              left: `  ${ opt[0].gray }`,
              right: opt[1],
            })
          })
        }
      })

      // Displays the commands
      const regexCleanup = /\u001b\[.*?m/g
      const maxLeftSize = commandLines
        .map((line) => line.left.replace(regexCleanup, '').length)
        .reduce((acc, line) => Math.max(line, acc), 0)
      commandLines.forEach((commandLine) => {
        const padding = ' '.repeat(Math.max(0, maxLeftSize - commandLine.left.replace(regexCleanup, '').length))
        console.info(`  ${ commandLine.left }${ padding } : ${ commandLine.right }`)
      })
  }

}).call()