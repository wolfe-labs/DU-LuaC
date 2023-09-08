import _ from 'lodash';
import Codex, { CodexClass, CodexEvent, CodexMethod } from "../types/Codex";
import { CLI } from "./CLI";
import ColorScheme from "./ColorScheme";

/**
 * Utility that converts a Codex into a LuaDoc .lua file
 */
export default class LuaDocBuilder {
  /**
   * A list of extra Lua headers to be added before globals and after the base Codex
   */
  private extraHeaders: string[] = [];

  /**
   * Initializes our LuaDoc builder
   * @param codex The Codex structure
   */
  constructor(private codex: Codex) {}

  /**
   * Fixes a parameter's name
   * @param param The parameter being fixed
   */
  private fixFunctionParameterName(param: string): string {
    // The RegEx that will cleanup
    const regex = /([\w\d]+)/g;

    // A table of things we're replacing
    const replaces: Record<string, string> = {
      'return': 'returns',
    };

    // Returns the fixed string
    return regex.exec(replaces[param] || param)![1];
  }

  /**
   * Generates a class with all its inherited methods and events
   * @param className The class name being processed
   */
  private buildClassWithInheritance(className: string): CodexClass {
    // This is our current class
    const currentClass = (this.codex.classes || {})[className];

    // Fails when no class is found
    if (!currentClass) {
      CLI.error(`Referenced class not found on Codex: ${ColorScheme.highlight(className)}`);
      return {};
    }

    // This is our "super" class, which is our parent, with processing done on it
    const superClass = currentClass.parent
      ? this.buildClassWithInheritance(currentClass.parent)
      : {};

    // Applies our super class to current class
    return _.merge(superClass, currentClass);
  }

  /**
   * Builds the LuaDoc headers for a certain class
   * @param className 
   * @param classInfo 
   */
  private buildClassHeaders(className: string, classInfo: CodexClass): string {
    // Creates the LuaDoc lines
    const classLuaDoc = [
      ...Object.keys(classInfo.methods || {}).map((name) => this.buildMethodHeader(name, (classInfo.methods || {})[name], className)),
      ...Object.keys(classInfo.events || {}).map((name) => this.buildEventHeader(name, (classInfo.events || {})[name], className)),
    ];

    // Returns the formatted LuaDoc class
    return `---@class ${className}\nlocal ${className} = {}\n${classLuaDoc.join('\n\n')}\n`;
  }

  /**
   * Builds the LuaDoc headers for a certain method
   * @param methodName The method's name
   * @param methodInfo The method's details
   * @param className The method's parent class
   */
  private buildMethodHeader(methodName: string, methodInfo: CodexMethod, className?: string): string {
    // This will be our output
    const lua: string[] = [];

    // Adds description
    if (methodInfo.description) {
      methodInfo.description.split('\n').forEach((line) => {
        lua.push(methodInfo.deprecated
          ? `---@deprecated ${line}`
          : `--- ${line}`
        );
      });
    }

    // Adds parameters/arguments
    if (methodInfo.params) {
      methodInfo.params.forEach((param) => {
        lua.push(`---@param ${param.name || ''} ${param.type || ''} ${param.description || ''}`);
      });
    }

    // Adds return types
    if (methodInfo.returns) {
      methodInfo.returns.forEach((returnInfo) => {
        lua.push(`---@return ${returnInfo.type || ''} ${returnInfo.description || ''}`);
      });
    }

    // Finishes off with the method name
    const finalClassName = className || 'self';
    const finalSeparator = methodInfo.isMethodStatic ? '.' : ':';
    const finalArguments = (methodInfo.params || [])
      .map((param) => param.name)
      .map(this.fixFunctionParameterName)
      .join(', ');
    lua.push(`function ${finalClassName}${finalSeparator}${methodName}(${finalArguments}) end`);

    // Merges everything
    return lua.join('\n');
  }

  /**
   * Builds the LuaDoc headers for a certain event
   * @param eventName The event's name
   * @param eventInfo The event's details
   * @param className The event's parent class
   */
  private buildEventHeader(eventName: string, eventInfo: CodexEvent, className?: string): string {
    // This will be our output
    const lua: string[] = [];

    // Adds description
    if (eventInfo.description) {
      eventInfo.description.split('\n').forEach((line) => {
        lua.push(eventInfo.deprecated
          ? `---@deprecated ${line}`
          : `--- ${line}`
        );
      });
    }

    // Adds parameters/arguments
    if (eventInfo.params) {
      eventInfo.params.forEach((param) => {
        lua.push(`---@param ${param.name || ''} ${param.type || ''} ${param.description || ''}`);
      });
    }

    // Adds Event type annotation
    lua.push('---@type Event');

    // Finishes with the event declaration
    const finalClassName = className || 'self';
    lua.push(`${finalClassName}.${eventName} = Event:new()`);

    // Merges everything
    return lua.join('\n');
  }

  /**
   * Adds a series of Lua headers to the current builder, it will be positioned before the globals and after the base Codex
   * @param headers The Lua code for that header
   */
  withHeaders(...headers: string[]): LuaDocBuilder {
    this.extraHeaders.push(...headers);
    return this;
  }

  /**
   * Builds the provided Codex into a LuaDoc .lua file
   */
  build(): string {
    // This is where we'll store everything
    const lua: string[] = [];

    // Builds classes
    for (let className in this.codex.classes || {}) {
      // Status update
      CLI.print(`Building inheritance tree for class: ${ColorScheme.highlight(className)}`);

      // Builds the whole inheritance tree
      const processedClass = this.buildClassWithInheritance(className);

      // Builds the actual LuaDoc for that class
      lua.push(this.buildClassHeaders(className, processedClass));
    }

    // Adds DU-LuaC helper spec
    if (this.extraHeaders.length > 0) {
      CLI.print(`Adding helper headers...`);
      lua.push(...this.extraHeaders);
    }

    // Builds globals
    CLI.print(`Building globals...`);
    for (let globalName in this.codex.globals || {}) {
      // Gets the global details
      const globalInfo = (this.codex.globals || {})[globalName];

      // Appends the global to our Lua
      lua.push(`${globalName} = ${globalInfo.type}()`);
    }

    // Returns our finished Lua
    return lua.join('\n\n');
  }
}