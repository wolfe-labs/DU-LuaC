import fs from "fs";
import path from "path";
import Application from "../Application";
import Build from "../types/Build";
import BuildTarget from "../types/BuildTarget";
import ElementTypes, { ElementType, ElementTypeEvent } from "../types/ElementType";
import { SimpleMap } from "../types/SimpleMap";
import ColorScheme from "./ColorScheme";
import { DULuaCompilerResult } from "./DULuaCompiler";
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

export type DULuaAutoConfig = {
  slots: SimpleMap<DULuaAutoConfigSlot>,
  handlers: DULuaAutoConfigHandler[],
  methods: any[],
  events: any[],
};

export type DULuaAutoConfigSlot = {
  name: string,
  class?: string,
  select?: string,
  type: {
    methods: any[],
    events: any[],
  }
};

export type DULuaAutoConfigHandler = {
  key: number,
  filter: DULuaAutoConfigHandlerFilter,
  code: string,
};

export type DULuaAutoConfigHandlerFilter = {
  slotKey: number,
  signature: string,
  args: { variable: string }[],
};

export type DULuaAutoConfigHandlerFilterSignature = {
  name: string,
  args: string[],
};

// Compiler internals
const compilerInternals = {
  events: fs.readFileSync(Application.getPath('lua/Events.lua')).toString(),
  linking: fs.readFileSync(Application.getPath('lua/AutoConfig.lua')).toString(),
  decompression: fs.readFileSync(Application.getPath('lua/Decompression.lua')).toString(),
  compressedTemplate: fs.readFileSync(Application.getPath('lua/Compressed.lua')).toString(),
};

export class DULuaConfig {
  /**
   * This will store our slots, but not any code
   */
  private slots: Map<string, DULuaAutoConfigSlot> = new Map<string, DULuaAutoConfigSlot>();

  /**
   * This will store our handlers, the actual code
   */
  private handlers: DULuaAutoConfigHandler[] = [];

  /**
   * Unused?
   */
  private methods: any[] = [];

  /**
   * Unused?
   */
  private events: any[] = [];

  private constructor() {}

  /**
   * Converts the object into DU-readable format
   */
  public toDUAutoConfig(): DULuaAutoConfig {
    return {
      slots: Object.fromEntries(this.slots.entries()),
      handlers: this.handlers,
      events: this.events,
      methods: this.methods,
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
  private static getAutoConfigSlotEntry(slot: DULuaConfigSlot): DULuaAutoConfigSlot {
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
  private static parseEventSignature(signature: string): DULuaAutoConfigHandlerFilterSignature {
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
  private addAutoConfigHandlerEntry(slot: DULuaConfigSlot, event: ElementTypeEvent, code: string) {
    // Parses our event signature
    const parsedEvent = DULuaConfig.parseEventSignature(event.signature);

    // Creates the handler entry
    const entry: DULuaAutoConfigHandler = {
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
   * Creates a config file from a compiler result
   * @param compilerResult 
   */
  static fromCompilerResult(compilerResult: DULuaCompilerResult, buildTarget: BuildTarget): DULuaConfig {
    // Our final autoconf object
    const autoconf = new this();
    
    // This is all our slots
    const slots = {
      ...this.internalSlots,
      ...this.getSlotListFromLinkedElements(compilerResult.build),
    };

    // This is a "onStart" event
    const eventOnStart: ElementTypeEvent = { signature: 'onStart' };

    // Processes the slots
    for (let slotName in slots) {
      // Creates the autoconf entry
      autoconf.slots.set(slots[slotName].slotId.toString(), this.getAutoConfigSlotEntry(slots[slotName]));
    }

    // Adds Lua helpers
    if (compilerResult.build.options.helpers) {
      // Event handlers
      autoconf.addAutoConfigHandlerEntry(
        this.internalSlots.library,
        eventOnStart,
        buildTarget.minify
          ? this.runMinifier(compilerInternals.events)
          : compilerInternals.events
      );

      // Linking helpers
      autoconf.addAutoConfigHandlerEntry(
        this.internalSlots.library,
        eventOnStart,
        buildTarget.minify
          ? this.runMinifier(compilerInternals.linking)
          : compilerInternals.linking
      );

      // Decompression helper, only for compressed builds
      if (compilerResult.build.options.compress) {
        autoconf.addAutoConfigHandlerEntry(
          this.internalSlots.library,
          eventOnStart,
          buildTarget.minify
            ? this.runMinifier(compilerInternals.decompression)
            : compilerInternals.decompression
        );
      }
    }

    // Adds preloads
    if (compilerResult.build.options.preload) {
      // This is the code for our preload
      const preloadCode = compilerResult.preloads.map(
        (preload) => {
          // This is our main code, we returns the --export statements along with minifying it
          const code = this.restoreExports(
            buildTarget.minify
              ? this.runMinifier(preload.source)
              : preload.source,
            buildTarget.minify
          );

          // Now we generate a new preload string
          return `package.preload['${preload.path}']=(function()\n${code}\nend)`;
        }
      ).join('\n');

      // Adds the preloads
      autoconf.addAutoConfigHandlerEntry(
        this.internalSlots.library,
        eventOnStart,
        buildTarget.minify
          ? this.runMinifier(preloadCode)
          : preloadCode
      );
    }

    // Binds all event handlers
    if (compilerResult.build.options.events) {
      Object.keys(slots).forEach((slotName) => {
        const slot = slots[slotName];
        
        // Creates an event handler to pass data through to our handler library
        (slot.events || []).forEach((event) => {
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
          autoconf.addAutoConfigHandlerEntry(slot, event, code)
        });
      });
    }

    // This is our base code
    let mainCode = compilerResult.output;

    // Compresses code if needed
    if (compilerResult.build.options.compress) {
      mainCode = DULuaCompressor.compress(
        this.runMinifier(mainCode),
        this.runMinifier(compilerInternals.compressedTemplate)
      );
    } else {
      // Minifies code if needed
      mainCode = this.runMinifier(compilerResult.output);
    }

    // This is the entrypoint
    autoconf.addAutoConfigHandlerEntry(
      this.internalSlots.unit,
      eventOnStart,
      this.restoreExports(mainCode, buildTarget.minify)
    );

    // Done
    return autoconf;
  }
}