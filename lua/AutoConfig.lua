-- Returns a list of links of current unit
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

-- Returns a list of links of current unit by class
function library.getLinksByClass(className, noLinkNames)
  return library.getLinks({
    getClass = className,
  }, noLinkNames)
end

-- Returns a list of links of current unit by class
function library.getLinkByClass(className)
  return library.getLinksByClass(className, true)[1]
end

-- Returns the linked Core Unit
function library.getCoreUnit()
  return library.getLinkByClass('CoreUnit')
end

-- Returns a list of links with matching type and name
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
    if elementName == coreUnit.getElementNameById(element.getId()) then
      return element
    end
  end
end