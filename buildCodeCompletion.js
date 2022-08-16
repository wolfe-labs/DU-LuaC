const fs = require('fs');
const path = require('path');
const library = require('./library');

function addToGitIgnore (src, entries) {  
  // Gets all entries
  const allEntries = [
    ...src.split('\n'),
    ...entries
  ];

  // Removes duplicates
  const existing = [];
  return allEntries.filter((entry) => {
    // Maintains empty lines
    if (entry.trim().length == 0) return true;

    // Actual check
    if (!existing.includes(entry)) {
      existing.push(entry);
      return true;
    }
    return false;
  }).join('\n');
}

module.exports = async function buildCodeCompletion (dir) {
  // Gets project info
  const project = await library.getProjectInfo(dir);

  // Makes utility directory if needed
  if (!fs.existsSync('util')) {
    fs.mkdirSync(path.join(dir, 'util'));
  }

  // Copies the codex locally
  fs.copyFileSync(
    path.join(__dirname, 'Codex/Codex.lua'),
    path.join(dir, 'util/Codex.lua')
  );

  // Builds the EmmyLua config file
  const configEmmyLua = fs.readFileSync(path.join(__dirname, 'templates/emmy.config.json')).toString()
    .replace(/\$\{srcpath\}/g, project.sourcePath);
  fs.writeFileSync(path.join(dir, 'emmy.config.json'), configEmmyLua);

  // Adds Codex to .gitignore
  if (fs.existsSync(path.join(dir, '.gitignore'))) {
    const gitIgnore = addToGitIgnore(
      fs.readFileSync(path.join(dir, '.gitignore')).toString(),
      [
        'util/Codex.lua',
      ]
    );
    fs.writeFileSync(path.join(dir, '.gitignore'), gitIgnore);
  }
}