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

  // Load package info
  const cPackage = require(path.join(__dirname, 'package.json'))

  // Welcome msg :)
  console.info(`Lua CLI Utility for Dual Universe v${cPackage.version} by Wolfe Labs @ Node ${process.version}`)

  // Notifies user if Git is missing
  if (!Git.isGitInstalled()) {
    console.info(`WARNING: No Git version detected! Install from https://git-scm.com/download`.yellow)
  }

  // Gets actual args, not the process name or "node"
  const args = process.argv.slice(2)

  // Gets the current command
  const command = args.shift()

  // Stores the possible new directory we'll be working on
  let newDir = null

  // Adds a new script
  async function scriptAdd (project, buildName) {
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
      fs.writeFileSync(buildFile, fs.readFileSync(path.join(__dirname, 'lua', 'Initial.lua')))
    } else {
      console.info(`Add existing source file: ${buildFile}`)
    }

    // Adds the new build definition
    project.builds[buildName] = { name: buildName, slots: {} }

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
      project = await prompts([
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
      ])

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
      await scriptAdd(project, args[0])

      // Informs the user
      console.info(`The build "${args[0]}" was successfully added to your project!`)
      
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
      // Gets current project
      project = await library.getProjectInfo(process.cwd())

      // If no libs are present, add a libs key
      project.libs = project.libs || []

      // Gets the current path
      importLibRaw = args[0]

      // Checks if the specified path exists
      if (exists(importLibRaw)) {
        // Imports found library
        importLib = await library.getProjectInfo(importLibRaw)

        // Checks if valid project
        if (!importLib) {
          console.error(`No valid library found at path: ${importLibRaw}`)
          process.exit(1)
        }

        // Checks if project already has it
        if (library.projectHasLibrary(project, importLib.name)) {
          console.error(`The specified library was already in the project. Exiting...`)
          process.exit(1)
        }

        // Generates project info
        project.libs.push({
          id: importLib.name,
          path: importLibRaw,
        })

        // Saves
        await library.saveProject(project)

        // Informs user
        console.info(`The library "${importLib.name}" was successfully imported into your project!`)
        console.info(`Please note that, this library was fetched from a local path and may not work properly in other machines`)
      } else {
        // Tries to parse Git URL
        importLib = await library.loadExternalLibrary(importLibRaw, 'libs')

        // Validates, protocol MUST NOT be 'file' as it may point to an invalid local path
        if (importLib) {
          // Check if we already have this library
          if (library.projectHasLibrary(project, importLib.name)) {
            // Informs user that library is present and only it was updated
            console.info(`The current project already has the library "${importLib.name}" present and only the library was updated`)
          } else {
            // Saves the new library
            project.libs.push({
              id: importLib.name,
              type: importLib.type,
              path: importLib.path,
              remote: {
                git: importLibRaw,
              }
            })
            await library.saveProject(project)

            // Finishes with some log
            console.info(`The library "${importLib.name}" was successfully imported into your project!`)
            console.info(`Usage: require("${importLib.name}:FileName")`)
          }
        } else {
          // Errors
          console.error(`Could not resolve library: "${importLibRaw}"`)
          process.exit(1)
        }
      }
      break

    // By default shows help
    case '-h':
    default:
      console.info([`Usage: du-lua (command) [args]`,
        `Project Commands:`,
        `  create project-name                : Creates a new project on the "project-name" directory`,
        `  init                               : Creates a new project on current directory`,
        `  build                              : Builds the project on current directory`,
        `  import [library-path]              : Adds the library specified at that directory`,
        `  import [library-git-repo]          : Clones the specified repository and includes it as library`,
        ``,
        `Script Commands:`,
        `  script-add [script-name]           : Creates a new entry-point and creates the corresponding .lua script file`,
        `  script-link [script-name]          : Assigns an event filter and Lua variable to a script`,
        ``,
        `Target Commands:`,
        `  target-add                         : Creates a new build target entry (development/production)`,
      ].join('\r\n').trim())
  }

}).call()