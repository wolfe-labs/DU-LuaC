const CLI = require('./cli');
const fs = require('fs');
const path = require('path');

// Embeds a file as a Lua string
function libEmbedFile (context, file) {
  // Gets the current directory
  const currentDirectory = path.dirname(context.currentFile);

  // Resolves our new path
  const filePath = path.join(currentDirectory, file);

  // Checks if the file is inside our project for safety
  if (!context.fn.isPathInsideProject(filePath)) {
    CLI.error(`Failed to embed file: '${ file.yellow }' is not part of current project!`);
    process.exit(1);
  }

  // Reads our file
  const fileContent = fs.readFileSync(filePath).toString()
    // Escapes our back slashes
    .replace(/\\/g, '\\\\')

    // Escapes our single quotes
    .replace(/\'/g, '\\\'')
    
    // Replaces new lines
    .replace(/\n/g, '\\n');


  // Embeds the file into Lua
  return `'${ fileContent }'`;
}

module.exports = {
  'library.embedFile': libEmbedFile,
}