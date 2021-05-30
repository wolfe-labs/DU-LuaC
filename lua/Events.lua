-- Extension to make event handlers more friendly
function library.addEventHandlers(obj)
  -- Adds a event handler counter
  local eventHandlerIds = 0

  -- Adds event handler
  obj.onEvent = (function (self, event, handler)
    -- If event handler is not a function trigger error
    if not 'function' == type(handler) then
      error('Event handler must be a function!')
    end

    -- Adds event handlers if needed
    if not self.__eventHandlers then
      self.__eventHandlers = {}
    end

    -- Adds event handler array if missing
    if not self.__eventHandlers[event] then
      self.__eventHandlers[event] = {}
    end

    -- Adds the actual handler and returns a number identifying it (for removal)
    eventHandlerIds = eventHandlerIds + 1
    self.__eventHandlers[event][eventHandlerIds] = handler

    -- Returns the ID for later removal
    return eventHandlerIds
  end)

  -- Removes event handler
  obj.clearEvent = (function (self, event, handlerId)
    if seld.__eventHandlers and self.__eventHandlers[event] and self.__eventHandlers[event][handlerId] then
      table.remove(self.__eventHandlers[event], handlerId)
    end
  end)

  -- Triggers event
  obj.triggerEvent = (function (self, event, ...)
    -- Skip if the obj doesn't have event handlers
    if not self.__eventHandlers then return end
    
    -- Processes each of the handlers
    if self.__eventHandlers[event] then
      for _, handler in pairs(self.__eventHandlers[event]) do
        handler(self, ...)
      end
    end
  end)
end