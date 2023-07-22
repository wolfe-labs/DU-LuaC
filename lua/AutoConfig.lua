---@class Library
local library = DULibrary or {}

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

  -- Let's use the Control Unit's OUT plugs to detect linked elements
  for linkIndex, linkInfo in pairs(unit.getOutPlugs()) do
    local linkedElement = unit[linkInfo.name]

    if 'table' == type(linkedElement) and 'function' == type(linkedElement.getClass) then
      -- Runs filters of whether this slot is valid
      local filterAllow = true
      for prop, value in pairs(filters) do
        if not ('function' == type(linkedElement[prop]) and value == linkedElement[prop]():sub(1, #value)) then
          filterAllow = false
          break
        end
      end

      -- Adds element to results if passed filter
      if filterAllow then
        if noLinkNames then
          table.insert(links, linkedElement)
        else
          links[linkInfo.name] = linkedElement
        end
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