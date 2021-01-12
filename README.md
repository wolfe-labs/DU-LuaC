# Lua Compiler for Dual Universe

This is a very simple compiler for Dual Universe scripts, specially larger projects.

It does some pre-processing on your scripts, such as embedding `require` statements and code minification.

As an bonus, it also has some very basic project management through a `build.json` file (check below)

## Installation

To install this compiler, just run `npm install -g @wolfe-labs/du-luac` and it will be installed to your CLI

## Usage

To compile your projects, use the following syntax: `du-luac [path-to/build.json]`

You might need to generate a `build.json` file first, it must have the following syntax:

```json
{
  "entryPoint": "src/main",
  "handleErrors": true,
  "slots": {
    "screen": {
      "type": "screen"
    },
    "db": {
      "type": "databank"
    }
  },
  "output": {
    "path": "out/main",
    "complete": true,
    "minify": true,
    "minifyHeaders": [
      "Your project name here",
      "Another line of comment on the minified file"
    ]
  }
}
```

The `entryPoint` field is mandatory and must point to a file inside the project directory.

The `handleErrors` field will enable the `--handle-errors` flag for the autoconfig generator.

The `slots` field allows you to specify each of your construct's slots and their name on the autoconfig file, it **must** follow the sequence you linked your components.

The `output` field allows you to customize output settings, like if the entire `complete` output will be needed (good for debugging!) and if you will need a `minify` output too, for smaller code payloads.

The `minifyHeaders` sub-field allows you to specify lines of comments that will be added before the minified file code (if you want to add a project name or license there).