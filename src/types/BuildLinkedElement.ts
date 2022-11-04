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
}