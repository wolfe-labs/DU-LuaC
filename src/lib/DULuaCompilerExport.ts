export type DULuaCompilerExportInfo = {
  name: string,
  default: string,
  comment: string,
};

/**
 * This class handles --export statements
 */
export class DULuaCompilerExport {
  /**
   * The hardcoded global for exporting values
   */
  static readonly globalName = '__EXPORT_VARIABLE';

  /**
   * Does this code has an --export statement?
   * @param code The code in question
   */
  static codeHasExportStatement(code: string): boolean {
    return code.includes('--export');
  }

  /**
   * Does this code has an encoded --export statement?
   * @param code The code in question
   */
  static codeHasEncodedExportStatement(code: string): boolean {
    return code.includes(`;${this.globalName}=[[`);
  }

  /**
   * Parses an --export statement from some code
   * @param code The code in question
   */
  static parseExportStatement(code: string): DULuaCompilerExportInfo | null {
    // Tries to match everything
    const match = /([A-z0-9_]+)\s*=\s*(.*?)\s*--export:?(.*)?/g.exec(code);

    // Stop if no matches
    if (!match) return null;

    // Done
    return {
      name: match[1].trim(),
      default: match[2].trim(),
      comment: (match[3] || '').trim(),
    };
  }

  /**
   * Encodes an --export statement for minification
   * @param code The code in question
   */
  static encodeExportStatement(code: string): string {
    // Parses our statement
    const parsedExport = this.parseExportStatement(code);

    // Done
    return `${this.globalName}=[[${JSON.stringify(parsedExport)}]]`
  }

  /**
   * Decodes an encoded --export statement from minification
   * @param code The code in question
   */
  static decodeExportStatement(code: string): string {
    // Parses our statement
    const rawExport = new RegExp(`${this.globalName}\\=\\[\\[(.*)\\]\\]`).exec(code);

    // Ignores if no matches
    if (!rawExport) return code;

    // Parses inner JSON
    const parsedExport = JSON.parse(rawExport[1]) as DULuaCompilerExportInfo;

    // Now we can rebuild our --export
    return this.convertToLuaCode(parsedExport);
  }

  /**
   * Converts the specified export info to Lua code
   * @param exportInfo The export info object
   */
  static convertToLuaCode(exportInfo: DULuaCompilerExportInfo): string {
    return (exportInfo.comment.trim().length > 0)
      ? `${exportInfo.name}=${exportInfo.default} --export: ${exportInfo.comment}`
      : `${exportInfo.name}=${exportInfo.default} --export`;
  }

  /**
   * Decodes all encoded --export statement from minification on a piece of code
   * @param code The code in question
   * @param isMinified Was the code already minified?
   */
  static decodeAllExportStatements(code: string, isMinified: boolean): string {
    // This is our search
    const search = new RegExp(`(${this.globalName}\\=\\[\\[.*?\\]\\])`, 'g');

    // Isolates our matches
    return code.replace(search, (src, match) => {
      return isMinified
        ? `\n${this.decodeExportStatement(match)}\n`
        : this.decodeExportStatement(match);
    });
  }
}