--[[ Those are the DU-LuaC Helpers ]]

--- Returns a list of elements linked to the current Control Unit
---@param filters table<string, string> A list of filters where each key is a element function and the value is the desired value
---@param noLinkNames boolean When true the results will be keyed by the linking order instead of link name
---@return table<string|number, Element>
function Library.getLinks(filters, noLinkNames) end

--- Returns a list of elements linked to the current Control Unit of a specified class
---@param className string The element class name you want to match against
---@param noLinkNames boolean When true the results will be keyed by the linking order instead of link name
---@return table<string|number, Element>
function Library.getLinksByClass(className, noLinkNames) end

--- Returns the first element linked to the current Control Unit of a specified class
---@param className string The element class name you want to match against
---@return Element
function Library.getLinkByClass(className) end

--- Returns the linked Core Unit
---@return CoreUnit
function Library.getCoreUnit() end

--- Returns a linked element with matching name
---@param elementName string The element name to be matched against
---@return Element
function Library.getLinkByName(elementName) end

--- Adds event handling to an object's instance
---@param obj table The object you are adding events to
function Library.addEventHandlers(obj) end

--- Clears all event handlers currently in use everywhere in the Lua context
function Library.clearAllEventHandlers() end

--- Embeds a local file (from your LuaC project) as a Lua string
---@param file string The file you are embedding
---@return string
function Library.embedFile(file) end