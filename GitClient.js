const child_process = require('child_process')

class GitClient {
  static runGitCommand () {
    try {
      const proc = child_process.spawnSync('git', Array.from(arguments))
      return {
        status: proc.status,
        output: proc.output.toString(),
      }
    } catch (e) {
      return null
    }
  }

  static getVersion () {
    const result = this.runGitCommand('--version')
    return result
      ? result.output
        .match(/git version (.*)/)
        [1] 
      : null
  }

  static isGitInstalled () {
    return !!this.getVersion()
  }

  static clone (repository, destination) {
    if (!this.isGitInstalled()) {
      console.error('You must have Git installed to clone this package!')
      process.exit(1)
    }
    
    const result = this.runGitCommand('clone', repository, destination)
    if (result.status != 0) {
      throw result.output
        .trim()
        .split('\n')
        .pop()
    }

    return true
  }
}

module.exports = GitClient;