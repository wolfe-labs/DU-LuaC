const fs = require('fs-extra')
const path = require('path')  
const exists = require('fs').existsSync

const Git = require('nodegit')
const GitUrlParse = require('git-url-parse')

const crypto = require('crypto')
const sshpk = require('sshpk')
const sha1 = require('sha1')
  
module.exports = class Library {

  static async saveProject (project, path) {
    return await fs.writeFile(path || 'project.json', JSON.stringify(project, null, '  '))
  }

  static projectHasLibrary (project, library) {
    for (let k in project.libs || []) {
      if (project.libs[k].id == library) return true
    }
    return false
  }

  static projectHasBuild (project, build) {
    return !!project.builds[build]
  }

  static projectHasTarget (project, target) {
    return !!project.targets[target]
  }

  static async getKeys () {
    const pathKeys = path.join(__dirname, 'keys')
    const pathKPublic = path.join(pathKeys, 'id.pub')
    const pathKPrivate = path.join(pathKeys, 'id')

    // Checks if key directory exits
    if (!exists(pathKeys)) {
      await fs.mkdir(pathKeys, { recursive: true })
    }

    // Checks if keys exist, if not then generates them
    if (!(exists(pathKPrivate) && exists(pathKPublic))) {
      // Generates keys
      const keysGen = crypto.generateKeyPairSync('ed25519', {
        publicKeyEncoding: {
          type: 'spki',
          format: 'pem',
        },
        privateKeyEncoding: {
          type: 'pkcs8',
          format: 'pem',
        },
      })

      // Writes them to disk
      await fs.writeFile(pathKPublic, keysGen.publicKey)
      await fs.writeFile(pathKPrivate, keysGen.privateKey)
    }

    // Fetches both keys in original format
    const keys = {
      public: await fs.readFile(pathKPublic),
      private: await fs.readFile(pathKPrivate),
    }

    // Converts them to SSH format
    keys.public_ssh = sshpk.parseKey(keys.public).toString('ssh')
    keys.private_ssh = sshpk.parsePrivateKey(keys.private).toString('ssh')

    // Returns keys
    return keys
  }

  static async loadExternalLibrary (gitUrl, libDir, destDir) {
    // Tries to parse Git URL
    const gitInfo = GitUrlParse(gitUrl)

    // Destination or default to temp
    const destination = destDir || path.join(__dirname, 'temp/' + sha1(gitUrl))

    // If no destination set and temp exists, recreate it
    if (!destDir) {
      if (exists(destination)) {
        await fs.rmdir(destination, { recursive: true })
      }
      await fs.mkdir(destination, { recursive: true })
    } else {
      if (!exists(path.dirname(destination))) {
        await fs.mkdir(path.dirname(destination), { recursive: true })
      }
    }

    // Validates, protocol MUST NOT be 'file' as it may point to an invalid local path
    if (gitInfo && gitInfo.protocol && 'file' != gitInfo.protocol) {
      // Logs information
      console.info(`Downloading library files from: "${gitUrl}"`)

      // The clone result will go here
      let cloneResult = null

      // Tries to download library via supplied URL
      try {
        cloneResult = await Git.Clone(gitUrl, destination)
      } catch (e) {
        // Tries to download library via SSH
        try {
          // Gets the SSH Git URL
          const gitSSH = `git@${gitInfo.resource}:${gitInfo.full_name}.git`

          // Loads SSH private keys
          const sshKeys = await Library.getKeys()

          // Attempts clone again
          cloneResult = await Git.Clone(gitSSH, destination, {
            fetchOpts: {
              callbacks: {
                // Disable certificate check as this may result in error
                certificateCheck: () => 0,

                // Allows for SSH auth
                credentials: (url, user) => {
                  // Returns DU-LuaC's generated keys
                  return Git.Cred.sshKeyMemoryNew(user, sshKeys.public_ssh, sshKeys.private_ssh, '')
                },
              },
            },
          })
        } catch (e) {
          console.error(`Error while fetching repository from Git:`, e)
          console.error(`Make sure you have the application's SSH public key authorized on your Git provider. To find it, run "du-lua git-key"`)
          console.error(`Also, make sure the following Git path is correct:`, gitUrl)
          process.exit(1)
        }
      }

      // If no results are found, fail
      if (!cloneResult) return null

      // Parses the library info!
      const libInfo = await Library.getProjectInfo(destination)

      // Only moves if no destination is provided!
      if (!destDir) {
        // Gets names
        const destName = path.join(libDir, libInfo.name)

        // Removes existing library if existing
        if (exists(destName)) {
          await fs.rmdir(destName, { recursive: true })
        }

        // Creates destination parent dir if not existing
        if (!exists(destName)) {
          await fs.mkdir(path.dirname(destName), { recursive: true })
        }

        // Does the move
        await fs.move(destination, destName)

        // Adds a proper path to it
        libInfo.path = destName
      }

      // Returns library info
      return libInfo
    } else {
      // Fails
      return null
    }
  }

  // Helper to get current project
  static async getProjectInfo (directory) {
    // Checks for existing project file
    if (!exists(path.join(directory, 'project.json'))) {
      console.error(`Project file not found "${path.join(directory, project.json)}"! Please, run "du-lua init" first!`)
      process.exit(1)
    }

    // Loads project
    return JSON.parse((await fs.readFile(path.join(directory, 'project.json'))).toString())
  }

}