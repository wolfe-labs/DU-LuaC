import fs from "fs";
import path from "path";
import Application from "../Application";
import Build from "../types/Build";
import BuildTarget from "../types/BuildTarget";
import ElementTypes, { ElementType, ElementTypeEvent } from "../types/ElementType";
import { SimpleMap } from "../types/SimpleMap";
import ColorScheme from "./ColorScheme";
import { DULuaCompiler, DULuaCompilerResult } from "./DULuaCompiler";
import { DULuaCompressor } from "./DULuaCompressor";

// @ts-ignore
import luamin from "@wolfe-labs/luamin";
import { CLI } from "./CLI";
import { DULuaCompilerExport } from "./DULuaCompilerExport";

export type DULuaConfigSlot = {
  name: string,
  slotId: number,
  events?: ElementTypeEvent[],
  class?: string,
  select?: string,
};

/**
 * The types below refer to "unit config", which mean the JSON and YAML outputs, not CONF!
 */

export type DULuaUnitConfig = {
  slots: SimpleMap<DULuaUnitConfigSlot>,
  handlers: DULuaUnitConfigHandler[],
  methods: any[],
  events: any[],
};

export type DULuaUnitConfigSlot = {
  name: string,
  class?: string,
  select?: string,
  type: {
    methods: any[],
    events: any[],
  }
};

export type DULuaUnitConfigHandler = {
  key: number,
  filter: DULuaUnitConfigHandlerFilter,
  code: string,
};

export type DULuaUnitConfigHandlerFilter = {
  slotKey: number,
  signature: string,
  args: { variable: string }[],
};

export type DULuaUnitConfigHandlerFilterSignature = {
  name: string,
  args: string[],
};

/**
 * The types below now refer to the "auto config", aka the CONF files!
 * Autoconf should follow this format:
 * {
 *   name: "Your Config Name",
 *   slots: { slotName: slotObject },
 *   handlers: slotHandlers,
 * }
 */
export type DULuaAutoConfig = {
  name: string,
  slots: SimpleMap<DULuaAutoConfigSlot>,
  handlers: SimpleMap<DULuaAutoConfigSlotHandler>
};

/**
 * Slots follow the format:
 * {
 *   name: "test_variable",
 *   class: "FuelContainer",
 *   select: "all",
 *   type: {
 *     methods: [],
 *     events: [],
 *   },
 * }
 */
export type DULuaAutoConfigSlot = {
  name: string,
  class?: string,
  select: string | null,
  type: {
    methods: any[],
    events: any[],
  }
};

/**
 * Slot handlers follow the format:
 * { event: handlerObject }
 */
export type DULuaAutoConfigSlotHandler = SimpleMap<DULuaAutoConfigHandler>;

/**
 * Handlers follow the format:
 * { lua: "your lua code here" }
 */
export type DULuaAutoConfigHandler = {
  lua: string,
};

// Compiler internals
const compilerInternals = {
  events: fs.readFileSync(Application.getPath('lua/Events.lua')).toString(),
  linking: fs.readFileSync(Application.getPath('lua/AutoConfig.lua')).toString(),
  decompression: fs.readFileSync(Application.getPath('lua/Decompression.lua')).toString(),
  compressedTemplate: fs.readFileSync(Application.getPath('lua/Compressed.lua')).toString(),
};

// This is a "onStart" event
const eventOnStart: ElementTypeEvent = { signature: 'onStart()' };

export class DULuaConfig {
  /**
   * This will store our slots, but not any code
   */
  private slots: Map<string, DULuaUnitConfigSlot> = new Map<string, DULuaUnitConfigSlot>();

  /**
   * This will store our handlers, the actual code
   */
  private handlers: DULuaUnitConfigHandler[] = [];

  /**
   * This is the main code
   */
  private mainCode: string = '';

  /**
   * Unused?
   */
  private methods: any[] = [];

  /**
   * Unused?
   */
  private events: any[] = [];

  private constructor(
    private compilerResult: DULuaCompilerResult,
  ) { }

  /**
   * Converts the object into DU-readable format (JSON/YAML files only!)
   */
  public toDUUnitConfig(): DULuaUnitConfig {
    return {
      slots: Object.fromEntries(this.slots.entries()),
      handlers: this.handlers,
      events: this.events,
      methods: this.methods,
    };
  }

