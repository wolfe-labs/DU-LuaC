function getHandlerCodeFromSlotId (builtYamlOrJson, slotId) {
  const signatures = {}

  builtYamlOrJson.handlers
    .filter((handler) => handler.filter.slotKey === slotId)
    .forEach((handler) => {
      // Generates the proper signature
      const signature = handler.filter.signature.split('(').shift()

      // Adds the signature if not yet present
      if (!signatures[signature])
        signatures[signature] = { lua: '' };

      // Appends the code
      signatures[signature].lua = [signatures[signature].lua, handler.code].join('\n').trim()
    })

  return signatures
}

module.exports = function buildAutoConfig (project, builtYamlOrJson) {
  const elementTypes = require('./elementTypes')

  // The actual autoconf
  const autoconf = {
    name: project.name,
    slots: {},
    handlers: {
      library: getHandlerCodeFromSlotId(builtYamlOrJson, -3),
      system: getHandlerCodeFromSlotId(builtYamlOrJson, -2),
      unit: getHandlerCodeFromSlotId(builtYamlOrJson, -1),
    },
  }

  // Handling a .conf generation and not JSON-YAML
  Object.values(builtYamlOrJson.slots)
    .filter((slot) => !!slot.class)
    .forEach((slot, baseKey) => {
      // Sets the slot with proper name
      autoconf.slots[slot.name] = slot

      // Sets the code for that slot
      autoconf.handlers[slot.name] = getHandlerCodeFromSlotId(builtYamlOrJson, baseKey)
    })

  return autoconf
}