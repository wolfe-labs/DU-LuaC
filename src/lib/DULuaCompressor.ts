import { DULuaCompilerExport } from "./DULuaCompilerExport"

/**
 * This class is an almost direct port from the old compression code, it should work, but I don't recall exactly how
 */
export class DULuaCompressor {
  /**
   * Compresses a piece of Lua code
   * @param source The code being compressed
   * @param helperCompressed The Lua template for compressed files
   */
  static compress(source: string, helperCompressed: string): string {
    // Decodes all --export entries
    source = DULuaCompilerExport.decodeAllExportStatements(source, true);

    // Extracts any exports
    const params: {
      encoded: string,
      decoded: string,
    }[] = [];
    source = source
      .split('\n')
      .filter((line) => line.length > 0)
      .filter((line, idx) => {
        if (DULuaCompilerExport.codeHasExportStatement(line)) {
          // Parses our export
          const exportStatement = DULuaCompilerExport.parseExportStatement(line);

          // Adds export to list of parameters
          params.push({
            encoded: DULuaCompilerExport.encodeExportStatement(line),
            decoded: line,
          });

          // Excludes line
          return false;
        }

        // All good, keeps line
        return true;
      })
      .join('\n');

    // Escapes any existing "@", "%", "[[", "]]" on the body
    source = source
      .replace(/\@/g, '@@')
      .replace(/\%/g, '%%')
      .replace(/\[\[/g, '[@[')
      .replace(/\]\]/g, ']@]');

    // Raw statements
    const rawStatements = source
      // New lines, tabs, etc
      .replace(/[\n\r\t]/g, ' ')

      // Functions, arrays, etc
      .replace(/([\(\)\[\]])/g, ' $1 ')

      // Actual split
      .split(' ');

    // Combines strings
    const statements: string[] = [];
    const regexString = /(?<!\\)[\'\"]/g;
    let accumulator = null
    for (let iStatement = 0; iStatement < rawStatements.length; iStatement++) {
      const statement = rawStatements[iStatement];
      const stringOpenersAndClosers = (regexString.exec(statement) || []).length;

      // Handles accumulator
      if (accumulator) {
        accumulator += ' ' + statement;
      }

      // Handles opening and closing of strings, so we combine them
      if (stringOpenersAndClosers % 2 == 1) {
        if (accumulator) {
          // Resets accumulator, if it exists
          statements.push(accumulator);
          accumulator = null;
        } else {
          // Starts accumulator
          accumulator = statement;
        }
      }

      // If no accumulator is open, add the current string
      else if (!accumulator) {
        statements.push(statement);
      }
    }

    // Adds last statement, if any
    if (accumulator) {
      statements.push(accumulator);
    }

    // Gets most used statements
    const statementCounts = statements
      .map((statement) => statement.trim())
      .reduce((all: any, statement) => {
        all[statement] = (all[statement] || 0) + 1;
        return all;
      }, {});

    // Sorts values that might be most efficiently compressed, based on their length and how many times they repeat
    const mostUsedStatements = Object.keys(statementCounts).sort((a, b) => {
      if (a.length * statementCounts[a] > b.length * statementCounts[b]) return 1
      if (b.length * statementCounts[b] > a.length * statementCounts[a]) return -1
      return 0
    }).reverse();

    // Converts to index
    const indexable = [
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
      'A', 'B', 'C', 'D', 'E', 'F',
      // 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
      // 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
    ];
    const maxIndexables = 2
    const maxIndexableValue = Math.pow(indexable.length, maxIndexables)
    const convertToIndex = function (value: number) {
      let right = value % indexable.length;
      let left = (value - (value % indexable.length)) / indexable.length;
      return `${indexable[left]}${indexable[right]}`;
    }

    // Selects only meaningful statements
    const bestStatements = mostUsedStatements
      .filter((statement) => statementCounts[statement] > 1)
      .filter((statement) => statement.length > maxIndexables + 1)
      .slice(0, maxIndexableValue)
      .map((statement, idx) => [statement, convertToIndex(idx)]);

    // Gets size before compression
    const sourceSize = Buffer.byteLength(source, 'utf8');

    // Replaces the statements
    bestStatements.forEach((statement) => {
      // Prepares safe regex
      const escapedStatement = statement[0].replace(/[.*+\-?^${}()|[\]\\]/g, '\\$&');

      // Does replace
      source = source.replace(new RegExp(escapedStatement, 'g'), () => `@${statement[1]}`);
    })

    // Create a Lua table maping these statements
    const statementTable = bestStatements
      .map((statement) => `_${statement[1]}='${statement[0].replace(/\'/g, () => '\\\'')}'`)
      .join(',');

    // Now we write the Lua to inflate stuff back
    const inflateLua = helperCompressed
      .replace('__SYMBOLS__', () => statementTable)
      .replace('__SOURCE__', () => `\n${source}\n`)
      .replace('__PARAMS__()', () => `\n${params.map((param) => param.encoded).join('\n')}\n`)
      .replace(/\n+/g, '\n');

    // Done
    return inflateLua;

    // Informs compression stuff
    // const finalSize = Buffer.byteLength(inflateLua, 'utf8')
    // if (finalSize < sourceSize) {
    //   CLI.info('REDUCER', `Input size: ${prettyPrintSize(sourceSize)}`)
    //   CLI.info('REDUCER', `Final size: ${prettyPrintSize(finalSize)}`)
    //   CLI.info('REDUCER', `Total savings: ${prettyPrintSize(sourceSize - finalSize)} (Ratio: ${(100 * finalSize / sourceSize).toFixed(2)}%)`)
    //   return inflateLua
    // } else {
    //   CLI.info('REDUCER', `Compression had no effective result, skipping...`)
    //   return initialLua
    // }
  }
}