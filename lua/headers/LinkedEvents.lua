--- Adds a new event handler to an object's event
---@param event __OBJECT_EVENTS__ The event being listened
---@param handler fun(self: __OBJECT_TYPE__, ...: any) The event handler
---@return number The event handler ID
___OVERLOADS_ONEVENT___
function __OBJECT_NAME__:onEvent(event, handler) end

--- Removes an event handler from an object's event
---@param event string The event being removed from
---@param handlerId number The event handler ID being removed
___OVERLOADS_CLEAREVENT___
function __OBJECT_NAME__:clearEvent(event, handlerId) end

--- Removes all event handlers from all events of an object
function __OBJECT_NAME__:clearAllEvents() end

--- Triggers an object's event
---@param event string The event name
---@param ... any The event arguments
___OVERLOADS_TRIGGEREVENT___
function __OBJECT_NAME__:triggerEvent(event, ...) end