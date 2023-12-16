import { SimpleMap } from "./SimpleMap";
import AllElementTypes from '../data/ElementTypes';

/**
 * Represents an element type event
 */
export type ElementTypeEvent = {
  signature: string
};

/**
 * Represents an element type
 */
export type ElementType = {
  title: string,
  value: string,
  class: string,
  luaClass?: string,
  events?: ElementTypeEvent[],
  description?: string,
} 

/**
 * Represents an element category
 */
export type ElementCategory = {
  title: string,
  disabled: boolean,
};

/**
 * Represents all element types and categories
 */
export type ElementTypeOrCategory = ElementType | ElementCategory;

/**
 * Represents a list of element types and categories, keyed by their identifier
 */
export type ElementTypeOrCategoryList = SimpleMap<ElementTypeOrCategory>;

/**
 * Represents a list of element types, keyed by their identifier
 */
export type ElementTypeList = SimpleMap<ElementType>;

export default class ElementTypes {
  /**
   * Returns if something is an element type
   * @param entry The value we're checking for
   */
  static isElementType(entry: ElementTypeOrCategory) {
    return undefined !== (entry as ElementType).value;
  }

  /**
   * Returns if something is an element type
   * @param entry The value we're checking for
   */
  static isElementCategory(entry: ElementTypeOrCategory) {
    return undefined !== (entry as ElementCategory).disabled;
  }

  /**
   * Gets a list of all registered element types
   */
  static getAllTypes(): ElementTypeList {
    // Gets all element types
    const allTypesAndCategories = this.getAllTypesForSelection();

    // Filters only element types
    const elementTypes: ElementTypeList = {};
    for (let id in allTypesAndCategories) {
      const elementType = allTypesAndCategories[id];
      if (this.isElementType(elementType)) {
        elementTypes[id] = elementType as ElementType;
      }
    }

    // Returns our finished list
    return elementTypes;
  }

  /**
   * Gets a list of all registered element types for selection
   */
  static getAllTypesForSelection(): ElementTypeOrCategoryList {
    return AllElementTypes;
  }

  /**
   * Gets an element type by id
   */
  static getElementByType(type: string): ElementType | null {
    return this.getAllTypes()[type] || null;
  }

  /**
   * Gets whether an element type exists or not
   */
  static elementTypeExists(type: string): boolean {
    return !!this.getElementByType(type);
  }
}