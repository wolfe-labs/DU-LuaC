module.exports = function (project, buildName, buildFile, libraries) {
  const _ = require('lodash');
  const fs = require('fs-extra')
  const path = require('path')
  const crypto = require('crypto')
  const luaparse = require('luaparse')
  
  const BuildError = require('./BuildError')
  const CLI = require('./cli')
  const CLITag = 'COMPILE'

  const srcpath = []
  const requires = []
  const currentFiles = []
  const currentLib = []

  const preloads = []

  const inlineRequires = !!project.builds[buildName].noPreload

  if (inlineRequires) CLI.info('COMPILE', `Build '${buildName}' will not include package.preload statements.`)

  // Builds project source Path
  const currentProjectSourcePath = path.join(process.cwd(), project.sourcePath)

  // Parses LUA_PATH
  const LUA_PATH = (process.env.LUA_PATH ?? '').split(';').filter(entry => entry.length > 0);
  CLI.info('COMPILE', `Found ${LUA_PATH.length} locations on LUA_PATH.`);

  // Gets a project's version
  function getLibVersion (lib) {
    return lib.project?.cli?.fmtVersion || 1;
  }

  // Is a certain path inside a certain directory?
  function isPathInsideProject (target) {
    // Converts the target path to absolute notation
    if (!path.isAbsolute(target)) {
      target = path.resolve(currentProjectSourcePath, target)
    }

    // Creates a relative path from current source directory and out absolute directory
    const relativePath = path.relative(currentProjectSourcePath, target)

    // If the relative path starts with '..' or is absolute (usually a different Windows disk), returns false
    return relativePath && !relativePath.startsWith('..') && !path.isAbsolute(relativePath)
  }

  function handleRequire (filename, sourceDirectory) {    
    // Is this the root file
    const isRoot = !currentFiles[0]

    // Process the file name)
    const required = handleFilename(filename, sourceDirectory ? [sourceDirectory] : [])

    // File not found?
    if (!required) {
      // A root file is missing, stop compiler
      if (isRoot) {
        CLI.error(`Project file not found: "${ filename.magenta }", exiting...`)
        return process.exit(1);
      }

      // Normal missing files
      CLI.warn(`Required library/file not found: "${ filename.magenta }" on file "${ currentFiles[0].yellow }", leaving statement alone...`)
      return null
    }

    // Extract the filename from require
    const file = required.file

    // Generate the require string
    let requireString = `${required.lib}:${required.filename}`

    const parsedRequire = requireString.split(':')
    const parsedRequirePackage = parsedRequire[0]
    const parsedRequirePath = parsedRequire.slice(1).join(':')

    // Gets the absolute require path
    const fileAbsolutePath = path.resolve(currentProjectSourcePath, parsedRequirePath)

    // Fixes/hashes external files
    if (!isPathInsideProject(parsedRequirePath)) {
      // Rewrites the require statement if outside the project directory
      const safePathHash = crypto.createHash('sha1')
        .update(fileAbsolutePath)
        .digest('hex')
        .slice(0, 10)
      const newRequireString = `:${ safePathHash }:${ path.basename(fileAbsolutePath) }`
      CLI.info('COMPILE', `External path hashed [${ newRequireString.green }] -> ${ fileAbsolutePath.yellow }`)
      requireString = newRequireString
    }

    // Check if this file was not already included
    if (~requires.indexOf(fileAbsolutePath)) {
      return { fqn: requireString, output: '' }
    }

    // Prevents file from being included twice
    requires.push(fileAbsolutePath)

    // Setup current path
    srcpath.unshift(path.dirname(file))

    // Info
    CLI.status(CLITag, `Compiling file: ${file}`)

    // Gets the file contents
    const source = fs.readFileSync(file).toString()

    // Sets as active library/file
    currentLib.unshift(required.lib)
    currentFiles.unshift(file)

    // Process the file source and return it
    const result = handleSource(source, file)

    // Adds to preload list if not root file
    if (!isRoot) {
      // Saves on preloads
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

  function handleFilename (filename, extraPaths) {
    // The file we'll resolve
    let file = filename

    // Are we pointing to another project or the current one?
    const parsedProjectFile = file.replace(/\\/g, '/').split(':')

    // If no library exists, then use the current one
    if (parsedProjectFile.length == 1) parsedProjectFile.unshift(currentLib[0])

    // Handle external library files
    const lib = libraries[parsedProjectFile[0]]

    // Check if the library exists
    if (!lib) {
      return null
    }

    // Gets our project's source path
    const projectSourcePath = path.join(lib.root, lib.project.sourcePath)

    // This ensures extra paths are only used on current project
    if (projectSourcePath != currentProjectSourcePath) extraPaths = [];

    // Generates our own LUA_PATH
    const internalLuaPath = _.flatten([
      ...(extraPaths || []),
      projectSourcePath,
    ].map((currentPath) => {
      return [
        // Allows requires with .lua extension
        // This will be deprecated, eventually
        (getLibVersion(lib) <= 2)
          ? path.join(currentPath, '?')
          : '',
        path.join(currentPath, '?.lua'),
      ]
    })).concat(LUA_PATH || []).filter((entry) => entry.length > 0)

    // Generates list of possible file pathes
    const possibleFilePaths = internalLuaPath.map(
      (path) => path.replace('?', parsedProjectFile[1])
    )

    // Figures out which file to use
    file = null;
    for (let iPath = 0; iPath < possibleFilePaths.length; iPath++) {
      // Extracts file path
      const path = possibleFilePaths[iPath]

      // Checks if file both exists AND is a file, so no directories are incorrectly attempted to be read
      if (fs.existsSync(path) && fs.statSync(path).isFile()) {
        // Stops of first match for performance
        file = path
        break
      }
    }

    // Displays warning when ending with .lua, fails on newer versions
    if ('.lua' == parsedProjectFile[1].substr(-4).toLowerCase()) {
      if (getLibVersion(lib) >= 3) {
        CLI.error(`Invalid require: "${ filename.red }" - requires should only contain the file name without the .lua extension!`);
        process.exit(1);
      } else if (!file) {
        CLI.warn(`Invalid require: "${ filename.yellow }" - requires should only contain the file name without the .lua extension!`);
      }
    }

    // Returns null in case the file was not found anywhere
    if (!file) return null
    
    return {
      lib: parsedProjectFile[0],
      file: file,
      filename: path.relative(projectSourcePath, file)
        .replace(/\\/g, '/') // Unifies paths to forward-slash
        .replace(/.lua$/g, ''), // Removes .lua from end of string
    }
  }

  function handleSource (source, sourceFilename) {
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
        handle (match, file) {
          // Does the require, should return null if not found
          const req = handleRequire(file, path.dirname(sourceFilename))

          if (req) {
            // If we're inlining requires, inlines it now
            if (inlineRequires) {
              return `(function()\n${req.output}\nend)()`
            }

            // If the require worked, use the FQN as the module name
            return `require('${req.fqn}')`
          } else {
            // If nothing was found, keep it the way it was
            return match
          }
        },
      },
      undefinedBehaviorPeriodNewlineNumeric: {
        expression: /([0-9])\.\r?\n/g,
        handle: function (match, number) {
          CLI.warn(`Undefined Behavior: Period character detected directly before line break on numeric value. Completing decimal with zero.`)
          return `${ number }.0\n`
        }
      },
      undefinedBehaviorPeriodNewline: {
        expression: /([0-9])\.\r?\n/g,
        handle: function (match, number) {
          CLI.warn(`Undefined Behavior: Period character detected directly before line break, may misbehave when minified or in different runtime implementations.`)
          return `${ number }.0\n`
        }
      }
    }

    // Handles exports first
    source = source
      .split('\n')
      .map((line) => ~line.indexOf('--export') ? line.replace(
        /(.*?)=(.*?)--[ ]*export:?(.*)?/g,
        function (match, varName, varDefault, varComment) {
          return `;__EXPORT_VARIABLE=[[{${ varName.trim() }}{${ varDefault.trim() }}{${ (varComment || '').trim() }}]];`
        }
      ) : line)
      .join('\n')

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
    BuildError(`Error parsing ${currentFiles[0] ? `file "${currentFiles[0]}"` : `output`}`, err, code)
    process.exit(1)
  }

  // Push CWD into the compile directory
  srcpath.unshift(process.cwd())

  // Push current project as library
  currentLib.unshift(project.name)

  // Get entry point
  const entryPoint = path.join(buildFile)

  // Logs
  CLI.status(CLITag, `Fetching project entry point: ${entryPoint}`)

  // Load first file and process it
  const outputSource = handleRequire(entryPoint).output

  // Combine preloads
  const outputPreloads = []
  if (!inlineRequires) {
    for (let file in preloads) {
      outputPreloads.push({
        path: file,
        source: `package.preload['${file}'] = (function (...) ${preloads[file]}; end)`,
        raw: preloads[file],
      })
    }
  }

  // Next step is for the main compiler
  return {
    resources: {
      main: outputSource,
      libs: outputPreloads,
    }
  }
}