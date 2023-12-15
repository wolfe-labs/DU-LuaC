import ColorScheme from "../lib/ColorScheme";
import BuildLinkedElement from "./BuildLinkedElement";
import BuildTarget from "./BuildTarget";
import ElementTypes from "./ElementType";
import { SimpleMap } from "./SimpleMap";

export enum BuildType {
  ControlUnit = 'control',
  RenderScript = 'screen',
}

export type BuildOptions = {
  // Should we have event handler helpers?
  events: boolean,

  // Should we use package.preload instead of inlining Lua on requires?
  preload: boolean,

  // Should we have helpers to things such as finding links?
  helpers: boolean,

  // Should we compress the script output?
  compress: boolean,
};

export default class Build {
  /**
   * The name of the script
   */
  name: string = '';

  /**
   * The autoconf name of the script
   */
  title?: string;

  /**
   * The type of the script
   */
  type: BuildType = BuildType.ControlUnit;

  /**
   * A list of events allowed for internal slots
   */
  events: SimpleMap<string[]> = {};

  /**
   * The linked elements on that script
   */
  private linkedElements: SimpleMap<BuildLinkedElement> = {};

  /**
   * The build options for this script
   */
  readonly options: BuildOptions;

  /**
   * Gets the default build options
   */
  getDefaultOptions(type: BuildType) {
    switch (type) {
      // Render Scripts
      case BuildType.RenderScript:
        return {
          events: false,
          preload: false,
          helpers: false,
          compress: false,
        };
      // Control Units (default)
      case BuildType.ControlUnit:
      default:
        return {
          events: true,
          preload: true,
          helpers: true,
          compress: false,
        };
    }
  }

  /**
   * Hydrates our build
   * @param data The data for our build
   */
  constructor(data: any) {
    if (!data.name) {
      throw new Error(`Can't initialize a Build without a name! Data: ${JSON.stringify(data)}`);
    }

    this.name = data.name;
    this.title = data.title;
    this.type = data.type || BuildType.ControlUnit;
    this.events = data.events || {};

    // Parses slots
    (Array.isArray(data.slots) ? data.slots : Object.values(data.slots || {})).forEach((slot: any) => {
      const linkedElement = new BuildLinkedElement(slot);
      this.linkedElements[linkedElement.name] = linkedElement;
    });

    // Build options
    const defaultOptions = this.getDefaultOptions(this.type);
    this.options = {
      events: (undefined !== data.noEvents && !data.noEvents) || defaultOptions.events,
      preload: (undefined !== data.noPreload && !data.noPreload) || defaultOptions.preload,
      helpers: (undefined !== data.noHelpers && !data.noHelpers) || defaultOptions.helpers,
      compress: (undefined !== data.compress && data.compress) || defaultOptions.compress,
    };
  }

  /**
   * Gets the file path to this build entry
   */
  getFilePath(): string {
    return `${this.name}.lua`;
  }

  /**
   * Gets the linked elements of this build
   */
  getLinkedElements(): BuildLinkedElement[] {
    return Object.values(this.linkedElements);
  }

  /**
   * Gets the full build name in the target/build syntax
   * @param buildTarget The build target we're getting the name for
   */
  getFullName(buildTarget: BuildTarget): string {
    return `${buildTarget.name}/${this.name}`;
  }

  /**
   * Converts our build definition into a JSON object
   */
  toJSON(): object {
    // Our completed element
    return {
      name: this.name,
      type: this.type,
      slots: Object.values(this.linkedElements || {}),
    };
  }
  
  /**
   * 
   * @param name The link name
   * @param type The link type
   */
  addLinkedElement(name: string, type: string) {
    // Checks if the type actually exists
    if (!Object.keys(ElementTypes.getAllTypes()).includes(type)) {
      throw new Error(`Invalid element type: ${ColorScheme.highlight(type)}`);
    }

    // Creates the linked element
    this.linkedElements[name] = new BuildLinkedElement({
      name: name,
      type: type,
    });
  }
}