  /**
   * Converts the object into DU-readable format autoconf format (.conf files only!)
   */
  public toDUAutoConfig(): DULuaAutoConfig {
    // This is the config name that will show on the autoconf drop-down
    const name = this.compilerResult.build.title || `${this.compilerResult.project.name} ${this.compilerResult.build.name}`;

    // Prepates list of slots
    const slots: SimpleMap<DULuaAutoConfigSlot> = {};
    const handlers: SimpleMap<DULuaAutoConfigSlotHandler> = {};
    for (let slotKey in Object.fromEntries(this.slots.entries())) {
      // Retrieves slot info
      const slot = this.slots.get(slotKey)!;

      // Only add slots to definition if they aren't internal to DU already
      if (!DULuaConfig.internalSlots[slot.name]) {
        slots[slot.name] = {
          ...slot,
          select: slot.select || null,
        };
      }

      // Also creates the entry on handlers
      handlers[slot.name] = {};
    }

    // Processes handlers
    this.handlers.forEach((handler) => {
      // Gets the slot for this handler
      const slot = this.slots.get(handler.filter.slotKey.toString())!;

      // Parses the signature
      const signature = handler.filter.signature;

      // Now add the handler code
      handlers[slot.name][signature] = {
        lua: [
          handlers[slot.name][signature]?.lua || '',
          handler.code,
        ].join('\n').trim(),
      };
    });

    // Builds our final config object
    return {
      name,
      slots,
      handlers,
    };
  }

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

  /**
   * Creates an autoconf slot entry for a project slot
   * @param slot The config slot
   */
  private static getUnitConfigSlotEntry(slot: DULuaConfigSlot): DULuaUnitConfigSlot {
    return {
      name: slot.name,
      class: slot.class,
      select: slot.select,
      type: {
        events: [],
        methods: [],
      },
    };
  }
  
  /**
   * Parses an event signature
   * @param signature The event signature
   */
  private static parseEventSignature(signature: string): DULuaUnitConfigHandlerFilterSignature {
    // Gets a list of arguments from the event signature
    const parsed = /(.*?)\s*\((.*?)\)/g.exec(signature) || [];

    // Returns parsed result
    return {
      name: parsed[1] || '',
      args: (parsed[2] || '')
        .split(',')
        .map((arg) => arg.trim())
        .filter((arg) => arg.length > 0)
    };
  }

  /**
   * Creates an autoconf handler entry for a project slot
   * @param slot The config slot
   * @param code The code for that
   */
  private addUnitConfigHandlerEntry(slot: DULuaConfigSlot, event: ElementTypeEvent, code: string) {
    // Parses our event signature
    const parsedEvent = DULuaConfig.parseEventSignature(event.signature);

    // Creates the handler entry
    const entry: DULuaUnitConfigHandler = {
      key: this.handlers.length + 1,
      filter: {
        slotKey: slot.slotId,
        signature: event.signature,
        args: parsedEvent.args.map((arg) => Object.assign({ variable: '*' })),
      },
      code: code,
    };

    // Adds the entry
    this.handlers.push(entry);
  }

  /**
   * Sets the main code for the entry-point on that Control Unit
   * @param code The Lua code for the Control Unit
   */
  private setMainCode(code: string, buildTarget: BuildTarget) {
    // Expands --export statements
    this.mainCode = DULuaConfig.restoreExports(code, buildTarget.minify);

    // Adds the actual event handler
    this.addUnitConfigHandlerEntry(
      DULuaConfig.internalSlots.unit,
      eventOnStart,
      this.mainCode
    );
  }

  /**
   * Returns the main code for this Control Unit
   */
  public getMainCode(): string {
    return this.mainCode;
  }

  /**
   * Runs the minifier on a piece of code
   * @param code 
   */
  static runMinifier(code: string): string {
    let minified: string = code;
    try {
      // Minifies code
      minified = luamin.minify(code)
        .replace(/\r/gi, '')
        .replace(/[\n\s]{2,}/gi, ' ');

      // We need to do some processing on the code here
    } catch (err) {
      // Panics
      CLI.error('Error during minification:', err);
      CLI.code(code);
      CLI.panic();
    }
    return minified;
  }

  /**
   * Restores --export statements from a piece of code
   * @param code The code being restored
   * @param isMinified Was the code already minified?
   */
  static restoreExports(code: string, isMinified: boolean): string {
    return code.split('\n')
      .map((line) => DULuaCompilerExport.decodeAllExportStatements(line, isMinified))
      .join('\n');
  }

  /**
   * Gets a list of the internal slot names
   */
  static getInternalSlotNames(): string[] {
    return Object.keys(this.internalSlots);
  }

