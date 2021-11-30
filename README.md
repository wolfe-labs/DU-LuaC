# Lua Compiler for Dual Universe

This is a very simple compiler for Dual Universe scripts that will not only combine your Lua source files and generate proper autoconfig files, but also includes improved event handling out of the box.

Currently, the compiler also has some notion of package management, though not very advanced, by allowing you to directly add Git repositories as external libraries, with all downloading and linking being handled by the compiler itself.

The compiler works by scanning and parsing `require` statements. It follows the following naming format: `Package:File`, though you should also be able to directly access a file in your current project by just pointing to the file instead. The `.lua` extension is not required. In cases where you try using `require` with an not found file, you will receive a small warning on your console but it won't fail the build, thus allowing to allow the game's built-in libraries, such as `dkjson`.

## Installation

To install the compiler, run `npm i -g @wolfe-labs/du-luac` and it will be installed to your CLI. Make sure you have at least Node v.12 installed as some required features may not be present below that. You can also run this command to update the compiler.

### Development Versions/Branches

If you're feeling adventurous and want to try out a development version of the CLI, you can install it using NPM: `npm i -g git://git@github.com:wolfe-labs/DU-LuaC.git#wip`

Specific feature branches are also available by changing the `#wip` to the branch name, for example: `#feature/autoconf`

**Please be conscious that by using those versions things are subject to changes and bugs!**

### Setting-up GitHub Actions

By default when your project is created it comes with just an `.gitignore` file, so you aren't forced to use Git by default. In case you do, though, you can setup GitHub Actions so that your creations are automatically built and made available as JSON/YAML config files for your users.

To do this, copy over the [github-actions.yaml](templates/github-actions.yaml) template to your project's `.github/workflows` directory. Inside the file, copy and adjust the appropriate JSON/YAML artifact processing tasks so that your files are made available under the `Actions` tab.

You can also setup different builds for different branches too, just duplicate your file and edit the branches on the top of the file.

## Usage

After installed, go into your projects directory and run `du-lua create my-first-project` and the interactive CLI will guide you with configuring your `project.json` file. You don't need to change any of the settings on this step.

After done with that, run `du-lua -h` to view a list of available commands.

### Adding a new Script/Build Entrypoint

In DU-Lua, scripts or "build entry-points" are meant to represent individual Control Unit elements on your project. For example, if you create a project for a new ship, you can have a script that will be used on the main flight seat, another for the cargo bay screens, etc.

To add a new script, run `du-lua script-add your-script-name-here`. This will create a new entry on the `builds` field and also create a new file called `your-script-name-here.lua`, which will also generate corresponding Lua, YAML and JSON files at build-time.

### Adding a new Build Target/Output

Before compiling, you also need to specify a Build Target for your project. It is used to define any optimizations that are done, such as minification, error logging and tracing, etc.

To access the interactive configuration tool, just run `du-lua target-add` and follow the instruction, selecting the options that best fit for your use case.

### Listening to Events with Slots

Slots allow you to listen for events on linked elements. For that, you **must** define the events in the same order the elements will be linked to your Control Unit.

For elements that you only want to interact with via Lua, without any events, you can use the Automatic Linking Detection feature to find links by element class or name.

To add a new link to your script `your-script-name-here`, run `du-lua script-link your-script-name-here` and follow the interactive CLI. You will be asked to select an element type at one point, this is only needed if you want to be able to receive events from that element, otherwise select "Generic Element".

### Using external Libraries

One of the coolest features of the compiler is allowing you to use external libraries in your code! This is possible by running the `du-lua import your-library-path`, where `your-library-path` can be either a directory path to another library or a Git address.

Using a directory path is not recommended as it will require everyone working on your code to have the exact same directory structure around, which can be a little cumbersome. Going for the Git alternative is much easier, as your `project.json` file will keep track of the Git repository of that specific library and any files will be automatically downloaded whenever you build a project with missing libraries.

You can use either the web URL of the repository or go for the recommended way and use the clone URL. For public repositories you can use the HTTPS clone URL and it will work without issues, though with private repositories you will need to use the SSH clone URL and configure the compiler's own SSH key in your Git account, under SSH Keys. To get this key, just run `du-lua git-key` and it will print it for you on your command-line. This key is automatically generated on your computer and never leaves it, nor should be used for anything else.

**Note:** As of v0.8, libraries that were not created on DU-LuaC (such as repositories containing only "pure" source files) are supported.

## Extra Goodies

