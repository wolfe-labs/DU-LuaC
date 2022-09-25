import { type } from "os";
import { SimpleMap } from "./SimpleMap"
/**
 * Data structure that represents a class event param
 */
type CodexEventParam = {
  name: string,
  type: string,
  description?: string,
};

/**
 * Data structure that represents a class event
 */
type CodexEvent = {
  deprecated?: boolean,
  description?: string,
  params?: CodexEventParam[],
};

/**
 * Data structure that represents a class method param
 */
type CodexMethodParam = {
  name: string,
  type: string,
  description?: string,
};

/**
 * Data structure that represents a class method return
 */
type CodexMethodReturn = {
  type: string,
  description?: string,
};

/**
 * Data structure that represents a class method
 */
type CodexMethod = {
  deprecated?: boolean,
  description?: string,
  isMethodStatic?: boolean,
  params?: CodexMethodParam[],
  returns?: CodexMethodReturn[],
};

/**
 * Data structure that represents a class
 */
type CodexClass = {
  parent?: string,
  methods?: SimpleMap<CodexMethod>,
  events?: SimpleMap<CodexEvent>,
};

/**
 * Data structure that represents a global
 */
type CodexGlobal = {
  type: string,
};

/**
 * Data structure that represents the Codex
 */
type Codex = {
  classes?: SimpleMap<CodexClass>,
  globals?: SimpleMap<CodexGlobal>,
};

// Exposes our new types
export default Codex;
export { CodexClass, CodexGlobal, CodexEvent, CodexEventParam, CodexMethod, CodexMethodParam, CodexMethodReturn };