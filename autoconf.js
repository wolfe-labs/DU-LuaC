/**
 * This is the script that generates JSON and YAML files
 */

const fs = require('fs')
const minifier = require('luamin').minify
const elementTypes = require('./elementTypes')
const helperEvents = fs.readFileSync(`${ __dirname }/lua/Events.lua`).toString()

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

let slotHandlerCount = 0
function makeSlotHandler(autoconf, slot, signature, code) {
  const regexArgs = /(.*?)\((.*?)\)/g
  const regexMatches = regexArgs.exec(signature)
  const call = (regexMatches[1] || '').split(',')
  const args = (regexMatches[2] || '').split(',')
  const argsN = args.length

  if (!code) {
    const slotName = autoconf.slots[slot].name
    code = `${ slotName }.triggerEvent(${ [`"${ call }"`, ...args].join(',') })`
  }

  return {
    key: parseInt(slotHandlerCount++),
    filter: {
      slotKey: parseInt(slot),
      signature,
      args: makeSlotHandlerArgs(argsN),
    },
    code,
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
    slots: {
      '-3': makeSlotDefinition('library', 'library'),
      '-2': makeSlotDefinition('system', 'system'),
      '-1': makeSlotDefinition('unit', 'control'),
    },
    handlers: [],
    methods: [],
    events: [],
  }

  // How many slots to offset
  const slotOffset = Object.keys(autoconf.slots).length

  // External libraries go directly to the library slot
  preloads.forEach((preload) => {
    autoconf.handlers.push(
      makeSlotHandler(autoconf, -3, 'start()', minify ? minifier(preload.source) : preload.source)
    )
  })

  // Injects event-handling helper
  autoconf.handlers.push(
    makeSlotHandler(autoconf, -3, 'start()', minify ? minifier(helperEvents) : helperEvents)
  )

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
        slotEvents.push(`library.addEventHandlers(${ slot.name })`)
          
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
      makeSlotHandler(autoconf, -3, 'start()', `-- Setup improved event handlers\n${ slotEvents.join('\n') }`)
    )
  }

  // Adds the main code to the unit's start
  autoconf.handlers.push(
    makeSlotHandler(autoconf, -1, 'start()', minify ? minifier(source) : source)
  )

  return autoconf
}