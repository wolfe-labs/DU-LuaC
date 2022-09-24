import BuildLinkedElement from "./BuildLinkedElement";
import { SimpleMap } from "./SimpleMap";

export enum BuildType {
  ControlUnit = 'control',
  RenderScript = 'screen',
}

export default class Build {
  /**
   * The name of the script
   */
  name: string = '';

  /**
   * The type of the script
   */
  type: BuildType = BuildType.ControlUnit;

  /**
   * The linked elements on that script
   */
  private linkedElements: SimpleMap<BuildLinkedElement> = {};

  /**
   * Hydrates our build
   * @param data The data for our build
   */
  constructor(data: any) {
    this.name = data.name;
    this.type = data.type;

    // Parses slots
    Object.keys(data.slots || {}).forEach((slotName) => {
      this.linkedElements[slotName] = data.slots[slotName] as BuildLinkedElement;
    });
  }

  /**
   * Gets the file path to this build entry
   */
  getFilePath(): string {
    return `${this.name}.lua`;
  }

  /**
   * Converts our build definition into a JSON object
   */
  toJSON(): object {
    // Serializes our slots
    const slots: SimpleMap<object> = {};
    Object.keys(this.linkedElements || {}).forEach((slotName) => {
      const slot = this.linkedElements[slotName];
      slots[slotName] = slot;
    });

    // Our completed element
    return {
      name: this.name,
      type: this.type,
      slots,
    };
  }
}