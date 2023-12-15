import ElementTypes from "./ElementType";

export default class BuildLinkedElement {
  /**
   * The name of our linked element
   */
  name: string = '';

  /**
   * The type of our linked element
   */
  type: string = '';

  /**
   * Slot selection mode ("all" or "manual")
   */
  select?: string;

  /**
   * Hydrates our linked element
   * @param data The data for our linked element
   */
  constructor(data: any) {
    if (!data.name) {
      throw new Error(`Can't initialize a Slot without a name! Data: ${JSON.stringify(data)}`);
    }
    if (!data.type) {
      throw new Error(`Can't initialize a Slot without a type! Data: ${JSON.stringify(data)}`);
    }
    if (!ElementTypes.elementTypeExists(data.type)) {
      throw new Error(`Can't initialize a Slot with invalid element type! Type: ${JSON.stringify(data.type)}`);
    }

    this.name = data.name;
    this.type = data.type;
    this.select = data.select;
    this.events = data.events;
  }

  /**
   * Gets the corresponding element type
   */
  getElementType(): ElementType {
    return ElementTypes.getElementByType(this.type)!;
  }
}