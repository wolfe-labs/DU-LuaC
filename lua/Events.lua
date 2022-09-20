-- Adds event handling to an object's instance
function library.addEventHandlers(obj)
  -- Does nothing when obj is null or already has events
  if (not obj) or (obj.onEvent and obj.triggerEvent) then
    return false
  end

  -- Some types, this will be minified and used later
  local T_TABLE, T_FUNCTION, T_THREAD = 'table', 'function', 'thread'

  -- Makes sure we're applying it to a table
  if T_TABLE ~= type(obj) then
    error('You can only add event handlers to table objects!')
  end

  -- Adds a event handler counter
  local eventHandlerIds = 0

  -- This will store the event handlers
  local eventHandlers = {}

  -- Asserts something is callable
  local function isCallable(obj)
    return (
      (T_FUNCTION == type(obj))
      or (T_TABLE == type(obj) and isCallable(getmetatable(obj).__call))
      or (T_THREAD == type(obj) and 'dead' ~= coroutine.status(obj))
    )
  end

  -- Invokes a callable object
  local function invoke(obj, ...)
    return (
      ((T_FUNCTION == type(obj) or (T_TABLE == type(obj) and isCallable(getmetatable(obj).__call))) and obj(...))
      or ((T_THREAD == type(obj)) and coroutine.resume(obj, ...))
    )
  end

  -- Adds event handler
  obj.onEvent = (function (self, event, handler, selfRef)
    -- If event handler is not callable trigger error
    if not isCallable(handler) then
      error('Event handler must be a function!')
    end

    -- Self reference passed to the event
    selfRef = selfRef or self
    if T_TABLE ~= type(selfRef) then
      error('The value of self must be a table!')
    end

    -- Adds event handler array if missing
    if not eventHandlers[event] then
      eventHandlers[event] = {}
    end

    -- Adds the actual handler and returns a number identifying it (for removal)
    eventHandlerIds = eventHandlerIds + 1
    eventHandlers[event][eventHandlerIds] = { handler, selfRef }

    -- Returns the ID for later removal
    return eventHandlerIds
  end)

  -- Removes event handler
  obj.clearEvent = (function (self, event, handlerId)
    if eventHandlers[event] and eventHandlers[event][handlerId] then
      eventHandlers[event][handlerId] = nil
    end
  end)

  -- Triggers event
  obj.triggerEvent = (function (self, event, ...)
    -- Processes each of the handlers
    for _, handler in pairs(eventHandlers[event] or {}) do
      invoke(handler[1], handler[2], ...)
    end
  end)

  -- Returns true to indicate success
  return true
end