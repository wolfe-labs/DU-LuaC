local triggerables = {}
local nTriggerables = 0

local library = DULibrary or {}

-- Adds event handling to an object's instance
function library.addEventHandlers(obj)
  -- Does nothing when obj is null or already has events
  if (not obj) or (obj.onEvent and obj.triggerEvent) then
    return false
  end

  -- Track objects that have event handler support for later use
  nTriggerables = nTriggerables + 1
  triggerables[nTriggerables] = obj

  -- Some types, this will be minified and used later
  local T_TABLE, T_FUNCTION, T_THREAD = 'table', 'function', 'thread'

  -- Makes sure we're applying it to a table
  if T_TABLE ~= type(obj) then
    error('You can only add event handlers to table objects!')
  end

  -- This will store the event handlers
  local eventHandlers = {}

  -- Asserts something is callable
  local function isCallable(obj)
    local T = type(obj)
    return (
      (T_FUNCTION == T)
      or (T_TABLE == T and isCallable(getmetatable(obj).__call))
      or (T_THREAD == T)
    )
  end

  -- Adds event handler
  obj.onEvent = (function (self, event, handler, selfRef)
    -- If event handler is not callable trigger error
    if not isCallable(handler) then
      error('Event handler must be a function, a callable object or a thread!')
    end

    -- Self reference passed to the event
    selfRef = selfRef or self
    if T_TABLE ~= type(selfRef) then
      error('The value of self must be a table!')
    end

    -- Adds event handler array if missing
    if not eventHandlers[event] then
      eventHandlers[event] = { _ = 0 }
    end

    -- If we have a thread, wraps it into a function call
    local internalHandler = ((T_THREAD == type(handler)) and function (...)
      coroutine.resume(handler, ...)
    end) or handler

    -- Adds the actual handler and returns a number identifying it (for removal)
    local handler = eventHandlers[event]
    local eventId = handler._ + 1
    handler[eventId] = { internalHandler, selfRef }
    handler._ = eventId

    -- Returns the ID for later removal
    return eventId
  end)

  -- Removes event handler
  obj.clearEvent = (function (self, event, handlerId)
    if eventHandlers[event] and eventHandlers[event][handlerId] then
      eventHandlers[event][handlerId] = nil
    end
  end)

  -- Removes all events
  obj.clearAllEvents = (function (self)
    eventHandlers = {}
  end)

  -- Triggers event
  obj.triggerEvent = (function (self, event, ...)
    local handlers = eventHandlers[event]

    -- Processes each of the handlers
    if handlers then
      for _ = 1, handlers._ do
        local handler = handlers[_]
        if handler then
          handler[1](handler[2], ...)
        end
      end
    end
  end)

  -- Returns true to indicate success
  return true
end

-- Removes all events from registered event handlers
function library.clearAllEventHandlers()
    for _ = 1, nTriggerables do
      local obj = triggerables[_]
      if obj and obj.clearAllEvents then
          obj:clearAllEvents()
      end
    end
end