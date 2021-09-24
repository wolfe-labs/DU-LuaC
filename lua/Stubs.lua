-- Lua stubs for testing on CLI

-- Defines base DU globals
if not unit then unit = {} end
if not system then system = {} end
if not library then library = {} end

-- Prints a value to the console
function system.print (msg)
  print(msg)
end