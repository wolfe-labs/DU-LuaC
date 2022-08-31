---@class Library
local library = DULibrary

--- Returns a list of elements linked to the current Control Unit
---@param filters table<string, string> A list of filters where each key is a element function and the value is the desired value
---@param noLinkNames boolean When true the results will be keyed by the linking order instead of link name
---@return table<string|number, Element>
function library.getLinks(filters, noLinkNames)
  -- List of links found
  local links = {}

  -- If no filters passed, fix it
  if not filters then
    filters = {}
  end

  -- Current link number
  local linkCount = 0

  -- Maps the found elements into the links list
  for linkName, element in pairs(unit) do
    if 'table' == type(element) and 'function' == type(element.getClass) then
      local passed = true

      -- Runs filters of whether this slot is valid
      for prop, value in pairs(filters) do
        if not ('function' == type(element[prop]) and value == element[prop]():sub(1, #value)) then
          passed = false
        end
      end

      -- If okay then add to results
      if passed then
        -- Skips link names?
        linkCount = linkCount + 1
        if noLinkNames then
          linkName = linkCount
        end

        -- Sets actual value
        links[linkName] = element
      end
    end
  end

  -- Done
  return links
end

--- Returns a list of elements linked to the current Control Unit of a specified class
---@param className string The element class name you want to match against
---@param noLinkNames boolean When true the results will be keyed by the linking order instead of link name
---@return table<string|number, Element>
function library.getLinksByClass(className, noLinkNames)
  return library.getLinks({
    getClass = className,
  }, noLinkNames)
end

--- Returns the first element linked to the current Control Unit of a specified class
---@param className string The element class name you want to match against
---@return Element
function library.getLinkByClass(className)
  return library.getLinksByClass(className, true)[1]
end

--- Returns the linked Core Unit
---@return CoreUnit
function library.getCoreUnit()
  return library.getLinkByClass('CoreUnit')
end

--- Returns a linked element with matching name
---@param elementName string The element name to be matched against
---@return Element
function library.getLinkByName(elementName)
  -- Gets the Core Unit
  local coreUnit = library.getCoreUnit()

  -- If no Core Unit found, returns nil
  if not coreUnit then
    error('getLinkByName requires a linked CoreUnit to work')
  end

  -- Gets a list of links
  local links = library.getLinks()

  -- Now filter those to find the proper element
  for _, element in pairs(links) do
    if elementName == coreUnit.getElementNameById(element.getLocalId()) then
      return element
    end
  end
end