Here you'll find some extra features that you gain by using DU-LuaC:

### Improved Event Handlers

DU-LuaC has built-in support for multiple event handlers, which makes it easier to write modular scripts as you never override another script's event handler. They are automatically added to any liked component which has in-game events.

In case you want to add event support for your own objects and instances, use the `library.addEventHandlers(yourInstance)` function, which will add three new functions to your object:

- `yourInstance:onEvent(eventName, eventHandler)` will call `eventHandler` every time that instance emits an `eventName` event. The return value is an identifier that can be used to remove that event handler too.
- `yourInstance:clearEvent(eventName, handlerId)` will remove the handler with identifier `handlerId` from the `eventName` event for that instance.
- `yourInstance:triggerEvent(eventName, arg1, arg2, arg3, ...)` will trigger an `eventName` event for that instance and pass all following arguments to it.

Please note that, for any event handlers, the first argument **will always be the instance itself**, so for example, the `mouseDown` event for a Screen Unit is triggered as `screen:triggerEvent('mouseDown', x, y)`, but the event handler will have the following signature: `onScreenMouseDown(screen, x, y)`, the same also works for internals such as timers with `onTick(unit, timer)`, etc.

### Automatic Linking Detection

Allows you to get lists of elements linked on your Control Unit, optionally filtering them by element class and name!

For example, if you want to get a listing of everything currently linked to your Control Unit, calling `library.getLinks()` will provide you that.

By itself it might not be that useful, but let's say you want to get a list of all Screen Unit elements linked to your Control Unit, by calling `library.getLinksByClass('ScreenUnit')` you will have it!

Finally, let's say that from all those linked Screen Unit elements you want to get one by its element name. This can be done by calling `library.getLinkByName('myScreen')`, with `myScreen` being the element name of your Screen Unit.

**Please note that:** to be able to get elements by their name, you will need to link your Core Unit to your Control Unit, thus losing one link. In case you don't want to go that route, you can still hard link your slot via the CLI. The disavantage of this is that you will have to remember the linking order for these elements.

## Inner Workings

There's a bunch of stuff here explaining how the compiler works and what every field in the `project.json` file does. You don't need to read this or understand how it works, since all configuration is now done via interactive CLI.

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

### Slots

Slots allow you to register elements linked to your control unit (Programming Board, Cockpit, etc) and have them available to your script for direct control and event handling.

They can be configured under each build and **must be in the same sequence as you link the elements in-game**. Failing to do so will link the wrong components and cause errors, potentially including headaches and hair pulling.

**Note:** All slots are now handled internally by the compiler when generating the autoconfig file, with the old `wrap.lua` script not being required anymore.

### Libraries

To link a library to your project, you will need to give it an ID and then add its path to the `libs` field. The ID doesn't need to match the one on the library itself, but will be the one you will use on your code when referring to that library. Relative paths are allowed, so if you have all your projects in the same directory, you can just use `../my-library-directory` as its path and everything will just work!

There's no package management or online listing available as of now, though.

You can check the examples included in this repository to see how this can be implemented, the only requirement is that whenever you use `require` to load a file from another library, you add a `:` between the library ID and the file name. You don't need to include the `.lua` extension, but any file names must be valid files located under the library's corresponding `sourcePath` directory.

## Ideas and Features

If you have any suggestions on how to improve the compiler, feel free to open an Issue on GitHub! It's always a welcome contribution!

Right now, these are features being planned/implemented:

- [x] Use `package.preload` instead of copying over module contents
- [x] CLI to ease creation of projects
- [x] Proper way to import libraries, maybe link to Git repos?
- [ ] Command to update libraries in a project
- [ ] Version control, maybe using Git branches/tags?
- [x] Proper autoconf generator written in JS so we don't need to use any Lua binary
- [ ] Automated tests

## About, Contact, Support, etc.

If you have any questions, feel free to ping me in [Wolfe Labs' Discord server](https://discord.gg/YerENgKDre) and I'll be glad to help!

I don't usually respond to friend requests, sometimes don't even notice them, so if you need to contact me **please** use the Discord server. Ping me, it won't hurt :)

### Donations

In-game donations are more than welcome! Feel free to send any amounts to the **Wolfe Labs** in-game organization.

You can also buy me an IRL coffee too via both [PayPal](https://www.paypal.com/donate?hosted_button_id=YYVSTZ8EN3JSC) and [Pix](https://nubank.com.br/pagar/4rs96/YNDgXVKPoV)