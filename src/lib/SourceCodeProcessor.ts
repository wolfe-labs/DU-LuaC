/**
 * Utility class for cleaning-up Lua source code before processing or embedding
 */
export default class SourceCodeProcessor {
  public static prepareLuaInputCode(source: string) {
    return source
      .replace(/\r\n/g, `\n`)
      .replace(/\r/g, ``);
  }
  public static prepareLuaOutputCode(source: string) {
    return source
      .replace(/\r\n/g, `\n`)
      .replace(/\r/g, ``);
  }
}