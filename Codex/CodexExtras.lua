--- Returns a list of links of current unit
---@param filters table A list of filters where each key is a element function and the value is the desired value
---@param noLinkNames boolean When true the results will be keyed by the linking order instead of link name
---@return table
function library.getLinks(filters, noLinkNames) end

--- Returns a list of links of current unit by class
---@param className string The element class name you want to match against
---@param noLinkNames boolean When true the results will be keyed by the linking order instead of link name
---@return table
function library.getLinksByClass(className, noLinkNames) end

--- Returns a list of links of current unit by class
---@param className string The element class name you want to match against
---@return table
function library.getLinkByClass(className) end

--- Returns the linked Core Unit
---@return CoreUnit
function library.getCoreUnit() end

--- Returns a linked element with matching name
---@param elementName string The element name to be matched against
---@return Element
function library.getLinkByName(elementName) end