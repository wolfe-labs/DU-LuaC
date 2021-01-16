# Lua Compiler for Dual Universe

This is a very simple compiler for Dual Universe scripts (though it might also work with Lua scripts in general), specially larger projects.

It's main objective is to make it easy to work with larger projects that span over many different files, even when your final destination only allows for a single file.

The compiler also has a very basic notion of package/project management, so you can, for example, create libraries for specific uses (such as user interfaces) and instead of duplicating their code into your current application, you can simply add their location to your `project.json` file and they will be accessible in your code as if they were inside your project.

Whenever the compiler finds a `require()` function in your code, it will parse it and try to find the corresponding file inside your project (this includes libraries!), whenever it finds it, the specific file will be preloaded into the header of your script. If no files are found, the compiler will emit a warning but won't stop, as this allow you to use libraries specific to your game.

## Installation

To install this compiler, just run `npm i -g @wolfe-labs/du-luac` and it will be installed to your CLI.

If a current installation is already present, the compiler will be updated to latest version.

## Usage

The first step to use the compiler is to create a `project.json` file.

This is the file the compiler uses to understand how your project works and which files are the entry points when compiling.

To keep things simple and yet, allow for powerful configurations, a project has `builds`, which are the individual entry points for your project, and `targets`, which allow you to export variations of your builds.

Whenever you are ready to build your project, simply open a terminal window, navigate to its directory and run `du-luac` and a few moments later you will have your files ready to import in-game!

### The minimalistic `project.json`

The most basic form of the project file is one including only your project name, the `sourcePath` field that indicates which of the directories includes source-code, and the `outputPath` field that points to where built files should go:

```json
{
  "name": "@your-github/your-repo",
  "sourcePath": "src",
  "outputPath": "out"
}
```

It's basic, but since it doesn't include any builds or anything else, it won't do anything.

By adding a build and a target to it, it will be able to properly build:

```json
{
  "name": "@your-github/your-repo",
  "sourcePath": "src",
  "outputPath": "out",
  "builds": [
    {
      "name": "main",
      "slots": []
    }
  ],
  "targets": [
    {
      "name": "development",
      "minify": false,
      "handleErrors": true
    }
  ]
}
```

With that and a file named `main.lua` in your `src` directory, you should be able to build successfully!

The resulting files will be located under the `out/development` directory, and will be named `main.lua` and `main.json`, with the JSON file being the auto-config one you can simply copy and paste in-game.

### Builds

A build, in a nutshell, can be thought as one isolated part of your project.

For example, if you have a construct with two different Programming Boards, each connected to different Elements and with different scripts (`control_panel.lua` and `storage.lua`), you can do this simply creating the following setup:

```json
{
  "builds": [
    {
      "name": "control_panel",
      "slots": {
        "screen_main": {
          "type": "screen"
        },
        "door_entrance": {},
        "db_accesses": {
          "type": "databank"
        },
        "fuel_tank": {
          "type": "fuelContainer"
        }
      }
    },
    {
      "name": "storage",
      "slots": {
        "door_storage": {},
        "container_hub": {}
      }
    }
  ]
}
```

The `name` field for each of your `build` entries map directly to the files on your source directory, so if you have a file called `controller.lua`, then your build must be named `controller`.

### Targets

A target, in other hand, defines how to output your code after it has been compiled. For example, you might want to have a minified version of your code for deployment in production, while also having a complete version for development or debugging purposes. This is possible by defining targets in your project file:

```json
{
  "targets": [
    {
      "name": "development",
      "minify": false,
      "handleErrors": true
    },
    {
      "name": "production",
      "minify": true,
      "handleErrors": false
    }
  ]
}
```

With that, you don't need to keep building for different targets, as the moment you build your project they will be built automatically for you, each in their own directory.

### Slots and `wrap.lua` options

As this compiler uses the [wrap.lua](https://board.dualthegame.com/index.php?/topic/20161-lua-tool-script-packagerconfigurator-wraplua/) script to package and auto-configure your Element links, its options are also exposed on the project file.

Slots can be configured under each build and **must be in the same sequence as you link the elements in-game**. Failing to do so will link the wrong components and cause errors, potentially including headaches and hair pulling.

The target option `handleErrors` maps to the `--handle-errors` argument, which will include (or not) error-handling code. Disabling it will make your scripts silently fail, without any stack traces on screens or the Lua chat channel.

### Libraries

To link a library to your project, you will need to give it an ID and then add its path to the `libs` field. The ID doesn't need to match the one on the library itself, but will be the one you will use on your code when referring to that library. Relative paths are allowed, so if you have all your projects in the same directory, you can just use `../my-library-directory` as its path and everything will just work!

There's no package management or online listing available as of now, though.

You can check the examples included in this repository to see how this can be implemented, the only requirement is that whenever you use `require` to load a file from another library, you add a `:` between the library ID and the file name. You don't need to include the `.lua` extension, but any file names must be valid files located under the library's corresponding `sourcePath` directory.

## Ideas and Features

If you have any suggestions on how to improve the compiler, feel free to open an Issue on GitHub! It's always a welcome contribution!

Right now, these are features being planned/implemented:

- [x] Use `package.preload` instead of copying over module contents
- [ ] CLI to ease creation of projects
- [ ] Proper way to import libraries, maybe link to Git repos?

## About, Contact, Support, etc.

If you have any questions, feel free to [ping me over on Discord](https://discord.gg/egQaE2U) and I'll be glad to help!

I don't usually respond to friend requests, sometimes don't even notice them, so if you need to contact me **please** use the Discord server.