  /**
   * Creates a config file from a compiler result
   * @param compilerResult 
   */
  static fromCompilerResult(compilerResult: DULuaCompilerResult, buildTarget: BuildTarget): DULuaConfig {
    // Our final autoconf object
    const autoconf = new this(compilerResult);
    
    // This is all our slots
    const slots = {
      ...this.internalSlots,
      ...this.getSlotListFromLinkedElements(compilerResult.build),
    };

    // Processes the slots
    for (let slotName in slots) {
      // Creates the autoconf entry
      autoconf.slots.set(slots[slotName].slotId.toString(), this.getUnitConfigSlotEntry(slots[slotName]));
    }

    // Stuff that's going to be prepended to main
    let mainPrepend = [];

    // Adds Lua helpers
    if (compilerResult.build.options.helpers) {
      // Event handlers
      autoconf.addUnitConfigHandlerEntry(
        this.internalSlots.library,
        eventOnStart,
        Application.isDebugging()
          ? compilerInternals.events
          : this.runMinifier(compilerInternals.events)
      );

      // Linking helpers
      autoconf.addUnitConfigHandlerEntry(
        this.internalSlots.library,
        eventOnStart,
        Application.isDebugging()
          ? compilerInternals.linking
          : this.runMinifier(compilerInternals.linking)
      );

      // Decompression helper, only for compressed builds
      if (compilerResult.build.options.compress) {
        autoconf.addUnitConfigHandlerEntry(
          this.internalSlots.library,
          eventOnStart,
          Application.isDebugging()
            ? compilerInternals.decompression
            : this.runMinifier(compilerInternals.decompression)
        );
      }
    }

    // Restores preloads
    const preloads = compilerResult.preloads.map(
      (preload) => {
        // This is our main code, we returns the --export statements along with minifying it
        const code = this.restoreExports(
          buildTarget.minify
            ? this.runMinifier(preload.source)
            : preload.source,
          buildTarget.minify
        );

        // Now we generate a new preload string
        return {
          path: preload.path,
          code,
        };
      }
    );

    // Adds preloads
    if (compilerResult.build.options.preload) {
      // Formats our preload as a proper Lua preload
      const preloadCode = preloads.map(
        (preload) => `package.preload['${preload.path}']=(function()\n${preload.code}\nend)`
      ).join('\n');

      // Adds the preloads
      autoconf.addUnitConfigHandlerEntry(
        this.internalSlots.library,
        eventOnStart,
        preloadCode,
      );
    } else {
      // Inlines code at beginning of the main code as Lua preloads, but we invoke that function too, since Lua requires won't be used
      if (preloads.length > 0) {
        mainPrepend.push(
          `-- Required files, generated by compiler`,
          `${DULuaCompiler.globalInlineRequire} = {}`,
          ...preloads.map(
            (preload) => `${DULuaCompiler.globalInlineRequire}['${preload.path}']=(function()\n${preload.code}\nend)()`
          )
        );
      }
    }

    // Binds all event handlers
    if (compilerResult.build.options.events) {
      // Adds event support to all slots
      const slotEventInitializationCode = Object.keys(slots)
        .map((slotName) => `library.addEventHandlers(${slotName})`)
        .join('\n');
      autoconf.addUnitConfigHandlerEntry(this.internalSlots.library, eventOnStart, slotEventInitializationCode);

      // Adds event handlers
      Object.keys(slots).forEach((slotName) => {
        const slot = slots[slotName];
        
        // Creates an event handler to pass data through to our handler library
        (slot.events || []).forEach((event) => {
          // Skips a few events that wouldn't be called anyways
          if ([
            'player.onStart()',
            'construct.onStart()',
            'library.onStart()',
            'unit.onStart()',
          ].includes(`${slot.name}.${event.signature}`)) {
            return;
          }

          // Parses the event
          const parsedEvent = this.parseEventSignature(event.signature);

          // Generates the args
          const args = [
            `'${parsedEvent.name}'`,
            ...parsedEvent.args,
          ];

          // Generates our code
          const code = `${slotName}:triggerEvent(${args.join(',')})`;

          // Adds the slot handler
          autoconf.addUnitConfigHandlerEntry(slot, event, code);
        });
      });
    }

    // This is our base code
    let mainCode = [
      mainPrepend.join('\n'),
      compilerResult.output,
    ].join('\n\n');

    // Compresses code if needed
    if (compilerResult.build.options.compress) {
      mainCode = DULuaCompressor.compress(
        this.runMinifier(mainCode),
        this.runMinifier(compilerInternals.compressedTemplate)
      );
    } else if (buildTarget.minify) {
      // Minifies code if needed
      mainCode = this.runMinifier(mainCode);
    }

    // This is the entrypoint
    autoconf.setMainCode(mainCode, buildTarget);

    // Done
    return autoconf;
  }
}