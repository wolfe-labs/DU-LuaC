const child_process = require('child_process');
const fs = require('fs');

function getGitCommitHash() {
  try {
    return child_process
      .execSync('git rev-parse HEAD')
      .toString()
      .trim();
  } catch (err) {
    return null;
  }
}

const currentGitHash = getGitCommitHash();
if (!currentGitHash) {
  console.warn(`Couldn't find Git hash, is Git installed? Skipping...`);
}

const date = (new Date());
const package = require('./package.json');
const currentVersionString = `dev:${(currentGitHash || 'unknown').slice(0, 7)}`;

fs.writeFileSync('.latestbuild', currentVersionString);