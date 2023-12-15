import ElementTypes, { ElementType, ElementTypeEvent } from "./ElementType";

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
   * Slots events to be registered
   */
  events?: string[];

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

  /**
   * Gets the list of events for this element
   */
  getElementEvents(): ElementTypeEvent[] {
    const baseEvents = this.getElementType().events || [];
    
    // Returns base list of events if we don't have anything custom set
    if (!this.events) {
      return baseEvents;
    }

    // This is our list of allowed events
    const allowedEvents = new Set(this.events);

    // Builds our final list of events
    const finalEvents: ElementTypeEvent[] = [];
    for (const event of baseEvents) {
      const eventName = event.signature.split('(').shift()!;

      if (allowedEvents.has(eventName)) {
        finalEvents.push(event);
      }
    }

    return finalEvents;
  }
}