const _ = require('lodash');
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

function deepReadDirectory (dir) {
  // Reads directory recursively
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  const files = [];

  // Processes entries
  entries.forEach((entry) => {
    if (entry.isDirectory()) {
      files.push(
        ...deepReadDirectory(path.join(dir, entry.name)).map((file) => path.join(entry.name, file)),
      );
    } else {
      files.push(entry.name);
    }
  });

  // Done
  return files;
}

module.exports = async function buildCodeCompletion (dir) {
  // Gets project info
  const project = await library.getProjectInfo(dir);

  // Makes utility directory if needed
  if (!fs.existsSync('util')) {
    fs.mkdirSync(path.join(dir, 'util'));
  }

  // Gets list of element types
  const elementTypes = require('./elementTypes');

  // Processes slots
  const slots = _.flatten(
    Object.values(project.builds)
      .map((build) => Object.values(build.slots))
  );

  // Reads a list of extra Lua headers
  const extraHeadersDir = path.join(__dirname, 'Codex/ExtraHeaders');
  const extraHeaders = deepReadDirectory(extraHeadersDir)
    .map((file) => fs.readFileSync(path.join(extraHeadersDir, file)).toString());

  // Copies the codex locally, adding any links to the globals
  const codex = [
    ...extraHeaders,
    fs.readFileSync(path.join(__dirname, 'Codex/Codex.lua')).toString(),
    slots.map((slot) => {
      const element = elementTypes[slot.type];
      if (element && element.luaClass) {
        return `${ slot.name } = ${ element.luaClass }`
      }
      return false;
    }).filter((slot) => !!slot).join('\n\n'),
  ].join('\n\n').replace(/[\n]+/g, '\n');
  fs.writeFileSync(path.join(dir, 'util/Codex.lua'), codex);

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