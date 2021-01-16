------------------------------
-- Sample Library : Main
------------------------------

-- This object will be exported, it can have functions and properties. They will be made public
local SomeNamespace = {}

-- This function is only accessible from inside this file
local function foo ()
  return 'foo'
end

-- This function is part of SomeNamespace, which is currently being exported, it will be made public
function SomeNamespace.bar ()
  return foo() .. 'bar'
end

-- This function uses the 'require()' function to load the function we exported in other.lua
function SomeNamespace.barbaz ()
  return 'bar' .. require('other')()
end

-- This is what is exported off the library
return SomeNamespace