-- Extension to make event handlers more friendly
function library.addEventHandlers(obj)
  -- Does nothing when obj is null or already has events
  if (not obj) or (obj.onEvent and obj.triggerEvent) then
    return false
  end

  -- Adds a event handler counter
  local eventHandlerIds = 0

  -- This will store the event handlers
  local eventHandlers = {}

  -- Adds event handler
  obj.onEvent = (function (self, event, handler)
    -- If event handler is not a function trigger error
    if not 'function' == type(handler) then
      error('Event handler must be a function!')
    end

    -- Adds event handler array if missing
    if not eventHandlers[event] then
      eventHandlers[event] = {}
    end

    -- Adds the actual handler and returns a number identifying it (for removal)
    eventHandlerIds = eventHandlerIds + 1
    eventHandlers[event][eventHandlerIds] = handler

    -- Returns the ID for later removal
    return eventHandlerIds
  end)

  -- Removes event handler
  obj.clearEvent = (function (self, event, handlerId)
    if eventHandlers[event] and eventHandlers[event][handlerId] then
      table.remove(eventHandlers[event], handlerId)
    end
  end)

  -- Triggers event
  obj.triggerEvent = (function (self, event, ...)
    -- Processes each of the handlers
    for _, handler in pairs(eventHandlers[event] or {}) do
      handler(self, ...)
    end
  end)

  -- Returns true to indicate success
  return true
end