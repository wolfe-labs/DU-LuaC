/**
 * This is the script that generates JSON and YAML files
 */

const fs = require('fs')
const minifier = require('luamin').minify
const elementTypes = require('./elementTypes')
const helperEvents = fs.readFileSync(`${ __dirname }/lua/Events.lua`).toString()
const helperLinking = fs.readFileSync(`${ __dirname }/lua/AutoConfig.lua`).toString()
const internalTypes = {
  library: {
    slotId: -3,
    events: [],
  },
  system: {
    slotId: -2,
    events: [
      { signature: 'actionStart(action)' },
      { signature: 'actionLoop(action)' },
      { signature: 'actionEnd(action)' },
      { signature: 'update()' },
      { signature: 'flush()' },
      { signature: 'inputText(text)' },
    ]
  },
  control: {
    slotId: -1,
    events: [
      { signature: 'start()' },
      { signature: 'stop()' },
      { signature: 'tick(timerId)' },
    ],
  },
}

function makeEmptySlotList() {
  const slots = []
  for (let i = 0; i < 10; i++) {
    slots.push({ name: `slot${ i }` })
  }
  return slots
}

function makeSlotDefinition(name, type) {
  const def = {
    name,
    type: {
      methods: [],
      events: [],
    },
  }

  if (type) def._elementType = type

  return def
}

function makeRunOnce(name, code) {
  return `if not __${ name } then\n${ code }\n__${ name }=true\nend`
}

let slotHandlerCount = 0
function makeSlotHandler(autoconf, slot, signature, code) {
  const regexArgs = /(.*?)\((.*?)\)/g
  const regexMatches = regexArgs.exec(signature)
  const call = (regexMatches[1] || '').split(',')
  const args = (regexMatches[2] || '').split(',')
  const argsN = args.length

  // If no code is found, generate the trigger event one
  if (!code) {
    const slotName = autoconf.slots[slot].name
    const callArgs = [
      `"${ call }"`,
      ...args
    ]
    code = `${ slotName }:triggerEvent(${ callArgs.map(arg => arg.trim()).filter(arg => arg.length > 0).join(',') })`
  }

  // Cleanup code
  const cleanCode = code
    .replace(/\r/g, '') // Remove carriage returns

  // The proper event handler
  return {
    key: parseInt(slotHandlerCount++),
    filter: {
      slotKey: parseInt(slot),
      signature,
      args: makeSlotHandlerArgs(argsN),
    },
    code: cleanCode,
  }
}

function makeSlotHandlerArgs(argsN) {
  const args = []
  while (argsN-- > 0) {
    args.push({ variable: '*' })
  }
  return args
}

module.exports = function (project, build, source, preloads, minify) {
  // Base structure
  const autoconf = {
    slots: {},
    handlers: [],
    methods: [],
    events: [],
  }

  // Setup slots
  autoconf.slots[internalTypes.library.slotId] = makeSlotDefinition('library', 'library')
  autoconf.slots[internalTypes.system.slotId] = makeSlotDefinition('system', 'system')
  autoconf.slots[internalTypes.control.slotId] = makeSlotDefinition('unit', 'control')

  // How many slots to offset
  const slotOffset = Object.keys(autoconf.slots).length

  // Makes internals always be minified (disable for compiler debugging!)
  const minifyCompilerInternals = true

  // Injects event-handling helper
  autoconf.handlers.push(
    makeSlotHandler(autoconf, -3, 'start()', minifyCompilerInternals ? minifier(helperEvents) : helperEvents)
  )

  // Injects autoconfig helper
  autoconf.handlers.push(
    makeSlotHandler(autoconf, -3, 'start()', minifyCompilerInternals ? minifier(helperLinking) : helperLinking)
  )

  // External libraries go directly to the library slot
  preloads.forEach((preload) => {
    autoconf.handlers.push(
      makeSlotHandler(autoconf, -3, 'start()', minify ? minifier(preload.source) : preload.source)
    )
  })

  // Slot event handlers
  const slotEvents = []

  // Generates a list of slots from the build
  const buildSlots = Object.values(build.slots)

  // Generates a list of empty slots we'll override later
  const baseSlots = makeEmptySlotList().map((_, idx) => {
    if (buildSlots[idx]) {
      const slot = buildSlots[idx]

      // Checks if the slot is valid
      if (slot.name) {
        return slot
      }
      
      // Warns and ignores invalid slots
      console.warn(`WARNING: Invalid slot (missing 'name' attribute) for build '${ build.name }'`)
    }

    // Keeps base slot if nothing happens
    return _
  })

  // Adds internal events
  Object.keys(internalTypes).forEach((type) => {
    const typeInfo = internalTypes[type]
    if (typeInfo.events) {
      slotEvents.push(autoconf.slots[typeInfo.slotId].name)
      typeInfo.events.forEach((event) => {
        autoconf.handlers.push(
          makeSlotHandler(autoconf, typeInfo.slotId, event.signature)
        )
      })
    }
  })

  // Setup slots and event handlers
  baseSlots.forEach((slot) => {
    // Computes the new slot ID
    const slotId = Object.keys(autoconf.slots).length - slotOffset

    // For proper slots with types
    if (slot.type && elementTypes[slot.type]) {
      // Gets the proper slot type
      const slotType = elementTypes[slot.type]

      // Creates the slot
      autoconf.slots[slotId] = makeSlotDefinition(slot.name, slotType.value)

      // Optionally creates events
      if (slotType.events) {
        // Enables event handling automatically for that slot
        slotEvents.push(slot.name)
          
        // Processes each available event
        slotType.events.forEach((event) => {
          autoconf.handlers.push(
            makeSlotHandler(autoconf, slotId, event.signature)
          )
        })
      }
    } else {
      // Generic elements
      autoconf.slots[slotId] = makeSlotDefinition(slot.name, slot.type || null)
    }
  })

  // Adds event handler set-up code
  if (slotEvents.length > 0) {
    autoconf.handlers.push(
      makeSlotHandler(autoconf, -3, 'start()', `-- Setup improved event handlers\n${ makeRunOnce('EVENTS', slotEvents.map(slot => `library.addEventHandlers(${ slot })`).join('\n')) }`)
    )
  }

  // Adds the main code to the unit's start
  autoconf.handlers.push(
    makeSlotHandler(autoconf, -1, 'start()', minify ? minifier(source) : source)
  )

  return autoconf
}