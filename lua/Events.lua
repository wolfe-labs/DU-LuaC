-- Extension to make event handlers more friendly
function library.addEventHandlers(obj)
  local eventHandlers = {}
  local eventHandlerIds = 0

  -- Adds event handler
  obj.onEvent = (function (event, handler)
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
    eventHandlers[eventHandlerIds] = handler
    return eventHandlerIds
  end)

  -- Removes event handler
  obj.clearEvent = (function (event, handlerId)
    if eventHandlers[event] then
      table.remove(eventHandlers[event], handlerId)
    end
  end)

  -- Triggers event
  obj.triggerEvent = (function (event, ...)
    if eventHandlers[event] then
      for _, handler in pairs(eventHandlers) do
        handler(table.unpack(...))
      end
    end
  end)
end