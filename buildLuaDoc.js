const _ = require('lodash');

// This function takes an 
function buildClassWithInheritance (className, Codex) {
  // Gets current class
  const Class = Codex.classes[className];

  // If class doesn't exist show an error and stop
  if (!Class) {
    console.error('[ERROR] Class not found:', className);
    return {};
  }

  // Our class will be based on this
  let resultingClass = {};

  // Applies recursive inheritance
  if (Class.parent) {
    resultingClass = _.merge(resultingClass, buildClassWithInheritance(Class.parent, Codex));
  }

  // Applies current class and returns
  return _.merge(resultingClass, Class);
}

// Builds LuaDoc for classes
function buildClassLua (className, classData) {
  const classLuaDoc = [
    ...Object.keys(classData.methods || {}).map((name) => buildMethodLua(name, classData.methods[name], className)),
    ...Object.keys(classData.events || {}).map((name) => buildEventLua(name, classData.events[name], className)),
  ];

  // Builds the class Lua
  return `---@class ${className}\n${className} = {}\n${ classLuaDoc.join('\n\n') }\n`;
}

// Builds LuaDoc for methods
function buildMethodLua (name, data, className) {
  const lua = [];

  // Adds description
  if (data.description) {
    data.description.split('\n').forEach((line) => {
      if (data.deprecated) {
        lua.push(`---@deprecated ${ line }`);
      } else {
        lua.push(`--- ${ line }`);
      }
    });
  }

  // Adds params
  if (data.params) {
    data.params.forEach((param) => {
      lua.push(`---@param ${ param.name || '' } ${ param.type || '' } ${ param.description || '' }`);
    });
  }

  // Adds returns
  if (data.returns) {
    data.returns.forEach((returnDef) => {
      lua.push(`---@return ${ returnDef.type || '' } ${ returnDef.description || '' }`);
    });
  }

  // Adds method name
  lua.push(`function ${ className || 'self' }.${ name }(${ (data.params || []).map((param) => param.name).join(', ') }) end`);

  // Done
  return lua.join('\n');
}

// Builds LuaDoc for events
function buildEventLua (name, data, className) {
  const lua = [];

  // Adds description
  if (data.description) {
    data.description.split('\n').forEach((line) => {
      if (data.deprecated) {
        lua.push(`---@deprecated ${ line }`);
      } else {
        lua.push(`--- ${ line }`);
      }
    });
  }

  // Adds params
  if (data.params) {
    data.params.forEach((param) => {
      lua.push(`---@param ${ param.name || '' } ${ param.type || '' } ${ param.description || '' }`);
    });
  }

  // Adds Event type annotation
  lua.push('---@type Event');

  // Adds method name
  lua.push(`${ className || 'self' }.${ name } = Event:new()`);

  // Done
  return lua.join('\n');
}

module.exports = function buildLuaDoc (Codex) {
  // This is where we'll store everything
  const lua = [];

  // Builds class definitions
  Object.keys(Codex.classes || {}).forEach((className) => {
    // Debug information
    console.info(`Building inheritance from class: ${ className }`);

    // Test class
    const classData = buildClassWithInheritance(className, Codex);

    // Debug information
    console.info(`Generating LuaDoc for class: ${ className }`);

    // This will store all our LuaDoc
    const classLuaDoc = buildClassLua(className, classData);

    // Appends data to our Lua
    lua.push(classLuaDoc);
  });

  // Processes globals
  console.info('Building processing globals...');
  Object.keys(Codex.globals || {}).forEach((globalName) => {
    // Gets the global data
    const globalData = Codex.globals[globalName];

    // Builds global string into our Lua
    lua.push(`${globalName} = ${globalData.type}`);
  });

  // Returns our prepared Lua
  return lua.join('\n\n');
}