import fs from "fs";
import path from "path";
import Application from "../Application";
import Build, { BuildType } from "../types/Build";
import BuildTarget from "../types/BuildTarget";
import ElementTypes, { ElementType, ElementTypeEvent } from "../types/ElementType";
import { SimpleMap } from "../types/SimpleMap";
import ColorScheme from "./ColorScheme";
import { DULuaCompiler, DULuaCompilerResult } from "./DULuaCompiler";
import { DULuaCompressor } from "./DULuaCompressor";

// @ts-ignore
import luamin from "@wolfe-labs/luamin";
// @ts-ignore
import luamin2 from 'lua-format';
import { CLI } from "./CLI";
import { DULuaCompilerExport } from "./DULuaCompilerExport";
import Utils from "./Utils";
import SourceCodeProcessor from "./SourceCodeProcessor";

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
   * Returns the internal slots but with filtered events
   */
  private static getInternalSlotsWithFilteredEvents(events: SimpleMap<string[]>): SimpleMap<DULuaConfigSlot> {
    const slots = Utils.deepCopy(this.internalSlots);

    for (const slotName in slots) {
      const slot = slots[slotName];
      if (events[slotName]) {
        const allowedEvents = new Set(events[slotName]);
        const finalEvents = [];

        for (const event of slot.events || []) {
          const eventName = event.signature.split('(').shift()!;
          
          if (allowedEvents.has(eventName)) {
            finalEvents.push(event);
          }
        }

        slots[slotName].events = finalEvents;
      }
    }

    return slots;
  }

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
        events: linkedElement.getElementEvents(),
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
   * Builds a string that represents some globals converted into locals for minification
   */
  static buildMinifierGlobalsListForType(code: string, buildTarget: BuildTarget, buildType: BuildType) {
    // Those are some known DU globals we'll want to convert into locals for minification
    const globalsToMinifyPerType = {
      [BuildType.ControlUnit]: {
        'DUPlayer': ['DUPlayer', 'player'],
        'DUConstruct': ['DUConstruct', 'construct'],
        'DULibrary': ['DULibrary', 'library'],
        'DUSystem': ['DUSystem', 'system'],
      },
      [BuildType.RenderScript]: {

      },
    };

    return this.buildMinifierGlobalsList(code, buildTarget, globalsToMinifyPerType[buildType]);
  }

  /**
   * Builds a string that represents some globals converted into locals for minification
   */
  static buildMinifierGlobalsList(code: string, buildTarget: BuildTarget, globalsToMinify: Record<string, string[]> = {}) {
    // Counts those globals, to tell whether it's worth it or not
    const localGlobals = [];
    if (buildTarget.isAllowedToMinifyGlobals()) {
      for (const globalValue in globalsToMinify) {
        for (const globalName of globalsToMinify[globalValue]) {
          // Counts how many times this global has appeared
          const count = code.match(
            new RegExp(globalName, 'g')
          )?.length || 0;

          // If we have at least 3 repetitions, we should be able to minify it properly
          if (count >= buildTarget.minifyGlobalsCount!) {
            localGlobals.push({ globalValue, globalName });
          }
        }
      }
    }

    // Now, let's extract global members the same way as above
    const localGlobalMembers = [];
    if (buildTarget.isAllowedToMinifyGlobalMembers()) {
      for (const { globalName } of localGlobals) {
        // Counts how many times this global has appeared
        const matchedMembers = code.match(
          new RegExp(`(${globalName}[.][a-zA-Z_{1}][a-zA-Z0-9_]+)`, 'g')
        ) || [];

        // Gets the member count
        const matchedMemberCounts = matchedMembers.reduce((count: any, memberName: string) => Object.assign(count, {
          ...count,
          [memberName]: (count[memberName] || 0) + 1,
        }), {}) as Record<string, number>;

        // Saves our global members as needed
        for (const memberName in matchedMemberCounts) {
          const count = matchedMemberCounts[memberName];
          if (count >= buildTarget.minifyGlobalMembersCount!) {
            const newName = `__GLOBAL_MEMBER__${memberName.replace(/\./g, '_')}`;
            code = code.replace(new RegExp(memberName, 'g'), newName);
            localGlobalMembers.push({ memberName: newName, memberValue: memberName });
          }
        }
      }
    }

    // Builds our locals
    const locals = [];
    if (localGlobals.length > 0) {
      locals.push(
        `${localGlobals.map(globalPair => globalPair.globalName).join(', ')} = ${localGlobals.map(globalPair => globalPair.globalValue).map(globalName => `_G['${globalName}']`).join(', ')}`
      );
      
      // Processes the members
      if (localGlobalMembers.length > 0) {
        locals.push(
          `${localGlobalMembers.map(memberPair => memberPair.memberName).join(', ')} = ${localGlobalMembers.map(memberPair => memberPair.memberValue).join(', ')}`
        );
      }
    }

    // Builds the string that will trigger the minification
    const localsString = locals.map(localString => `local ${localString}`)
      .join('\n')
      .trim();
    return {
      code: `${localsString}\n${code}`.trim(),
      locals: locals,
      localsString: localsString,
    };
  }

  /**
   * Runs the right minifier with optiuonal global to local conversion
   */
  static runMinifierWithOptionalGlobalConversion(code: string, buildTarget: BuildTarget, buildType: BuildType): string {
    // Invokes the minifier
    return (buildTarget.isAllowedToMinifyGlobals())
      ? this.runMinifier(
        this.buildMinifierGlobalsListForType(code, buildTarget, buildType).code,
        buildTarget
      )
      : this.runMinifier(code, buildTarget);
  }

  /**
   * Runs the right minifier based on the build target settings
   */
  static runMinifier(code: string, buildTarget: BuildTarget): string {
    return (
      this.applyMinificationViaLuamin(code)
      // buildTarget.minifyOptions
      //   ? this.applyMinificationViaLuaFormat(code, buildTarget.minifyOptions)
      //   : this.applyMinificationViaLuamin(code)
    ).trim()
      .replace(/\r/gi, '')
      .replace(/[\n\s]{2,}/gi, ' ')
  }

  /**
   * Runs the minifier on a piece of code using the luamin package
   * @param code 
   */
  private static applyMinificationViaLuamin(code: string): string {
    let minified: string = code;
    try {
      // Minifies code
      minified = luamin.minify(code);

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
   * Runs the minifier on a piece of code using the lua-format package
   * @param code 
   */
  private static applyMinificationViaLuaFormat(code: string, options: any = {}): string {
    let minified: string = code;
    try {
      // Minifies code
      minified = luamin2.Minify(code, options)
        .split('\n')
        .slice(1)
        .join('\n');

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
   * Isolates a compiler internal into its own context
   * @param code 
   * @returns 
   */
  private static isolateCompilerInternal(code: string, buildTarget: BuildTarget) {
    return `;(function()\n${
      Application.isDebugging()
        ? code
        : this.runMinifier(code, buildTarget)
    }\nend)()`;
  }

  /**
   * Does post-processing accordingly to build target options
   */
  private static applyCodePostProcessing(code: string, buildTarget: BuildTarget, minify: boolean = false): string {
    // Post-processes output code
    code = SourceCodeProcessor.prepareLuaOutputCode(code);
    
    // Strips comments if necessary
    if (buildTarget.stripComments) {
      // Strips multi-line comments
      code = code.replace(/--\[\[[\s\S]*?\]\]\s*?\n/g, '');

      // Strips single-line comments, except --export ones
      code = code.split('\n')
        .map(line => `${line}\n`)
        .map(line => {
          // Avoid matching strings with a sequence of dashes
          if (line.match(/'.*?--.*?'/g) || line.match(/"--.*?.*?"/g)) {
            return line;
          }

          // Cleans-up the comments
          return line.replace(/(--.*?\n)/g, (match) => match.startsWith('--export') ? match : '');
        })
        .join('');

      // Removes whitespace around the code
      code = code.trim();
    }

    // Handles minification
    if (minify) {
      code = this.runMinifier(code, buildTarget);
    }

    return code;
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
      ...this.getInternalSlotsWithFilteredEvents(compilerResult.build.events),
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
        this.isolateCompilerInternal(compilerInternals.events, buildTarget)
      );

      // Linking helpers
      autoconf.addUnitConfigHandlerEntry(
        this.internalSlots.library,
        eventOnStart,
        this.isolateCompilerInternal(compilerInternals.linking, buildTarget)
      );

      // Decompression helper, only for compressed builds
      if (compilerResult.build.options.compress) {
        autoconf.addUnitConfigHandlerEntry(
          this.internalSlots.library,
          eventOnStart,
          Application.isDebugging()
            ? compilerInternals.decompression
            : this.runMinifier(compilerInternals.decompression, buildTarget)
        );
      }
    }

    // Restores preloads
    const preloads = compilerResult.preloads.map(
      (preload) => {
        // Runs the minification
        const code = buildTarget.minify
            ? this.runMinifier(preload.source, buildTarget)
            : preload.source;

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
        (preload) => `package.preload['${preload.path}']=(function()\n${this.applyCodePostProcessing(preload.code, buildTarget, buildTarget.minify)}\nend)`
      ).join('\n');

      if (buildTarget.isAllowedToMinifyGlobals() && this.buildMinifierGlobalsListForType(preloadCode, buildTarget, compilerResult.build.type).locals.length > 0) {
        mainPrepend.push(preloadCode);
      } else {
        // Adds the preloads
        autoconf.addUnitConfigHandlerEntry(
          this.internalSlots.library,
          eventOnStart,
          preloadCode,
        );
      }
    } else {
      // Inlines code at beginning of the main code as Lua preloads, but we invoke that function too, since Lua requires won't be used
      if (preloads.length > 0) {
        mainPrepend.push(
          `-- Required files, generated by compiler`,
          `${DULuaCompiler.globalInlineRequire} = {}`,
          ...preloads.map(
            (preload) => `${DULuaCompiler.globalInlineRequire}['${preload.path}']=(function()\n${this.applyCodePostProcessing(preload.code, buildTarget, buildTarget.minify)}\nend)()`
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

    // Those are the code "parts"
    const mainCodeParts = [compilerResult.output];
    if (mainPrepend.length > 0) {
      mainCodeParts.unshift(mainPrepend.join('\n'));
    }

    // This is our base code
    let mainCode = mainCodeParts.join('\n\n');

    // Creates the global -> local conversion
    if (buildTarget.isAllowedToMinifyGlobals()) {
      mainCode = this.buildMinifierGlobalsListForType(mainCode, buildTarget, compilerResult.build.type).code;
    }

    // Does initial post-processing
    mainCode = this.applyCodePostProcessing(mainCode, buildTarget, buildTarget.minify || compilerResult.build.options.compress);

    // Applies the variable exports on top
    mainCode = SourceCodeProcessor.getCompilerResultOutput(compilerResult, mainCode);

    // Compresses main code if needed
    if (compilerResult.build.options.compress) {
      mainCode = DULuaCompressor.compress(
        mainCode,
        this.runMinifier(compilerInternals.compressedTemplate, buildTarget)
      );
    }

    // This is the entrypoint
    autoconf.setMainCode(mainCode, buildTarget);

    // Done
    return autoconf;
  }
}