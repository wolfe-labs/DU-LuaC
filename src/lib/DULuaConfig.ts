import Build from "../types/Build";
import ElementTypes, { ElementTypeEvent } from "../types/ElementType";
import { SimpleMap } from "../types/SimpleMap";
import ColorScheme from "./ColorScheme";
import { DULuaCompilerResult } from "./DULuaCompiler";

export type DULuaConfigSlot = {
  name: string,
  slotId: number,
  events?: ElementTypeEvent[],
  class?: string,
  select?: string,
};

export type DULuaAutoConfig = {
  slots: {},
  handlers: [],
  methods: [],
  events: [],
};

export type DULuaAutoConfigSlot = {
  name: string,
  type: {
    methods: [],
    events: [],
  }
};

export class DULuaConfig {
  private constructor() {}

  /**
   * Those are the built-in slots on DU
   */
  private static readonly internalSlots: SimpleMap<DULuaConfigSlot> = {
    library: {
      name: 'library',
      slotId: -5,
      events: [],
    },
    system: {
      name: 'system',
      slotId: -4,
      events: [
        { signature: 'onActionStart(action)' },
        { signature: 'onActionLoop(action)' },
        { signature: 'onActionStop(action)' },
        { signature: 'onUpdate()' },
        { signature: 'onFlush()' },
        { signature: 'onInputText(text)' },
        { signature: 'onCameraChanged(mode)' },
      ]
    },
    player: {
      name: 'player',
      slotId: -3,
      events: [
        { signature: 'onParentChanged(oldId,newId)' },
      ],
    },
    construct: {
      name: 'construct',
      slotId: -2,
      events: [
        { signature: 'onDocked(id)' },
        { signature: 'onUndocked(id)' },
        { signature: 'onPlayerBoarded(id)' },
        { signature: 'onVRStationEntered(id)' },
        { signature: 'onConstructDocked(id)' },
        { signature: 'onPvPTimer(active)' },
      ],
    },
    unit: {
      name: 'unit',
      slotId: -1,
      events: [
        { signature: 'onStart()' },
        { signature: 'onStop()' },
        { signature: 'onTimer(timerId)' },
      ],
    },
  };

  /**
   * Processes a build into a slot list
   * @param build The build being processed
   */
  private static getSlotListFromLinkedElements(build: Build): SimpleMap<DULuaConfigSlot> {
    // This will be our result object
    const result: SimpleMap<DULuaConfigSlot> = {};

    // Protected names
    const protectedNames = [
      'DUConstruct',
      'DULibrary',
      'DUSystem',
      'DUPlayer',
      ...Object.keys(this.internalSlots)
    ];

    // Different slot types
    const slotIds = {
      normal: 0,
      weapon: 10,
      pvpRadar: 20,
    };

    // Gets available element types
    const elementTypes = ElementTypes.getAllTypes();

    // Builds our result
    build.getLinkedElements().forEach((linkedElement, index) => {
      // Fails if the linked element has an internal name
      if (protectedNames.includes(linkedElement.name)) {
        throw new Error(`Build ${ColorScheme.highlight(build.name)} uses a reserved linked element name: ${ColorScheme.highlight(linkedElement.name)}`);
      }

      // Gets the slot id
      const slotId = ((type) => {
        switch (type) {
          case 'weapon': return slotIds.weapon++;
          case 'pvpRadar': return slotIds.pvpRadar;
          default: return slotIds.normal++;
        }
      })(linkedElement.type);

      // Gets the slot type
      const slotType = elementTypes[linkedElement.type];

      // Fails on error
      if (!slotType) {
        throw new Error(`Could not find element of type ${ColorScheme.highlight(linkedElement.type)} on build ${ColorScheme.highlight(build.name)}, link ${ColorScheme.highlight(linkedElement.name)}`);
      }

      // Sets the link
      result[linkedElement.name] = {
        name: linkedElement.name,
        slotId,
        events: slotType.events || [],
        class: slotType.class || undefined,
        select: linkedElement.select,
      };
    });

    // Done
    return result;
  }

  // TODO: port code from buildJsonConf.js @ line 503
  getAutoConfigEntry(slot: DULuaConfigSlot) {

  }

  /**
   * Creates a config file from a compiler result
   * @param compilerResult 
   */
  static fromCompilerResult(compilerResult: DULuaCompilerResult): DULuaConfig {
    // This will be our autoconf object
    const autoconf = new Map();
    
    // This is all our slots
    const slots = {
      ...this.internalSlots,
      ...this.getSlotListFromLinkedElements(compilerResult.build),
    };

    // Processes the slots
    for (let slotName in slots) {
      // Creates the autoconf entry
      autoconf.set(slots[slotName].slotId, this.getAutoConfigEntry(slots[slotName]));
    }
  }
}