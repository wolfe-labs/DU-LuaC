import fs from "fs";
import axios from "axios";
import Command, { CommandData } from "./Command";
import Application from "../Application";
import { CLI } from "../lib/CLI";
import LuaDocBuilder from "../lib/LuaDocBuilder";
import Codex from "../types/Codex";
import Utils from "../lib/Utils";
import path from "path";

/**
 * A command that updates the codex
 */
export default class UpdateCodexCommand implements Command {
  // Sets the values we'll be using on the main CLI
  command = 'update-codex';
  description = `Updates the built-in Codex to the latest one available on OpenData. For development use only!`;

  // This is what runs our command
  async run({ args, options }: CommandData) {
    // Status update
    CLI.print('Downloading latest Codex version...');

    // Downloads the Codex from DU-OpenData
    const updatedCodex = (await axios.get('https://raw.githubusercontent.com/wolfe-labs/DU-OpenData/main/dist/Lua/Codex.json')).data;

    // Writes Codex file
    fs.writeFileSync(Application.getPath('Codex/Codex.json'), JSON.stringify(updatedCodex));

    // Status update
    CLI.print('Building LuaDoc Codex...');

    // Reads all extra Lua headers
    const dirExtraHeaders = Application.getPath('lua/headers');
    const extraHeaders = Utils.deepReadDirectory(dirExtraHeaders)
      .filter((file) => file.endsWith('.lua'))
      .map((file) => fs.readFileSync(path.join(dirExtraHeaders, file)).toString());

    // Builds LuaDoc Codex
    const luaCodex = (new LuaDocBuilder(updatedCodex as Codex))
      .withHeaders(...extraHeaders)
      .build();

    // Writes the new Lua Codex
    fs.writeFileSync(Application.getPath('Codex/Codex.lua'), luaCodex);

    // Done
    CLI.success('Codex updated successfully!');
  }
}