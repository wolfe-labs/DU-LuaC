---@class Adjustor
local Adjustor = {}
--- Show the element widget in the in-game widget stack
function Adjustor.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Adjustor.show() end

--- Hide the element widget in the in-game widget stack
function Adjustor.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Adjustor.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Adjustor.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Adjustor.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Adjustor.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Adjustor.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Adjustor.getDataId() end

--- Returns the element name
---@return string The element's name
function Adjustor.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Adjustor.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Adjustor.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Adjustor.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Adjustor.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Adjustor.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Adjustor.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Adjustor.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Adjustor.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Adjustor.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Adjustor.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Adjustor.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Adjustor.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Adjustor.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Adjustor.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Adjustor.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Adjustor.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Adjustor.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Adjustor.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Adjustor.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Adjustor.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Adjustor.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Adjustor.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Adjustor.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Adjustor.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Adjustor.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Adjustor.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Adjustor.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Adjustor.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number The obstruction ratio of the engine
function Adjustor.getObstructionFactor() end

--- Returns the tags of the engine
---@return string Tags of the engine, in a CSV string
function Adjustor.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean True to ignore the default engine tags
---@return boolean True if the tags have been applied, false if they have not
function Adjustor.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return boolean True if the engine ignores default engine tags, false if not
function Adjustor.isIgnoringTags() end

--- Start the adjustor at full power (works only when run inside a piloting controller)
function Adjustor.activate() end

--- Stops the adjustor (works only when run inside a piloting controller)
function Adjustor.deactivate() end

--- Checks if the adjustor is active
---@return boolean True when the adjustor is on, false otherwise
function Adjustor.isActive() end

---@deprecated Adjustor.getState() is deprecated, use Adjustor.isActive().
function Adjustor.getState() end

--- Toggle the state of the adjustor
function Adjustor.toggle() end

--- Set the exhaust thrust of the adjustor
---@param thrust number The adjustor thrust in newtons (limited by the maximum thrust)
function Adjustor.setThrust(thrust) end

--- Returns the current exhaust thrust of the adjustor
---@return number The current exhaust thrust of the adjustor in newtons
function Adjustor.getThrust() end

--- Returns the maximal exhaust thrust the adjustor can deliver
---@return number The maximum exhaust thrust of the adjustor in newtons
function Adjustor.getMaxThrust() end

---@deprecated Adjustor.getMaxThrustBase() is deprecated, use Adjustor.getMaxThrust().
function Adjustor.getMaxThrustBase() end

--- Returns the adjustor exhaust thrust direction in construct local coordinates
---@return table The adjustor exhaust thrust direction vector in construct local coordinates
function Adjustor.getThrustAxis() end

--- Returns the adjustor torque axis in construct local coordinates
---@return table The torque axis vector in construct local coordinates
function Adjustor.getTorqueAxis() end

--- Returns the adjustor exhaust thrust direction in world coordinates
---@return table The adjustor thrust direction vector in world coordinates
function Adjustor.getWorldThrustAxis() end

---@deprecated Adjustor.thrustAxis() is deprecated, use Adjustor.getWorldThrustAxis().
function Adjustor.thrustAxis() end

--- Returns the adjustor torque axis in world coordinates
---@return table The torque axis vector in world coordinates
function Adjustor.getWorldTorqueAxis() end

---@deprecated Adjustor.torqueAxis() is deprecated, use Adjustor.getWorldTorqueAxis().
function Adjustor.torqueAxis() end

---@deprecated Adjustor.isOutOfFuel() is deprecated.
function Adjustor.isOutOfFuel() end

---@deprecated Adjustor.hasFunctionalFuelTank() is deprecated.
function Adjustor.hasFunctionalFuelTank() end

---@deprecated Adjustor.getCurrentFuelRate()
function Adjustor.getCurrentFuelRate() end

---@deprecated Adjustor.getFuelRateEfficiency()
function Adjustor.getFuelRateEfficiency() end

---@deprecated Adjustor.getFuelConsumption()
function Adjustor.getFuelConsumption() end

---@deprecated Adjustor.getDistance()
function Adjustor.getDistance() end

---@deprecated Adjustor.getT50() is deprecated.
function Adjustor.getT50() end


---@class Airbrake
local Airbrake = {}
--- Show the element widget in the in-game widget stack
function Airbrake.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Airbrake.show() end

--- Hide the element widget in the in-game widget stack
function Airbrake.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Airbrake.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Airbrake.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Airbrake.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Airbrake.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Airbrake.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Airbrake.getDataId() end

--- Returns the element name
---@return string The element's name
function Airbrake.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Airbrake.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Airbrake.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Airbrake.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Airbrake.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Airbrake.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Airbrake.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Airbrake.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Airbrake.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Airbrake.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Airbrake.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Airbrake.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Airbrake.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Airbrake.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Airbrake.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Airbrake.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Airbrake.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Airbrake.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Airbrake.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Airbrake.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Airbrake.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Airbrake.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Airbrake.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Airbrake.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Airbrake.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Airbrake.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Airbrake.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Airbrake.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Airbrake.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number The obstruction ratio of the engine
function Airbrake.getObstructionFactor() end

--- Returns the tags of the engine
---@return string Tags of the engine, in a CSV string
function Airbrake.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean True to ignore the default engine tags
---@return boolean True if the tags have been applied, false if they have not
function Airbrake.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return boolean True if the engine ignores default engine tags, false if not
function Airbrake.isIgnoringTags() end

--- Start the brake at full power (works only when run inside a cockpit or under remote control)
function Airbrake.activate() end

--- Stops the brake (works only when run inside a cockpit or under remote control)
function Airbrake.deactivate() end

--- Checks if the brake is active
---@return boolean True if the brake is on, false otherwise
function Airbrake.isActive() end

---@deprecated BrakeEngine.getState() is deprecated, use BrakeEngine.isActive().
function Airbrake.getState() end

--- Toggle the state of the brake
function Airbrake.toggle() end

--- Set the thrust of the brake. Note that brakes can generate a force only in the movement opposite direction
---@param thrust number The brake thrust in newtons (limited by the maximum thrust)
function Airbrake.setThrust(thrust) end

--- Returns the current thrust of the brake
---@return number 
function Airbrake.getThrust() end

---@deprecated BrakeEngine.getMaxThrust() is deprecated, use BrakeEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function Airbrake.getMaxThrust() end

---@deprecated BrakeEngine.getMaxThrustBase() is deprecated, use BrakeEngine.getMaxThrust().
function Airbrake.getMaxThrustBase() end

--- Returns the minimal thrust the brake can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number 
function Airbrake.getCurrentMinThrust() end

---@deprecated BrakeEngine.getMinThrust() is deprecated, use BrakeEngine.getCurrentMinThrust().
function Airbrake.getMinThrust() end

--- Returns the maximal thrust the brake can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the brake
---@return number 
function Airbrake.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function Airbrake.getMaxThrustEfficiency() end

--- Returns the brake thrust direction in construct local coordinates
---@return table 
function Airbrake.getThrustAxis() end

--- Returns the brake thrust direction in world coordinates
---@return table 
function Airbrake.getWorldThrustAxis() end

---@deprecated BrakeEngine.thrustAxis() is deprecated, use BrakeEngine.getWorldThrustAxis().
function Airbrake.thrustAxis() end

---@deprecated BrakeEngine.isOutOfFuel() is deprecated.
function Airbrake.isOutOfFuel() end

---@deprecated BrakeEngine.hasFunctionalFuelTank() is deprecated.
function Airbrake.hasFunctionalFuelTank() end

---@deprecated BrakeEngine.getCurrentFuelRate() is deprecated.
function Airbrake.getCurrentFuelRate() end

---@deprecated BrakeEngine.getFuelRateEfficiency() is deprecated.
function Airbrake.getFuelRateEfficiency() end

---@deprecated BrakeEngine.getFuelConsumption() is deprecated.
function Airbrake.getFuelConsumption() end

---@deprecated BrakeEngine.getDistance() is deprecated.
function Airbrake.getDistance() end

---@deprecated BrakeEngine.getT50() is deprecated.
function Airbrake.getT50() end

---@deprecated BrakeEngine.torqueAxis() is deprecated.
function Airbrake.torqueAxis() end


---@class Airfoil
local Airfoil = {}
--- Show the element widget in the in-game widget stack
function Airfoil.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Airfoil.show() end

--- Hide the element widget in the in-game widget stack
function Airfoil.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Airfoil.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Airfoil.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Airfoil.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Airfoil.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Airfoil.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Airfoil.getDataId() end

--- Returns the element name
---@return string The element's name
function Airfoil.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Airfoil.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Airfoil.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Airfoil.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Airfoil.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Airfoil.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Airfoil.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Airfoil.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Airfoil.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Airfoil.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Airfoil.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Airfoil.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Airfoil.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Airfoil.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Airfoil.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Airfoil.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Airfoil.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Airfoil.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Airfoil.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Airfoil.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Airfoil.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Airfoil.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Airfoil.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Airfoil.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Airfoil.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Airfoil.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Airfoil.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Airfoil.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Airfoil.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number The obstruction ratio of the engine
function Airfoil.getObstructionFactor() end

--- Returns the tags of the engine
---@return string Tags of the engine, in a CSV string
function Airfoil.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean True to ignore the default engine tags
---@return boolean True if the tags have been applied, false if they have not
function Airfoil.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return boolean True if the engine ignores default engine tags, false if not
function Airfoil.isIgnoringTags() end

--- Returns the current lift of the airfoil
---@return number The current lift of the airfoil in newtons
function Airfoil.getLift() end

---@deprecated Airfoil.getThrust() is deprecated, use Airfoil.getLift().
function Airfoil.getThrust() end

--- Gives the maximum lift that the airfoil can generate, under optimal conditions.
--- Note that the actual maximum lift will most of the time be less than this value
---@return number The maximum lift of the airfoil in newtons
function Airfoil.getMaxLift() end

---@deprecated Airfoil.getMaxThrustBase() is deprecated, use Airfoil.getMaxLift().
function Airfoil.getMaxThrustBase() end

--- Returns the current drag of the airfoil
---@return number The current drag of the airfoil in newtons
function Airfoil.getDrag() end

--- The ratio between lift and drag, depending of the aerodynamic profile of the airfoil
---@return number The ratio between lift and drag
function Airfoil.getDragRatio() end

--- Returns the minimal lift the airfoil can deliver at the moment (can be higher than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
---@return number The current minimal airfoil lift in newtons
function Airfoil.getCurrentMinLift() end

---@deprecated Airfoil.getMinThrust() is deprecated, use Airfoil.getCurrentMinLift().
function Airfoil.getMinThrust() end

--- Returns the maximal lift the aifoil can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual lift will be
--- anything below this maximum lift, which defines the current max capability of the airfoil
---@return number The current maximal airfoil lift in newtons
function Airfoil.getCurrentMaxLift() end

---@deprecated Airfoil.getMaxThrust() is deprecated, use Airfoil.getCurrentMaxLift().
function Airfoil.getMaxThrust() end

--- Returns the ratio between the current maximum lift and the optimal maximum lift
---@return number Usually 1 but can be lower for certain airfoils
function Airfoil.getMaxLiftEfficiency() end

---@deprecated Airfoil.getMaxThrustEfficiency() is deprecated, use Airfoil.getMaxLiftEfficiency().
function Airfoil.getMaxThrustEfficiency() end

--- Returns the airfoil lift direction in construct local coordinates
---@return table The airfoil lift direction vector in construct local coordinates
function Airfoil.getLiftAxis() end

--- Returns the airfoil torque axis in construct local coordinates
---@return table The airfoil torque axis vector in construct local coordinates
function Airfoil.getTorqueAxis() end

--- Returns the airfoil lift direction in world coordinates
---@return table The airfoil lift direction vector in world coordinates
function Airfoil.getWorldLiftAxis() end

---@deprecated Airfoil.thrustAxis() is deprecated, use Airfoil.getWorldLiftAxis().
function Airfoil.thrustAxis() end

--- Returns the adjustor torque axis in world coordinates
---@return table The airfoil torque axis vector in world coordinates
function Airfoil.getWorldTorqueAxis() end

---@deprecated Airfoil.torqueAxis() is deprecated, use Airfoil.getWorldTorqueAxis().
function Airfoil.torqueAxis() end

--- Checks if the airfoil is stalled
---@return boolean True if the airfoil is stalled, false otherwise
function Airfoil.isStalled() end

--- Returns the airfoil stall angle
---@return number The stall angle of the airfoil in degrees
function Airfoil.getStallAngle() end

--- Returns the minimum angle to produce the maximum lift of the airfoil
--- Note that the airfoil will produce lift at a lower angle but not optimally
---@return number The minimum angle of the airfoil in degrees
function Airfoil.getMinAngle() end

--- Returns the maximum angle to produce the maximum lift of the airfoil
--- Note that the airfoil will produce lift at a higher angle but not optimally
---@return number The maximum angle of the airfoil in degrees
function Airfoil.getMaxAngle() end

---@deprecated Airfoil.activate() is deprecated.
function Airfoil.activate() end

---@deprecated Airfoil.deactivate() is deprecated.
function Airfoil.deactivate() end

---@deprecated Airfoil.getState() is deprecated.
function Airfoil.getState() end

---@deprecated Airfoil.toggle() is deprecated.
function Airfoil.toggle() end

---@deprecated Airfoil.setThrust(thrust) is deprecated.
function Airfoil.setThrust() end

---@deprecated Airfoil.isOutOfFuel() is deprecated.
function Airfoil.isOutOfFuel() end

---@deprecated Airfoil.hasFunctionalFuelTank() is deprecated.
function Airfoil.hasFunctionalFuelTank() end

---@deprecated Airfoil.getCurrentFuelRate() is deprecated.
function Airfoil.getCurrentFuelRate() end

---@deprecated Airfoil.getFuelRateEfficiency() is deprecated.
function Airfoil.getFuelRateEfficiency() end

---@deprecated Airfoil.getFuelConsumption() is deprecated.
function Airfoil.getFuelConsumption() end

---@deprecated Airfoil.getDistance() is deprecated.
function Airfoil.getDistance() end

---@deprecated Airfoil.getT50() is deprecated.
function Airfoil.getT50() end


---@class AntiGravityGenerator
local AntiGravityGenerator = {}
--- Show the element widget in the in-game widget stack
function AntiGravityGenerator.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function AntiGravityGenerator.show() end

--- Hide the element widget in the in-game widget stack
function AntiGravityGenerator.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function AntiGravityGenerator.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function AntiGravityGenerator.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function AntiGravityGenerator.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function AntiGravityGenerator.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function AntiGravityGenerator.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function AntiGravityGenerator.getDataId() end

--- Returns the element name
---@return string The element's name
function AntiGravityGenerator.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function AntiGravityGenerator.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function AntiGravityGenerator.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function AntiGravityGenerator.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function AntiGravityGenerator.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function AntiGravityGenerator.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function AntiGravityGenerator.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function AntiGravityGenerator.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function AntiGravityGenerator.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function AntiGravityGenerator.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function AntiGravityGenerator.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function AntiGravityGenerator.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function AntiGravityGenerator.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function AntiGravityGenerator.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function AntiGravityGenerator.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function AntiGravityGenerator.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function AntiGravityGenerator.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function AntiGravityGenerator.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function AntiGravityGenerator.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function AntiGravityGenerator.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function AntiGravityGenerator.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function AntiGravityGenerator.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function AntiGravityGenerator.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function AntiGravityGenerator.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function AntiGravityGenerator.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function AntiGravityGenerator.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function AntiGravityGenerator.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function AntiGravityGenerator.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function AntiGravityGenerator.getSignalOut(plug) end

--- Activate the anti-gravity generator
function AntiGravityGenerator.activate() end

--- Deactivate the anti-gravity generator
function AntiGravityGenerator.deactivate() end

--- Returns the state of activation of the anti-gravity generator
---@return boolean True if the anti-gravity generator is started, false otherwise
function AntiGravityGenerator.isActive() end

---@deprecated AntiGravityGenerator.getState() is deprecated, use AntiGravityGenerator.isActive() instead.
function AntiGravityGenerator.getState() end

--- Toggle the anti-gravity generator
function AntiGravityGenerator.toggle() end

--- Returns the strength of the anti-gravitational field
---@return number The power of the anti-gravitational field in Es
function AntiGravityGenerator.getFieldStrength() end

--- Returns the current rate of compensation of the gravitational field
---@return number The current rate in percentage
function AntiGravityGenerator.getCompensationRate() end

--- Returns the current power of the gravitational field
---@return number The current power in percentage
function AntiGravityGenerator.getFieldPower() end

--- Returns the number of pulsors linked to the anti-gravity generator
---@return integer The number of pulsors linked
function AntiGravityGenerator.getPulsorCount() end

--- Set the target altitude for the anti-gravity field. Cannot be called from onFlush
---@param altitude number The target altitude in meters. It will be reached with a slow acceleration (not instantaneous)
function AntiGravityGenerator.setTargetAltitude(altitude) end

---@deprecated AntiGravityGenerator.setBaseAltitude(altitude) is deprecated, use AntiGravityGenerator.setTargetAltitude(altitude) instead.
function AntiGravityGenerator.setBaseAltitude() end

--- Returns the target altitude defined for the anti-gravitational field
---@return number The target altitude in meters
function AntiGravityGenerator.getTargetAltitude() end

--- Returns the current base altitude of the anti-gravitational field
---@return number The current base altitude in meters
function AntiGravityGenerator.getBaseAltitude() end


---@class AtmosphericEngine
local AtmosphericEngine = {}
--- Show the element widget in the in-game widget stack
function AtmosphericEngine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function AtmosphericEngine.show() end

--- Hide the element widget in the in-game widget stack
function AtmosphericEngine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function AtmosphericEngine.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function AtmosphericEngine.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function AtmosphericEngine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function AtmosphericEngine.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function AtmosphericEngine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function AtmosphericEngine.getDataId() end

--- Returns the element name
---@return string The element's name
function AtmosphericEngine.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function AtmosphericEngine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function AtmosphericEngine.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function AtmosphericEngine.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function AtmosphericEngine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function AtmosphericEngine.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function AtmosphericEngine.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function AtmosphericEngine.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function AtmosphericEngine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function AtmosphericEngine.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function AtmosphericEngine.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function AtmosphericEngine.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function AtmosphericEngine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function AtmosphericEngine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function AtmosphericEngine.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function AtmosphericEngine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function AtmosphericEngine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function AtmosphericEngine.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function AtmosphericEngine.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function AtmosphericEngine.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function AtmosphericEngine.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function AtmosphericEngine.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function AtmosphericEngine.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function AtmosphericEngine.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function AtmosphericEngine.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function AtmosphericEngine.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function AtmosphericEngine.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function AtmosphericEngine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function AtmosphericEngine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number The obstruction ratio of the engine
function AtmosphericEngine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string Tags of the engine, in a CSV string
function AtmosphericEngine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean True to ignore the default engine tags
---@return boolean True if the tags have been applied, false if they have not
function AtmosphericEngine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return boolean True if the engine ignores default engine tags, false if not
function AtmosphericEngine.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function AtmosphericEngine.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function AtmosphericEngine.deactivate() end

--- Checks if the engine is active
---@return boolean True if the engine is on, false otherwise
function AtmosphericEngine.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function AtmosphericEngine.getState() end

--- Toggle the state of the engine
function AtmosphericEngine.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function AtmosphericEngine.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number The thrust of the engine is currently delivering in newtons
function AtmosphericEngine.getThrust() end

---@deprecated FueledEngine.getMaxThrust() is deprecated, use FueledEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function AtmosphericEngine.getMaxThrust() end

---@deprecated FueledEngine.getMaxThrustBase() is deprecated, use FueledEngine.getMaxThrust().
function AtmosphericEngine.getMaxThrustBase() end

--- Returns the minimal thrust the engine can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number The current minimal engine thrust in newtons
function AtmosphericEngine.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function AtmosphericEngine.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number The current maximum engine thrust in newtons
function AtmosphericEngine.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number Usually 1 but can be lower for certain engines
function AtmosphericEngine.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return boolean True if the torque is enabled on the engine, false otherwise
function AtmosphericEngine.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function AtmosphericEngine.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table The engine thrust direction vector in construct local coordinates
function AtmosphericEngine.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table The torque axis vector in construct local coordinates
function AtmosphericEngine.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table The engine thrust direction vector in world coordinates
function AtmosphericEngine.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function AtmosphericEngine.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table The torque axis vector in world coordinates
function AtmosphericEngine.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function AtmosphericEngine.torqueAxis() end

--- Checks if the engine out of fuel
---@return boolean True if the engine is out of fuel, false otherwise
function AtmosphericEngine.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer The item ID of the fuel currently used
function AtmosphericEngine.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer The local ID of the fueltank
function AtmosphericEngine.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return boolean True if the linked tank is functional, false otherwise
function AtmosphericEngine.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function AtmosphericEngine.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number The current rate of fuel consumption in m³/(N.s)
function AtmosphericEngine.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number Usually 1 but can be higher for certain engines at certain speeds
function AtmosphericEngine.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number The rate of fuel consumption in m3/s
function AtmosphericEngine.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number The time to half thrust in seconds
function AtmosphericEngine.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function AtmosphericEngine.getT50() end

---@deprecated AtmosphericEngine.getDistance() is deprecated.
function AtmosphericEngine.getDistance() end


---@class BaseShieldGenerator
local BaseShieldGenerator = {}
--- Show the element widget in the in-game widget stack
function BaseShieldGenerator.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function BaseShieldGenerator.show() end

--- Hide the element widget in the in-game widget stack
function BaseShieldGenerator.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function BaseShieldGenerator.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function BaseShieldGenerator.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function BaseShieldGenerator.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function BaseShieldGenerator.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function BaseShieldGenerator.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function BaseShieldGenerator.getDataId() end

--- Returns the element name
---@return string The element's name
function BaseShieldGenerator.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function BaseShieldGenerator.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function BaseShieldGenerator.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function BaseShieldGenerator.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function BaseShieldGenerator.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function BaseShieldGenerator.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function BaseShieldGenerator.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function BaseShieldGenerator.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function BaseShieldGenerator.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function BaseShieldGenerator.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function BaseShieldGenerator.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function BaseShieldGenerator.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function BaseShieldGenerator.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function BaseShieldGenerator.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function BaseShieldGenerator.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function BaseShieldGenerator.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function BaseShieldGenerator.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function BaseShieldGenerator.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function BaseShieldGenerator.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function BaseShieldGenerator.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function BaseShieldGenerator.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function BaseShieldGenerator.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function BaseShieldGenerator.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function BaseShieldGenerator.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function BaseShieldGenerator.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function BaseShieldGenerator.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function BaseShieldGenerator.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function BaseShieldGenerator.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function BaseShieldGenerator.getSignalOut(plug) end

--- Activate the shield
function BaseShieldGenerator.activate() end

--- Deactivate the shield
function BaseShieldGenerator.deactivate() end

--- Toggle the state of the shield
function BaseShieldGenerator.toggle() end

--- Returns the activation state of the shield
---@return integer True when the shield is active, false otherwise
function BaseShieldGenerator.getState() end

--- Returns the current hitpoints of the shield
---@return number The current hitpoints of the shield
function BaseShieldGenerator.getShieldHitpoints() end

--- Returns the maximal hitpoints of the shield
---@return number The maximal hitpoints of the shield
function BaseShieldGenerator.getMaxShieldHitpoints() end

--- Returns distribution of resistance pool over resistance types
---@return table Resistance to damage type {antimatter, electromagnetic, kinetic, thermic}
function BaseShieldGenerator.getResistances() end

--- Distribute the resistance pool according to damage type
---@param antimatter number Antimatter damage resistance
---@param electromagnetic number Electromagnetic damage resistance
---@param kinetic number Kinetic damage resistance
---@param thermic number Thermic damage resistance
---@return boolean True if resistance was distributed, false if an error occurred
function BaseShieldGenerator.setResistances(antimatter, electromagnetic, kinetic, thermic) end

--- Returns time after which adjusting resistances is possible again
---@return number Remaining seconds of the resistance cooldown
function BaseShieldGenerator.getResistancesCooldown() end

--- Returns maximal cooldown between adjusting resistances
---@return number Maximal seconds of the resistance cooldown
function BaseShieldGenerator.getResistancesMaxCooldown() end

--- Returns total resistance pool that may be distributed
---@return number Total pool of resistances
function BaseShieldGenerator.getResistancesPool() end

--- Returns the remaining amount of the resistance pool that can be distributed
---@return number Remaining resistance pool
function BaseShieldGenerator.getResistancesRemaining() end

--- Returns ratio per damage type of recent weapon impacts after applying resistance
---@return table Stress ratio due to damage type {antimatter, electromagnetic, kinetic, thermic}
function BaseShieldGenerator.getStressRatio() end

--- Returns ratio per damage type of recent weapon impacts without resistance
---@return table Stress ratio due to damage type {antimatter, electromagnetic, kinetic, thermic}
function BaseShieldGenerator.getStressRatioRaw() end

--- Returns stress, that is the total hitpoints of recent weapon impacts after applying resistance
---@return number Total stress hitpoints due to recent weapon impacts
function BaseShieldGenerator.getStressHitpoints() end

--- Returns stress, that is the total hitpoints of recent weapon impacts without resistance
---@return number Total stress hitpoints due to recent weapon impacts
function BaseShieldGenerator.getStressHitpointsRaw() end

--- Returns whether the base shield is currently in lockdown
---@return boolean True if the base shield is in lockdown, false otherwise
function BaseShieldGenerator.inLockdown() end

--- Returns the remaining time of the base shield lockdown
---@return number Remaining lockdown time in seconds
function BaseShieldGenerator.getLockdownRemaining() end

--- Returns the hour since midnight of the preferred lockdown exit
---@return integer Preferred lockdown exit hour UTC
function BaseShieldGenerator.getLockdownExitTime() end

--- Set hour since midnight for the preferred lockdown exit
---@param hour integer Preferred lockdown exit hour UTC (0-23)
---@return boolean True if lockdown exit was set, false if an error occurred
function BaseShieldGenerator.setLockdownExitTime(hour) end

--- Emitted when we started or stopped the shield generator
---@param active boolean True if the element was activated, false otherwise
---@type Event
BaseShieldGenerator.onToggled = Event:new()

---@type Event
BaseShieldGenerator.toggled = Event:new()

--- Emitted when the shield absorbed incoming damage
---@param hitpoints number Damage the shield absorbed
---@param rawHitpoints number Total damage without taking resistances into account
---@type Event
BaseShieldGenerator.onAbsorbed = Event:new()

---@type Event
BaseShieldGenerator.absorbed = Event:new()

--- Emitted when the shield hit points reached 0 due to damage
---@type Event
BaseShieldGenerator.onDown = Event:new()

---@type Event
BaseShieldGenerator.down = Event:new()

--- Emitted when the shield hit points were fully restored
---@type Event
BaseShieldGenerator.onRestored = Event:new()

---@type Event
BaseShieldGenerator.restored = Event:new()

--- Emitted when the shield enters lockdown
---@type Event
BaseShieldGenerator.onEnterLockdown = Event:new()

---@type Event
BaseShieldGenerator.enterLockdown = Event:new()

--- Emitted when the shield exits the lockdown
---@type Event
BaseShieldGenerator.onLeaveLockdown = Event:new()

---@type Event
BaseShieldGenerator.leaveLockdown = Event:new()


---@class BrakeEngine
local BrakeEngine = {}
--- Show the element widget in the in-game widget stack
function BrakeEngine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function BrakeEngine.show() end

--- Hide the element widget in the in-game widget stack
function BrakeEngine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function BrakeEngine.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function BrakeEngine.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function BrakeEngine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function BrakeEngine.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function BrakeEngine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function BrakeEngine.getDataId() end

--- Returns the element name
---@return string The element's name
function BrakeEngine.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function BrakeEngine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function BrakeEngine.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function BrakeEngine.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function BrakeEngine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function BrakeEngine.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function BrakeEngine.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function BrakeEngine.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function BrakeEngine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function BrakeEngine.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function BrakeEngine.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function BrakeEngine.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function BrakeEngine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function BrakeEngine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function BrakeEngine.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function BrakeEngine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function BrakeEngine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function BrakeEngine.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function BrakeEngine.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function BrakeEngine.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function BrakeEngine.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function BrakeEngine.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function BrakeEngine.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function BrakeEngine.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function BrakeEngine.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function BrakeEngine.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function BrakeEngine.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function BrakeEngine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function BrakeEngine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number The obstruction ratio of the engine
function BrakeEngine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string Tags of the engine, in a CSV string
function BrakeEngine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean True to ignore the default engine tags
---@return boolean True if the tags have been applied, false if they have not
function BrakeEngine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return boolean True if the engine ignores default engine tags, false if not
function BrakeEngine.isIgnoringTags() end

--- Start the brake at full power (works only when run inside a cockpit or under remote control)
function BrakeEngine.activate() end

--- Stops the brake (works only when run inside a cockpit or under remote control)
function BrakeEngine.deactivate() end

--- Checks if the brake is active
---@return boolean True if the brake is on, false otherwise
function BrakeEngine.isActive() end

---@deprecated BrakeEngine.getState() is deprecated, use BrakeEngine.isActive().
function BrakeEngine.getState() end

--- Toggle the state of the brake
function BrakeEngine.toggle() end

--- Set the thrust of the brake. Note that brakes can generate a force only in the movement opposite direction
---@param thrust number The brake thrust in newtons (limited by the maximum thrust)
function BrakeEngine.setThrust(thrust) end

--- Returns the current thrust of the brake
---@return number 
function BrakeEngine.getThrust() end

---@deprecated BrakeEngine.getMaxThrust() is deprecated, use BrakeEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function BrakeEngine.getMaxThrust() end

---@deprecated BrakeEngine.getMaxThrustBase() is deprecated, use BrakeEngine.getMaxThrust().
function BrakeEngine.getMaxThrustBase() end

--- Returns the minimal thrust the brake can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number 
function BrakeEngine.getCurrentMinThrust() end

---@deprecated BrakeEngine.getMinThrust() is deprecated, use BrakeEngine.getCurrentMinThrust().
function BrakeEngine.getMinThrust() end

--- Returns the maximal thrust the brake can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the brake
---@return number 
function BrakeEngine.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function BrakeEngine.getMaxThrustEfficiency() end

--- Returns the brake thrust direction in construct local coordinates
---@return table 
function BrakeEngine.getThrustAxis() end

--- Returns the brake thrust direction in world coordinates
---@return table 
function BrakeEngine.getWorldThrustAxis() end

---@deprecated BrakeEngine.thrustAxis() is deprecated, use BrakeEngine.getWorldThrustAxis().
function BrakeEngine.thrustAxis() end

---@deprecated BrakeEngine.isOutOfFuel() is deprecated.
function BrakeEngine.isOutOfFuel() end

---@deprecated BrakeEngine.hasFunctionalFuelTank() is deprecated.
function BrakeEngine.hasFunctionalFuelTank() end

---@deprecated BrakeEngine.getCurrentFuelRate() is deprecated.
function BrakeEngine.getCurrentFuelRate() end

---@deprecated BrakeEngine.getFuelRateEfficiency() is deprecated.
function BrakeEngine.getFuelRateEfficiency() end

---@deprecated BrakeEngine.getFuelConsumption() is deprecated.
function BrakeEngine.getFuelConsumption() end

---@deprecated BrakeEngine.getDistance() is deprecated.
function BrakeEngine.getDistance() end

---@deprecated BrakeEngine.getT50() is deprecated.
function BrakeEngine.getT50() end

---@deprecated BrakeEngine.torqueAxis() is deprecated.
function BrakeEngine.torqueAxis() end


---@class Construct
local Construct = {}
--- Returns the name of the construct
---@return string 
function Construct.getName() end

--- Returns the construct unique ID
---@return integer 
function Construct.getId() end

--- Returns the owner entity
---@return table The owner entity table with fields {[int] id, [bool] isOrganization} describing the owner. Use system.getPlayerName(id) and system.getOrganization(id) to retrieve info about it
function Construct.getOwner() end

--- Returns the creator entity
---@return integer The owner entity table with fields {[int] id, [bool] isOrganization} describing the owner. Use system.getPlayerName(id) and system.getOrganization(id) to retrieve info about it
function Construct.getCreator() end

--- Returns the local id of the current active schematic container. nil if none has been declared
---@return interger local id of the current active schematic container
function Construct.getSchematicContainerId() end

--- Checks if the construct is currently warping
---@return boolean True if the construct is currently warping, false otherwise
function Construct.isWarping() end

--- Returns the current warp state
---@return integer The current warp state index (Idle = 1, Engage = 2, Align = 3, Spool = 4, Accelerate = 5, Cruise = 6, Decelerate = 7, Stopping = 8, Disengage = 9)
function Construct.getWarpState() end

--- Checks if the construct is in PvP zone
---@return boolean True if the construct is in PVP zone, false otherwise
function Construct.isInPvPZone() end

--- Returns the distance between the construct and the nearest safe zone
---@return number The distance to the nearest safe zone border in meters. Positive value if the construct is outside of any safe zone
function Construct.getDistanceToSafeZone() end

--- Returns the current construct PvP timer state
---@return number The remaining time of the PvP timer, or 0.0 if elapsed
function Construct.getPvPTimer() end

--- Returns the mass of the construct
---@return number 
function Construct.getMass() end

--- Returns the total mass of the construct (voxels, elements, avatars and docked constructs)
---@return number total mass of the construct in kilograms
function Construct.getTotalMass() end

--- Returns the inertial mass of the construct, calculated as 1/3 of the trace of the inertial tensor
---@return number 
function Construct.getInertialMass() end

--- Returns the inertial tensor of the construct
---@return table 
function Construct.getInertialTensor() end

--- Returns the position of the center of mass of the construct, in local construct coordinates
---@return table 
function Construct.getCenterOfMass() end

--- Returns the position of the center of mass of the construct, in world coordinates
---@return table 
function Construct.getWorldCenterOfMass() end

--- Returns the construct's cross sectional surface in the current direction of movement
---@return number The construct's surface exposed in the current direction of movement in meters square
function Construct.getCrossSection() end

--- Returns the size of the building zone of the construct
---@return table 
function Construct.getSize() end

--- Returns the size of the bounding box of the construct
---@return table 
function Construct.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the construct in local construct coordinates
---@return table 
function Construct.getBoundingBoxCenter() end

--- Returns the max speed along current moving direction
---@return number The max speed along current moving direction in m/s
function Construct.getMaxSpeed() end

--- Returns the max angular speed
---@return number The max angular speed in rad/s
function Construct.getMaxAngularSpeed() end

--- Returns the max speed per axis
---@return table The max speed along axes {x, -x, y, -y, z, -z} in m/s
function Construct.getMaxSpeedPerAxis() end

--- Returns the construct max kinematics parameters in both atmo and space range, in newtons. Kinematics
--- parameters designate here the maximal positive and negative base force the construct is capable of producing along the chosen
--- Axisvector, as defined by the Core Unit or the gyro unit, if active. In practice, this gives you an estimate of the maximum
--- thrust your ship is capable of producing in space or in atmosphere, as well as the max reverse thrust. These are theoretical
--- estimates and correspond with the addition of the maxThrustBase along the corresponding axis. It might not reflect the
--- accurate current max thrust capacity of your ship, which depends on various local conditions (atmospheric density,
--- orientation, obstruction, engine damage, etc)
--- This is typically used in conjunction with the Control Unit throttle to setup the desired forward acceleration
---@param taglist string Comma (for union) or space (for intersection) separated list of tags. You can set tags directly on the engines in the right-click menu
---@param CRefAxis table Axis along which to compute the max force (in construct reference)
---@return table The kinematics parameters in Newtons in the order: atmoRange.FMaxPlus, atmoRange.FMaxMinus, spaceRange.FMaxPlus, spaceRange.FMaxMinus
function Construct.getMaxThrustAlongAxis(taglist, CRefAxis) end

--- Returns the current braking force generated by construct brakes
---@return number The current braking force in Newtons
function Construct.getCurrentBrake() end

--- Returns the maximum braking force that can currently be generated by the construct brakes
---@return number The maximum braking force in Newtons
function Construct.getMaxBrake() end

--- Returns the world position of the construct
---@return table The xyz world coordinates of the construct center position in meters
function Construct.getWorldPosition() end

--- The construct's linear velocity, relative to its parent, in construct local coordinates
---@return table Relative linear velocity vector, in construct local coordinates in m/s
function Construct.getVelocity() end

--- The construct's linear velocity, relative to its parent, in world coordinates
---@return table Relative linear velocity vector, in world coordinates in m/s
function Construct.getWorldVelocity() end

--- The construct's absolute linear velocity, in construct local coordinates
---@return table Absolute linear velocity vector, in construct local coordinates in m/s
function Construct.getAbsoluteVelocity() end

--- The construct's absolute linear velocity, in world coordinates
---@return table Absolute linear velocity vector, in world coordinates in m/s
function Construct.getWorldAbsoluteVelocity() end

--- The construct's linear acceleration, in construct local coordinates
---@return table Linear acceleration vector, in construct local coordinates in m/s2
function Construct.getAcceleration() end

--- The construct's linear acceleration, in world coordinates
---@return table Linear acceleration vector, in world coordinates in m/s2
function Construct.getWorldAcceleration() end

--- The construct's angular velocity, in construct local coordinates
---@return table Angular velocity vector, in construct local coordinates in rad/s
function Construct.getAngularVelocity() end

--- The construct's angular velocity, in world coordinates
---@return table Angular velocity vector, in world coordinates in rad/s
function Construct.getWorldAngularVelocity() end

--- The construct's angular acceleration, in construct local coordinates
---@return table Angular acceleration vector, in construct local coordinates in rad/s2
function Construct.getAngularAcceleration() end

--- The construct's angular acceleration, in world coordinates
---@return table Angular acceleration vector, in world coordinates in rad/s2
function Construct.getWorldAngularAcceleration() end

--- Returns the acceleration generated by air resistance
---@return table The xyz world acceleration generated by air resistance
function Construct.getWorldAirFrictionAcceleration() end

--- Returns the acceleration torque generated by air resistance
---@return table The xyz world acceleration torque generated by air resistance
function Construct.getWorldAirFrictionAngularAcceleration() end

--- Returns the speed at which your construct will suffer damage due to friction with the air
---@return number The construct speed to get damages due to friction in m/s
function Construct.getFrictionBurnSpeed() end

--- Returns the forward vector of the construct coordinates system
---@return table The forward vector of the construct coordinates system. It's a static value equal to (0,1,0)
function Construct.getForward() end

--- Returns the right vector of the construct coordinates system
---@return table The right vector of the construct coordinates system. It's a static value equal to (1,0,0)
function Construct.getRight() end

--- Returns the up direction vector of the construct coordinates system
---@return table The up vector of the construct coordinates system.. It's a static value equal to (0,0,1)
function Construct.getUp() end

--- Returns the forward direction vector of the construct, in world coordinates
---@return table The forward direction vector of the construct, in world coordinates
function Construct.getWorldForward() end

--- Returns the right direction vector of the construct, in world coordinates
---@return table The right direction vector of the construct, in world coordinates
function Construct.getWorldRight() end

--- Returns the up direction vector of the construct, in world coordinates
---@return table The up direction vector of the construct, in world coordinates
function Construct.getWorldUp() end

--- Returns the local id of the current active orientation unit (core unit or gyro unit)
---@return integer local id of the current active orientation unit (core unit or gyro unit)
function Construct.getOrientationUnitId() end

--- Returns the forward direction vector of the active orientation unit, in construct local coordinates
---@return table Forward direction vector of the active orientation unit, in construct local coordinates
function Construct.getOrientationForward() end

--- Returns the right direction vector of the active orientation unit, in construct local coordinates
---@return table Right direction vector of the active orientation unit, in construct local coordinates
function Construct.getOrientationRight() end

--- Returns the up direction vector of the active orientation unit, in construct local coordinates
---@return table Up direction vector of the active orientation unit, in construct local coordinates
function Construct.getOrientationUp() end

--- Returns the forward direction vector of the active orientation unit, in world coordinates
---@return table Forward direction vector of the active orientation unit, in world coordinates
function Construct.getWorldOrientationForward() end

--- Returns the right direction vector of the active orientation unit, in world coordinates
---@return table Right direction vector of the active orientation unit, in world coordinates
function Construct.getWorldOrientationRight() end

--- Returns the up direction vector of the active orientation unit, in world coordinates
---@return table Up direction vector of the active orientation unit, in world coordinates
function Construct.getWorldOrientationUp() end

--- Returns the id of the parent construct of our active construct
---@return integer 
function Construct.getParent() end

--- Returns the id of the nearest constructs, on which the construct can dock
---@return integer 
function Construct.getClosestParent() end

--- Returns the list of ids of nearby constructs, on which the construct can dock
---@return table 
function Construct.getCloseParents() end

--- Returns the position of the construct's parent when docked in local coordinates
---@return table The position of the construct's parent in local coordinates
function Construct.getParentPosition() end

--- Returns the position of the construct's parent when docked in world coordinates
---@return table The position of the construct's parent in world coordinates
function Construct.getParentWorldPosition() end

--- Returns the construct's parent forward direction vector, in local coordinates
---@return table The construct's parent forward direction vector, in local coordinates
function Construct.getParentForward() end

--- Returns the construct's parent right direction vector, in construct local coordinates
---@return table The construct's parent right direction vector, in construct local coordinates
function Construct.getParentRight() end

--- Returns the construct's parent up direction vector, in construct local coordinates
---@return table The construct's parent up direction vector, in construct local coordinates
function Construct.getParentUp() end

--- Returns the construct's parent forward direction vector, in world coordinates
---@return table The construct's parent forward direction vector, in world coordinates
function Construct.getParentWorldForward() end

--- Returns the construct's parent right direction vector, in world coordinates
---@return table The construct's parent right direction vector, in world coordinates
function Construct.getParentWorldRight() end

--- Returns the construct's parent up direction vector, in world coordinates
---@return table The construct's parent up direction vector, in world coordinates
function Construct.getParentWorldUp() end

--- Returns the list of player IDs on board the construct
---@return table 
function Construct.getPlayersOnBoard() end

--- Returns the list of player ids on board the construct inside a VR Station
---@return table 
function Construct.getPlayersOnBoardInVRStation() end

--- Checks if the given player is on board in the construct
---@param id integer The player id
---@return boolean True if the given player is on board, false otherwise
function Construct.isPlayerBoarded(id) end

--- Returns 1 if the given player is boarded to the construct inside a VR Station
---@param id integer The player id
---@return boolean True if the given player is boarded to the construct, false otherwise
function Construct.isPlayerBoardedInVRStation(id) end

--- Returns the mass of the given player or surrogate if it is on board the construct
---@param id integer The player id
---@return number 
function Construct.getBoardedPlayerMass(id) end

--- Returns the mass of the given player if in VR station on board the construct
---@param id integer The player id
---@return number 
function Construct.getBoardedInVRStationAvatarMass(id) end

--- Returns the list of IDs of constructs docked to the construct
---@return table 
function Construct.getDockedConstructs() end

--- Checks if the given construct is docked to the construct
---@param id integer The construct id
---@return boolean True if the given construct is docked, false otherwise
function Construct.isConstructDocked(id) end

--- Returns the mass of the given construct if it is docked to the construct
---@param id integer The construct id
---@return number 
function Construct.getDockedConstructMass(id) end

--- Sets the docking mode
---@param mode integer The docking mode (Manual = 1, Automatic = 2, Semi-automatic = 3)
---@return boolean True if the operation is a success, false otherwise
function Construct.setDockingMode(mode) end

--- Returns the current docking mode
---@return integer The docking mode (Manual = 1, Automatic = 2, Semi-automatic = 3)
function Construct.getDockingMode() end

--- Sends a request to dock to the given construct. Limited to piloting controllers
---@param id integer The parent construct id
---@return boolean True if the operation is a success, false otherwise
function Construct.dock(id) end

--- Sends a request to undock the construct. Limited to piloting controllers
---@return boolean True if the operation is a success, false otherwise
function Construct.undock() end

--- Sends a request to deboard a player or surrogate with the given id
---@param id integer The player id
---@return boolean if the operation is a success, false otherwise
function Construct.forceDeboard(id) end

--- Sends a request to undock a construct with the given id
---@param id integer The construct id
---@return boolean if the operation is a success, false otherwise
function Construct.forceUndock(id) end

--- Sends a request to interrupt the surrogate session of a player with the given id
---@param id integer The player id
---@return boolean if the operation is a success, false otherwise
function Construct.forceInterruptVRSession(id) end

--- Emitted when the construct becomes docked
---@param id integer The parent id
---@type Event
Construct.onDocked = Event:new()

--- Emitted when the construct is undocked
---@param id integer The previous parent id
---@type Event
Construct.onUndocked = Event:new()

--- Emitted when a player or surrogate boards the construct
---@param id integer The id of the boarding player
---@type Event
Construct.onPlayerBoarded = Event:new()

--- Emitted when a player enters a VR Station
---@param id integer The id of the boarding player
---@type Event
Construct.onVRStationEntered = Event:new()

--- Emitted when another construct docks this construct
---@param id integer The id of the docking construct
---@type Event
Construct.onConstructDocked = Event:new()

--- Emitted when the PvP timer started or elapsed
---@param active boolean True if the timer started, false when the timer elapsed
---@type Event
Construct.onPvPTimer = Event:new()


---@class Container
local Container = {}
--- Show the element widget in the in-game widget stack
function Container.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Container.show() end

--- Hide the element widget in the in-game widget stack
function Container.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Container.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Container.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Container.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Container.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Container.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Container.getDataId() end

--- Returns the element name
---@return string The element's name
function Container.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Container.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Container.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Container.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Container.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Container.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Container.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Container.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Container.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Container.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Container.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Container.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Container.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Container.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Container.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Container.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Container.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Container.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Container.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Container.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Container.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Container.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Container.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Container.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Container.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Container.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Container.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Container.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Container.getSignalOut(plug) end

--- Returns the mass of the container element(as if it were empty).
---@return number The mass of the container in kilograms
function Container.getSelfMass() end

--- Returns the container content mass(the sum of the mass of all items it contains).
---@return number The total mass of the contents of the container, excluding the container's own mass, in kilograms
function Container.getItemsMass() end

--- Returns the container content volume(the sum of the volume of all items it contains).
---@return number The total volume of the contents of the container in liters
function Container.getItemsVolume() end

--- Returns the maximum volume of the container.
---@return number The maximum volume of the container in liters
function Container.getMaxVolume() end

--- Returns a table describing the contents of the container, as a pair itemId and quantity per slot.
---@return table The content of the container as a table with fields {[int] id, [float] quantity} per slot
function Container.getContent() end

---@deprecated Container.getItemsList() is deprecated, use Container.getContent() instead.
function Container.getItemsList() end

--- Send a request to get an update of the content of the container, limited to one call allowed per 30 seconds.
--- The onContentUpdate event is emitted by the container when the content is updated.
---@return number If the request is not yet possible, returns the remaining time to wait for.
function Container.updateContent() end

---@deprecated Container.acquireStorage() is deprecated, use Container.updateContent() instead.
function Container.acquireStorage() end

--- Emitted when the container content is updated(storage update or after a manual request made with updateContent())
---@type Event
Container.onContentUpdate = Event:new()

---@type Event
Container.storageAcquired = Event:new()


---@class ControlUnit
local ControlUnit = {}
--- Show the element widget in the in-game widget stack
function ControlUnit.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function ControlUnit.show() end

--- Hide the element widget in the in-game widget stack
function ControlUnit.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function ControlUnit.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function ControlUnit.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function ControlUnit.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function ControlUnit.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function ControlUnit.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function ControlUnit.getDataId() end

--- Returns the element name
---@return string The element's name
function ControlUnit.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function ControlUnit.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function ControlUnit.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function ControlUnit.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function ControlUnit.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function ControlUnit.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function ControlUnit.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function ControlUnit.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function ControlUnit.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function ControlUnit.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function ControlUnit.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function ControlUnit.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function ControlUnit.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function ControlUnit.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function ControlUnit.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function ControlUnit.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function ControlUnit.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function ControlUnit.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function ControlUnit.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function ControlUnit.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function ControlUnit.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function ControlUnit.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function ControlUnit.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function ControlUnit.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function ControlUnit.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function ControlUnit.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function ControlUnit.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function ControlUnit.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function ControlUnit.getSignalOut(plug) end

--- Stops the Control Unit's Lua code and exits. Warning: calling this might cause your ship to fall from the sky,
--- use it with care. It is typically used in the coding of emergency Control Unit scripts to stop control once the ECU
--- thinks that the ship has safely landed.
function ControlUnit.exit() end

---@deprecated ControlUnit.getMasterPlayerId() is deprecated, use player.getId() instead.
function ControlUnit.getMasterPlayerId() end

---@deprecated ControlUnit.getMasterPlayerOrgIds() is deprecated, use player.getOrgIds() instead.
function ControlUnit.getMasterPlayerOrgIds() end

---@deprecated ControlUnit.getMasterPlayerPosition() is deprecated, use player.getPosition() instead.
function ControlUnit.getMasterPlayerPosition() end

---@deprecated ControlUnit.getMasterPlayerWorldPosition() is deprecated, use player.getWorldPosition() instead.
function ControlUnit.getMasterPlayerWorldPosition() end

---@deprecated ControlUnit.getMasterPlayerForward() is deprecated, use player.getForward() instead.
function ControlUnit.getMasterPlayerForward() end

---@deprecated ControlUnit.getMasterPlayerUp() is deprecated, use player.getUp() instead.
function ControlUnit.getMasterPlayerUp() end

---@deprecated ControlUnit.getMasterPlayerRight() is deprecated, use player.getRight() instead.
function ControlUnit.getMasterPlayerRight() end

---@deprecated ControlUnit.getMasterPlayerWorldForward() is deprecated, use player.getWorldForward() instead.
function ControlUnit.getMasterPlayerWorldForward() end

---@deprecated ControlUnit.getMasterPlayerWorldUp() is deprecated, use player.getWorldUp() instead.
function ControlUnit.getMasterPlayerWorldUp() end

---@deprecated ControlUnit.getMasterPlayerWorldRight() is deprecated, use player.getWorldRight() instead.
function ControlUnit.getMasterPlayerWorldRight() end

---@deprecated ControlUnit.isMasterPlayerSeated() is deprecated, use player.isSeated() instead.
function ControlUnit.isMasterPlayerSeated() end

---@deprecated ControlUnit.getMasterPlayerSeatId() is deprecated, use player.getSeatId() instead.
function ControlUnit.getMasterPlayerSeatId() end

---@deprecated ControlUnit.getMasterPlayerParent() is deprecated, use player.getParent() instead.
function ControlUnit.getMasterPlayerParent() end

---@deprecated ControlUnit.getMasterPlayerMass() is deprecated, use player.getMass() instead.
function ControlUnit.getMasterPlayerMass() end

--- Set up a timer with a given tag in a given period. This will start to trigger the 'onTimer' event with
--- the corresponding tag as an argument, to help you identify what is ticking, and when.
---@param tag string The tag of the timer, as a string, which will be used in the 'onTimer' event to identify this particular timer
---@param period number The period of the timer, in seconds. The time resolution is limited by the framerate here, so you cannot set arbitrarily fast timers
function ControlUnit.setTimer(tag, period) end

--- Stop the timer with the given tag
---@param tag string The tag of the timer to stop, as a string
function ControlUnit.stopTimer(tag) end

--- Returns the ambient atmospheric density
---@return number The atmospheric density(between 0 and 1)
function ControlUnit.getAtmosphereDensity() end

--- Returns the influence rate of the nearest planet
---@return number The planet influence rate(between 0 and 1)
function ControlUnit.getClosestPlanetInfluence() end

--- Checks if the control unit is protected by DRM
---@return boolean True if the control unit is protected by DRM, false otherwise
function ControlUnit.hasDRM() end

--- Check if the construct is remote controlled
---@return boolean True if the construct is remote controlled, false otherwise
function ControlUnit.isRemoteControlled() end

--- Automatically assign the engines within the taglist
--- to result in the given acceleration and angular acceleration provided. Can only be called within the system.onFlush event
--- If engines designated by the tags are not capable of producing the desired command, setEngineCommand will try to do its best
--- to approximate it
--- This function must be used on a piloting controller in onFlush event
--- Other included engines not in any priority will be used last
---@param taglist string Comma (for union) or space (for intersection) separated list of tags. You can set tags directly on the engines in the right-click menu
---@param acceleration table The desired acceleration expressed in world coordinates in m/s2
---@param angularAcceleration table The desired angular acceleration expressed in world coordinates in rad/s2
---@param keepForceCollinearity boolean True to force the resulting acceleration vector to be collinear to the acceleration parameter
---@param keepTorqueCollinearity boolean True to force the resulting angular acceleration vector to be collinear to the angular acceleration parameter
---@param priority1SubTags string Comma (for union) or space (for intersection) separated list of tags of included engines to use as priority 1
---@param priority2SubTags string Comma (for union) or space (for intersection) separated list of tags of included engines to use as priority 2
---@param priority3SubTags string Comma (for union) or space (for intersection) separated list of tags of included engines to use as priority 3
---@param toleranceRatioToStopCommand number When going through with priorities, if we reach a command that is achieved within this tolerance, we will stop there
function ControlUnit.setEngineCommand(taglist, acceleration, angularAcceleration, keepForceCollinearity, keepTorqueCollinearity, priority1SubTags, priority2SubTags, priority3SubTags, toleranceRatioToStopCommand) end

--- Sets the thrust values for all engines in the tag list
--- This function must be used on a piloting controller
---@param taglist string Comma separated list of tags. You can set tags directly on the engines in the right-click menu
---@param thrust number The desired thrust in newtons (note that for boosters, any non zero value here will set them to 100%)
function ControlUnit.setEngineThrust(taglist, thrust) end

--- Returns the total thrust values of all engines in the tag list
--- This function must be used on a piloting controller
---@param taglist string Comma separated list of tags. You can set tags directly on the engines in the right-click menu
---@return table total thrust in newtons
function ControlUnit.getEngineThrust(taglist) end

--- Set the value of throttle in the cockpit, which will be displayed in the cockpit widget when flying
--- This function must be used on a piloting controller
---@param axis integer Longitudinal = 0, lateral = 1, vertical = 2
---@param commandValue number In 'by throttle', the value of the throttle position: -1 = full reverse, 1 = full forward. Or In 'By Target Speed', the value of the target speed in km/h
function ControlUnit.setAxisCommandValue(axis, commandValue) end

--- Get the value of throttle in the cockpit
--- This function must be used on a piloting controller
---@param axis integer Longitudinal = 0, lateral = 1, vertical = 2
---@return number In travel mode, return the value of the throttle position: -1 = full reverse, 1 = full forward or in cruise mode, return the value of the target speed
function ControlUnit.getAxisCommandValue(axis) end

--- Set the properties of an axis command
--- This function must be used on a piloting controller
--- These properties will be used to display the command in UI
---@param axis integer Longitudinal = 0, lateral = 1, vertical = 2
---@param commandType integer By throttle = 0, by target speed = 1, hidden = 2
---@param targetSpeedRanges table This is to specify the cruise control target speed ranges (for now, only for the longitudinal axis) in m/s
function ControlUnit.setupAxisCommandProperties(axis, commandType, targetSpeedRanges) end

--- Returns the current control mode. The mode is set by clicking the UI button or using the associated keybinding
--- This function must be used on a piloting controller
---@return integer The current control mode (for now, only 2 are available, 0 and 1)
function ControlUnit.getControlMode() end

---@deprecated ControlUnit.getControlMasterModeId() is deprecated, use ControlUnit.getControlMode() instead.
function ControlUnit.getControlMasterModeId() end

--- Cancel the current master mode in use
--- This function must be used on a piloting controller
function ControlUnit.cancelCurrentControlMasterMode() end

--- Check if a mouse control scheme is selected
--- This function must be used on a piloting controller
---@return boolean True if a mouse control scheme is selected, false otherwise
function ControlUnit.isMouseControlActivated() end

--- Check if the mouse control direct scheme is selected
--- This function must be used on a piloting controller
---@return boolean True if a direct mouse control scheme is selected, false otherwise
function ControlUnit.isMouseDirectControlActivated() end

--- Check if the mouse control virtual joystick scheme is selected
--- This function must be used on a piloting controller
---@return boolean True if a mouse control virtual joystick scheme is selected, false otherwise
function ControlUnit.isMouseVirtualJoystickActivated() end

--- The ground engines will stabilize to this altitude within their limits
--- The stabilization will be done by adjusting thrust to never go over the target altitude
--- This includes VerticalBooster and HoverEngine
--- This function must be used on a piloting controller
---@param targetAltitude number The stabilization target altitude in m
function ControlUnit.activateGroundEngineAltitudeStabilization(targetAltitude) end

--- Return the ground engines' stabilization altitude
--- This function must be used on a piloting controller
---@return number Stab altitude in m or 0 if none is set
function ControlUnit.getSurfaceEngineAltitudeStabilization() end

--- The ground engines will behave like regular engine
--- This includes VerticalBooster and HoverEngine
--- This function must be used on a piloting controller
function ControlUnit.deactivateGroundEngineAltitudeStabilization() end

--- Returns ground engine stabilization altitude capabilities (lower and upper ranges)
--- This function must be used on a piloting controller
---@return table Stabilization altitude capabilities for the least powerful engine and the most powerful engine
function ControlUnit.computeGroundEngineAltitudeStabilizationCapabilities() end

--- Return the current throttle value
--- This function must be used on a piloting controller
---@return number Throttle value between -100 and 100
function ControlUnit.getThrottle() end

--- Set the label of a control mode buttons shown in the control unit widget
--- This function must be used on a piloting controller
---@param modeId integer The control mode: 0=Travel Mode, 1=Cruise Control by default
---@param label string The display name of the control mode, displayed on the widget button
function ControlUnit.setWidgetControlModeLabel(modeId, label) end

---@deprecated ControlUnit.setupControlMasterModeProperties() is deprecated, use ControlUnit.setWidgetControlModeLabel() instead.
function ControlUnit.setupControlMasterModeProperties() end

--- Checks if any landing gear is deployed
---@return boolean True if any landing gear is deployed, false otherwise
function ControlUnit.isAnyLandingGearDeployed() end

---@deprecated ControlUnit.isAnyLandingGearDeployed() is deprecated, use ControlUnit.isAnyLandingGearExtended() instead.
function ControlUnit.isAnyLandingGearExtended() end

--- Deploy aall landing gears of the construct
function ControlUnit.deployLandingGears() end

---@deprecated ControlUnit.extendLandingGears() is deprecated, use ControlUnit.deployLandingGears() instead.
function ControlUnit.extendLandingGears() end

--- Retract all landing gears
function ControlUnit.retractLandingGears() end

--- Check construct lights status
---@return boolean True if any Headlight is on, false otherwise
function ControlUnit.isAnyHeadlightSwitchedOn() end

--- Turn on the construct headlights
function ControlUnit.switchOnHeadlights() end

--- Turn off the construct headlights
function ControlUnit.switchOffHeadlights() end

--- Emitted when the timer with the tag 'tag' is ticking
---@param tag string The tag of the timer that just ticked (see setTimer to set a timer with a given tag)
---@type Event
ControlUnit.onTimer = Event:new()

---@type Event
ControlUnit.tick = Event:new()


---@class CoreUnit
local CoreUnit = {}
--- Show the element widget in the in-game widget stack
function CoreUnit.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function CoreUnit.show() end

--- Hide the element widget in the in-game widget stack
function CoreUnit.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function CoreUnit.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function CoreUnit.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function CoreUnit.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function CoreUnit.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function CoreUnit.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function CoreUnit.getDataId() end

--- Returns the element name
---@return string The element's name
function CoreUnit.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function CoreUnit.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function CoreUnit.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function CoreUnit.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function CoreUnit.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function CoreUnit.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function CoreUnit.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function CoreUnit.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function CoreUnit.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function CoreUnit.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function CoreUnit.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function CoreUnit.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function CoreUnit.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function CoreUnit.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function CoreUnit.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function CoreUnit.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function CoreUnit.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function CoreUnit.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function CoreUnit.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function CoreUnit.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function CoreUnit.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function CoreUnit.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function CoreUnit.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function CoreUnit.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function CoreUnit.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function CoreUnit.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function CoreUnit.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function CoreUnit.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function CoreUnit.getSignalOut(plug) end

---@deprecated CoreUnit.getConstructId() is deprecated, use construct.getId() instead.
function CoreUnit.getConstructId() end

---@deprecated CoreUnit.getConstructName() is deprecated, use construct.getName() instead.
function CoreUnit.getConstructName() end

---@deprecated CoreUnit.getConstructWorldPos() is deprecated, use construct.getWorldPosition() instead.
function CoreUnit.getConstructWorldPos() end

---@deprecated CoreUnit.getWorldAirFrictionAcceleration() is deprecated, use construct.getWorldAirFrictionAcceleration() instead.
function CoreUnit.getWorldAirFrictionAcceleration() end

---@deprecated CoreUnit.getWorldAirFrictionAngularAcceleration() is deprecated, use construct.getWorldAirFrictionAngularAcceleration() instead.
function CoreUnit.getWorldAirFrictionAngularAcceleration() end

---@deprecated CoreUnit.getSchematicInfo(schematicId) is deprecated, use System.getSchematic(id) instead.
function CoreUnit.getSchematicInfo() end

---@deprecated CoreUnit.getAngularVelocity() is deprecated, use construct.getAngularVelocity() instead.
function CoreUnit.getAngularVelocity() end

---@deprecated CoreUnit.getWorldAngularVelocity() is deprecated, use construct.getWorldAngularVelocity() instead.
function CoreUnit.getWorldAngularVelocity() end

---@deprecated CoreUnit.getAngularAcceleration() is deprecated, use construct.getAngularAcceleration() instead.
function CoreUnit.getAngularAcceleration() end

---@deprecated CoreUnit.getWorldAngularAcceleration() is deprecated, use construct.getWorldAngularAcceleration() instead.
function CoreUnit.getWorldAngularAcceleration() end

---@deprecated CoreUnit.getVelocity() is deprecated, use construct.getVelocity() instead.
function CoreUnit.getVelocity() end

---@deprecated CoreUnit.getWorldVelocity() is deprecated, use construct.getWorldVelocity() instead.
function CoreUnit.getWorldVelocity() end

---@deprecated CoreUnit.getAbsoluteVelocity() is deprecated, use construct.getAbsoluteVelocity() instead.
function CoreUnit.getAbsoluteVelocity() end

---@deprecated CoreUnit.getWorldAbsoluteVelocity() is deprecated, use construct.getWorldAbsoluteVelocity() instead.
function CoreUnit.getWorldAbsoluteVelocity() end

---@deprecated CoreUnit.getWorldAcceleration() is deprecated, use construct.getWorldAcceleration() instead.
function CoreUnit.getWorldAcceleration() end

---@deprecated CoreUnit.getAcceleration() is deprecated, use construct.getAcceleration() instead.
function CoreUnit.getAcceleration() end

---@deprecated CoreUnit.getOrientationUnitId() is deprecated, use construct.getOrientationUnitId() instead.
function CoreUnit.getOrientationUnitId() end

---@deprecated CoreUnit.getConstructOrientationUp() is deprecated, use construct.getOrientationUp() instead.
function CoreUnit.getConstructOrientationUp() end

---@deprecated CoreUnit.getConstructOrientationRight() is deprecated, use construct.getOrientationRight() instead.
function CoreUnit.getConstructOrientationRight() end

---@deprecated CoreUnit.getConstructOrientationForward() is deprecated, use construct.getOrientationForward() instead.
function CoreUnit.getConstructOrientationForward() end

---@deprecated CoreUnit.getConstructWorldOrientationUp() is deprecated, use construct.getWorldOrientationUp() instead.
function CoreUnit.getConstructWorldOrientationUp() end

---@deprecated CoreUnit.getConstructWorldOrientationRight() is deprecated, use construct.getWorldOrientationRight() instead.
function CoreUnit.getConstructWorldOrientationRight() end

---@deprecated CoreUnit.getConstructWorldOrientationForward() is deprecated, use construct.getWorldOrientationForward() instead.
function CoreUnit.getConstructWorldOrientationForward() end

---@deprecated CoreUnit.getConstructWorldUp() is deprecated, use construct.getWorldUp() instead.
function CoreUnit.getConstructWorldUp() end

---@deprecated CoreUnit.getConstructWorldRight() is deprecated, use construct.getWorldRight() instead.
function CoreUnit.getConstructWorldRight() end

---@deprecated CoreUnit.getConstructWorldForward() is deprecated, use construct.getWorldForward() instead.
function CoreUnit.getConstructWorldForward() end

---@deprecated CoreUnit.getPvPTimer() is deprecated, use construct.getPvPTimer() instead.
function CoreUnit.getPvPTimer() end

---@deprecated CoreUnit.getPlayersOnBoard() is deprecated, use construct.getPlayersOnBoard() instead.
function CoreUnit.getPlayersOnBoard() end

---@deprecated CoreUnit.getPlayersOnBoardInVRStation() is deprecated, use construct.getPlayersOnBoardInVRStation() instead.
function CoreUnit.getPlayersOnBoardInVRStation() end

---@deprecated CoreUnit.getDockedConstructs() is deprecated, use construct.getDockedConstructs() instead.
function CoreUnit.getDockedConstructs() end

---@deprecated CoreUnit.isPlayerBoarded(pid) is deprecated, use construct.isPlayerBoarded(id) instead.
function CoreUnit.isPlayerBoarded() end

---@deprecated CoreUnit.isPlayerBoardedInVRStation(pid) is deprecated, use construct.isPlayerBoardedInVRStation(id) instead.
function CoreUnit.isPlayerBoardedInVRStation() end

---@deprecated CoreUnit.isConstructDocked(cid) is deprecated, use construct.isConstructDocked(id) instead.
function CoreUnit.isConstructDocked() end

---@deprecated CoreUnit.forceDeboard(pid) is deprecated, use construct.forceDeboard(id) instead.
function CoreUnit.forceDeboard() end

---@deprecated CoreUnit.forceInterruptVRSession(pid) is deprecated, use construct.forceInterruptVRSession(id) instead.
function CoreUnit.forceInterruptVRSession() end

---@deprecated CoreUnit.forceUndock(cid) is deprecated, use construct.forceUndock(id) instead.
function CoreUnit.forceUndock() end

---@deprecated CoreUnit.getBoardedPlayerMass(pid) is deprecated, use construct.getBoardedPlayerMass(id) instead.
function CoreUnit.getBoardedPlayerMass() end

---@deprecated CoreUnit.getBoardedInVRStationAvatarMass(pid) is deprecated, use construct.getId() instead.
function CoreUnit.getBoardedInVRStationAvatarMass() end

---@deprecated CoreUnit.getDockedConstructMass(cid) is deprecated, use construct.getDockedConstructMass(id) instead.
function CoreUnit.getDockedConstructMass() end

---@deprecated CoreUnit.getParent() is deprecated, use construct.getParent() instead.
function CoreUnit.getParent() end

---@deprecated CoreUnit.getCloseParents() is deprecated, use construct.getCloseParents() instead.
function CoreUnit.getCloseParents() end

---@deprecated CoreUnit.getClosestParent() is deprecated, use construct.getClosestParent() instead.
function CoreUnit.getClosestParent() end

---@deprecated CoreUnit.dock(cid) is deprecated, use construct.dock(id) instead.
function CoreUnit.dock() end

---@deprecated CoreUnit.undock() is deprecated, use construct.undock() instead.
function CoreUnit.undock() end

---@deprecated CoreUnit.setDockingMode(mode) is deprecated, use construct.setDockingMode(mode) instead.
function CoreUnit.setDockingMode() end

---@deprecated CoreUnit.getDockingMode() is deprecated, use construct.getDockingMode() instead.
function CoreUnit.getDockingMode() end

---@deprecated CoreUnit.getParentPosition() is deprecated, use construct.getParentPosition() instead.
function CoreUnit.getParentPosition() end

---@deprecated CoreUnit.getParentWorldPosition() is deprecated, use construct.getParentWorldPosition() instead.
function CoreUnit.getParentWorldPosition() end

---@deprecated CoreUnit.getParentForward() is deprecated, use construct.getParentForward() instead.
function CoreUnit.getParentForward() end

---@deprecated CoreUnit.getParentUp() is deprecated, use construct.getParentUp() instead.
function CoreUnit.getParentUp() end

---@deprecated CoreUnit.getParentRight() is deprecated, use construct.getParentRight() instead.
function CoreUnit.getParentRight() end

---@deprecated CoreUnit.getParentWorldForward() is deprecated, use construct.getParentWorldForward() instead.
function CoreUnit.getParentWorldForward() end

---@deprecated CoreUnit.getParentWorldUp() is deprecated, use construct.getParentWorldUp() instead.
function CoreUnit.getParentWorldUp() end

---@deprecated CoreUnit.getParentWorldRight() is deprecated, use construct.getParentWorldRight() instead.
function CoreUnit.getParentWorldRight() end

---@deprecated CoreUnit.getMaxSpeed() is deprecated, use construct.getMaxSpeed() instead.
function CoreUnit.getMaxSpeed() end

---@deprecated CoreUnit.getMaxAngularSpeed() is deprecated, use construct.getMaxAngularSpeed() instead.
function CoreUnit.getMaxAngularSpeed() end

---@deprecated CoreUnit.getMaxSpeedPerAxis() is deprecated, use construct.getMaxSpeedPerAxis() instead.
function CoreUnit.getMaxSpeedPerAxis() end

---@deprecated CoreUnit.getConstructMass() is deprecated, use construct.getMass() instead.
function CoreUnit.getConstructMass() end

---@deprecated CoreUnit.getConstructIMass() is deprecated, use construct.getInertialMass() instead.
function CoreUnit.getConstructIMass() end

---@deprecated CoreUnit.getConstructCrossSection() is deprecated, use construct.getCrossSection() instead.
function CoreUnit.getConstructCrossSection() end

---@deprecated CoreUnit.getMaxKinematicsParametersAlongAxis(taglist, CRefAxis) is deprecated, use construct.getMaxThrustAlongAxis(taglist, CRefAxis) instead.
function CoreUnit.getMaxKinematicsParametersAlongAxis() end

--- Returns the list of all the local IDs of the Elements of this construct
---@return table The list of local IDs of the elements of the construct.
function CoreUnit.getElementIdList() end

--- Returns the name of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return string The name of the Element
function CoreUnit.getElementNameById(localId) end

--- Returns the class of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return string The class of the Element
function CoreUnit.getElementClassById(localId) end

--- Returns the item id of the class of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return integer The item ID of the item class
function CoreUnit.getElementClassIdById(localId) end

--- Returns the display name of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return string The display name of the Element
function CoreUnit.getElementDisplayNameById(localId) end

---@deprecated CoreUnit.getElementTypeById(localId) is deprecated, use CoreUnit.getElementDisplayNameById(localId) instead.
function CoreUnit.getElementTypeById() end

--- Returns the item ID of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return integer The item ID of the Element
function CoreUnit.getElementItemIdById(localId) end

--- Returns the current hitpoints of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return number The current hitpoints of the Element
function CoreUnit.getElementHitPointsById(localId) end

--- Returns the maximum hitpoints of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return number 
function CoreUnit.getElementMaxHitPointsById(localId) end

--- Returns the remaining restorations of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return integer The restorations remaining for the Element
function CoreUnit.getElementRestorationsById(localId) end

--- Returns the maximum restorations of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return integer The max restorations for the Element
function CoreUnit.getElementMaxRestorationsById(localId) end

--- Returns the mass of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return number The maximum hitpoints of the Element
function CoreUnit.getElementMassById(localId) end

--- Returns the position of the Element, identified by its local ID, in construct local coordinates.
---@param localId integer The local ID of the Element
---@return table  The position of the Element in construct local coordinates
function CoreUnit.getElementPositionById(localId) end

--- Returns the up direction vector of the Element, identified by its local ID, in construct local coordinates
---@param localId integer The local ID of the Element
---@return table The up direction vector of the Element identified by its local ID, in construct local coordinates
function CoreUnit.getElementUpById(localId) end

--- Returns the right direction vector of the Element, identified by its local ID, in construct local coordinates
---@param localId integer The local ID of the Element
---@return table The right direction vector of the Element identified by its local ID, in construct local coordinates
function CoreUnit.getElementRightById(localId) end

--- Returns the forward direction vector of the Element, identified by its local ID, in construct local coordinates
---@param localId integer The local ID of the Element
---@return table The forward direction vector of the Element identified by its local ID, in construct local coordinates
function CoreUnit.getElementForwardById(localId) end

--- Returns the status of the Industry Unit Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return table If the Element is an Industry Unit, a table with fields {[int] state, [bool] stopRequested, [int] schematicId (deprecated = 0), [int] schematicsRemaining (deprecated = 0), [table] requiredSchematicIds {[int] id}, [int] requiredSchematicAmount, [int] unitsProduced, [int] remainingTime, [int] batchesRequested, [int] batchesRemaining, [float] maintainProductAmount, [int] currentProductAmount, [table] currentProducts:{{[int] id, [double] quantity},...}}
function CoreUnit.getElementIndustryInfoById(localId) end

---@deprecated CoreUnit.getElementIndustryStatusById(localId) is deprecated, use CoreUnit.getElementIndustryInfoById(localId) instead.
function CoreUnit.getElementIndustryStatusById() end

--- Returns the Element IN plug map, identified by its local ID
---@param localId integer The local ID of the Element
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function CoreUnit.getElementInPlugsById(localId) end

--- Returns the Element OUT plug map, identified by its local ID
---@param localId integer The local ID of the Element
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function CoreUnit.getElementOutPlugsById(localId) end

--- Returns the list of engine tags for an Engine Element identified by its local ID
---@param localId integer The local ID of the engine
---@return string The CSV string of the tags
function CoreUnit.getEngineTagsById(localId) end

---@deprecated CoreUnit.getElementTagsById(localId) is deprecated, use CoreUnit.getEngineTagsById(localId) instead.
function CoreUnit.getElementTagsById() end

--- Sets the list of engine tags for an Engine Element, identified by its local ID
---@param localId integer The local ID of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean (optional) True to ignore the default engine tags
---@return boolean True if the tags have been applied, false if they have not
function CoreUnit.setEngineTagsById(localId, tags, ignore) end

--- Sets the torque generation state for the Engine Element, identified by its local ID
---@param localId integer The local ID of the engine
---@param state boolean True to enable engine torque
function CoreUnit.setEngineTorqueById(localId, state) end

--- Returns the torque generation state for the Engine Element, identified by its local ID
---@param localId integer The local ID of the engine
---@return boolean True if the torque generation is enabled, false if it is not
function CoreUnit.getEngineTorqueById(localId) end

--- Checks if the engine element is ignoring default tags, identified by its local ID
---@param localId integer The local ID of the engine
---@return boolean True if the engine ignores default engine tags, false if not
function CoreUnit.isEngineIgnoringTagsById(localId) end

--- Returns the altitude above sea level, with respect to the closest planet (0 in space)
---@return number The altitude above sea level in meters
function CoreUnit.getAltitude() end

--- Returns the local gravity intensity
---@return number The gravitation acceleration where the construct is located in m/s²
function CoreUnit.getGravityIntensity() end

---@deprecated CoreUnit.g() is deprecated, use CoreUnit.getGravityIntensity() instead.
function CoreUnit.g() end

--- Returns the local gravity vector in world coordinates
---@return table The local gravity field vector in world coordinates in m/s2
function CoreUnit.getWorldGravity() end

--- Returns the gravity unit vector, in world coordinates ({0,0,0} in space)
---@return table The local gravity unit vector in world coordinates in meters
function CoreUnit.getWorldVertical() end

--- Returns the id of the current close stellar body
---@return integer The id of the current close stellar body
function CoreUnit.getCurrentPlanetId() end

--- Returns the core's current stress, destroyed when reaching max stress
---@return number The stress the core absorbed
function CoreUnit.getCoreStress() end

--- Returns the maximal stress the core can bear before it gets destroyed
---@return number The maximal stress before destruction
function CoreUnit.getMaxCoreStress() end

--- Returns the core's current stress to max stress ratio
---@return number The stress ratio, between 0 for no stress and 1 for destruction
function CoreUnit.getCoreStressRatio() end

--- Spawns a number sticker in the 3D world, with coordinates relative to the construct
---@param nb integer The number to display 0 to 9
---@param x number The x-coordinate in the construct in meters. 0 = center
---@param y number The y-coordinate in the construct in meters. 0 = center
---@param z number The z-coordinate in the construct in meters. 0 = center
---@param orientation string Orientation of the number. Possible values are "front", "side"
---@return integer An index that can be used later to delete or move the item, -1 if error or maxnumber reached
function CoreUnit.spawnNumberSticker(nb, x, y, z, orientation) end

--- Spawns an arrow sticker in the 3D world, with coordinates relative to the construct
---@param x number The x-coordinate in the construct in meters. 0 = center
---@param y number the y-coordinate in the construct in meters. 0 = center
---@param z number The z-coordinate in the construct in meters. 0 = center
---@param orientation string Orientation of the arrow. Possible values are "up", "down", "north", "south", "east", "west"
---@return integer An index that can be used later to delete or move the item, -1 if error or max number reached
function CoreUnit.spawnArrowSticker(x, y, z, orientation) end

--- Delete the referenced sticker
---@param index integer Index of the sticker to delete
---@return boolean True if the sticker has been successfuly deleted, false otherwise
function CoreUnit.deleteSticker(index) end

--- Move the referenced sticker
---@param index integer Index of the sticker to move
---@param x number The x-coordinate in the construct in meters. 0 = center
---@param y number The y-coordinate in the construct in meters. 0 = center
---@param z number The z-coordinate in the construct in meters. 0 = center
---@return boolean True if the sticker has been successfuly moved, false otherwise
function CoreUnit.moveSticker(index, x, y, z) end

--- Rotate the referenced sticker.
---@param index integer Index of the sticker to rotate
---@param angle_x number Rotation along the x-axis in degrees
---@param angle_y number Rotation along the y-axis in degrees
---@param angle_z number Rotation along the z-axis in degrees
---@return boolean True if the sticker has been successfuly rotated, false otherwise
function CoreUnit.rotateSticker(index, angle_x, angle_y, angle_z) end

---@type Event
CoreUnit.pvpTimer = Event:new()

---@type Event
CoreUnit.playerBoarded = Event:new()

---@type Event
CoreUnit.VRStationEntered = Event:new()

---@type Event
CoreUnit.constructDocked = Event:new()

---@type Event
CoreUnit.docked = Event:new()

---@type Event
CoreUnit.undocked = Event:new()

--- Emitted when core unit stress changed
---@param stress number Difference to previous stress value
---@type Event
CoreUnit.onStressChanged = Event:new()

---@type Event
CoreUnit.stressChanged = Event:new()

--- Emitted when an Element is broken
---@param localId integer The local ID of the Element
---@param restorations integer The restorations remaining for the Element
---@type Event
CoreUnit.onElementBroken = Event:new()

--- Emitted when an Element is restored
---@param localId integer The local ID of the Element
---@param restorations integer The restorations remaining for the Element
---@type Event
CoreUnit.onElementRestored = Event:new()

--- Emitted when an Element is damaged
---@param localId integer The local ID of the Element
---@param hitpoints integer The amount of hitpoints taken in damage
---@type Event
CoreUnit.onElementDamaged = Event:new()

--- Emitted when an Element is repaired
---@param localId integer The local ID of the Element
---@param hitpoints integer The amount of hitpoints repaired
---@type Event
CoreUnit.onElementRepaired = Event:new()


---@class Counter
local Counter = {}
--- Show the element widget in the in-game widget stack
function Counter.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Counter.show() end

--- Hide the element widget in the in-game widget stack
function Counter.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Counter.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Counter.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Counter.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Counter.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Counter.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Counter.getDataId() end

--- Returns the element name
---@return string The element's name
function Counter.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Counter.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Counter.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Counter.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Counter.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Counter.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Counter.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Counter.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Counter.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Counter.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Counter.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Counter.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Counter.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Counter.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Counter.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Counter.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Counter.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Counter.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Counter.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Counter.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Counter.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Counter.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Counter.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Counter.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Counter.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Counter.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Counter.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Counter.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Counter.getSignalOut(plug) end

--- Returns the index of the current active output plug
---@return integer The index of the active plug
function Counter.getIndex() end

---@deprecated Counter.getCounterState() is deprecated, use Counter.getIndex() instead.
function Counter.getCounterState() end

--- Returns the maximum index of the counter
---@return integer The maximum index
function Counter.getMaxIndex() end

--- Moves the next counter index
function Counter.nextIndex() end

---@deprecated Counter.next() is deprecated, use Counter.nextIndex() instead.
function Counter.next() end

--- Sets the counter index
---@param index integer The index of the plug to activate
function Counter.setIndex(index) end


---@class Databank
local Databank = {}
--- Show the element widget in the in-game widget stack
function Databank.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Databank.show() end

--- Hide the element widget in the in-game widget stack
function Databank.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Databank.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Databank.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Databank.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Databank.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Databank.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Databank.getDataId() end

--- Returns the element name
---@return string The element's name
function Databank.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Databank.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Databank.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Databank.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Databank.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Databank.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Databank.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Databank.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Databank.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Databank.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Databank.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Databank.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Databank.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Databank.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Databank.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Databank.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Databank.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Databank.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Databank.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Databank.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Databank.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Databank.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Databank.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Databank.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Databank.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Databank.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Databank.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Databank.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Databank.getSignalOut(plug) end

--- Clear the Databank
function Databank.clear() end

--- Returns the number of keys that are stored inside the Databank
---@return integer The number of keys
function Databank.getNbKeys() end

--- Returns all the keys in the Databank
---@return table The key list, as a list of string
function Databank.getKeyList() end

---@deprecated Databank.getKeys() is deprecated, use Databank.getKeyList().
function Databank.getKeys() end

--- Checks if the key is present in the Databank
---@param key string The key used to store a value
---@return boolean True if the key exists, false otherwise
function Databank.hasKey(key) end

--- Remove the given key if the key is present in the Databank
---@param key string The key used to store a value
---@return boolean True if the key has been successfully removed, false otherwise
function Databank.clearValue(key) end

--- Stores a string value at the given key
---@param key string The key used to store the value
---@param val string The value, as a string
function Databank.setStringValue(key, val) end

--- Returns value stored in the given key as a string
---@param key string The key used to retrieve the value
---@return string The value as a string
function Databank.getStringValue(key) end

--- Stores an integer value at the given key
---@param key string The key used to store the value
---@param val integer The value, as an integer
function Databank.setIntValue(key, val) end

--- Returns value stored in the given key as an integer
---@param key string The key used to retrieve the value
---@return integer The value as an integer
function Databank.getIntValue(key) end

--- Stores a floating number value at the given key
---@param key string The key used to store the value
---@param val number The value, as a floating number
function Databank.setFloatValue(key, val) end

--- Returns value stored in the given key as a floating number
---@param key string The key used to retrieve the value
---@return number The value as a floating number
function Databank.getFloatValue(key) end


---@class DetectionZone
local DetectionZone = {}
--- Show the element widget in the in-game widget stack
function DetectionZone.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function DetectionZone.show() end

--- Hide the element widget in the in-game widget stack
function DetectionZone.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function DetectionZone.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function DetectionZone.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function DetectionZone.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function DetectionZone.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function DetectionZone.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function DetectionZone.getDataId() end

--- Returns the element name
---@return string The element's name
function DetectionZone.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function DetectionZone.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function DetectionZone.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function DetectionZone.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function DetectionZone.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function DetectionZone.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function DetectionZone.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function DetectionZone.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function DetectionZone.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function DetectionZone.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function DetectionZone.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function DetectionZone.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function DetectionZone.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function DetectionZone.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function DetectionZone.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function DetectionZone.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function DetectionZone.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function DetectionZone.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function DetectionZone.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function DetectionZone.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function DetectionZone.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function DetectionZone.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function DetectionZone.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function DetectionZone.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function DetectionZone.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function DetectionZone.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function DetectionZone.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function DetectionZone.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function DetectionZone.getSignalOut(plug) end

--- Returns the detection zone radius
---@return number The detection zone radius in meters
function DetectionZone.getRadius() end

--- Returns the list of ids of the players in the detection zone
---@return table The list of player ids
function DetectionZone.getPlayers() end

--- Emitted when a player enters in the detection zone
---@param id integer The ID of the player. Use system.getPlayerName(id) to retrieve its name
---@type Event
DetectionZone.onEnter = Event:new()

---@type Event
DetectionZone.enter = Event:new()

--- Emitted when a player leaves in the detection zone
---@param id integer The ID of the player. Use system.getPlayerName(id) to retrieve its name
---@type Event
DetectionZone.onLeave = Event:new()

---@type Event
DetectionZone.leave = Event:new()


---@class Door
local Door = {}
--- Show the element widget in the in-game widget stack
function Door.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Door.show() end

--- Hide the element widget in the in-game widget stack
function Door.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Door.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Door.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Door.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Door.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Door.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Door.getDataId() end

--- Returns the element name
---@return string The element's name
function Door.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Door.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Door.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Door.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Door.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Door.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Door.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Door.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Door.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Door.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Door.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Door.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Door.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Door.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Door.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Door.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Door.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Door.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Door.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Door.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Door.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Door.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Door.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Door.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Door.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Door.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Door.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Door.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Door.getSignalOut(plug) end

--- Open the door
function Door.open() end

---@deprecated Door.activate() is deprecated, use Door.open() instead.
function Door.activate() end

--- Close the door
function Door.close() end

---@deprecated Door.deactivate() is deprecated, use Door.close() instead.
function Door.deactivate() end

--- Return the opening status of the door
---@return boolean True if the door is open, false otherwise
function Door.isOpen() end

---@deprecated Door.getState() is deprecated, use Door.isOpen() instead.
function Door.getState() end

--- Toggle the door
function Door.toggle() end


---@class Element
local Element = {}
--- Show the element widget in the in-game widget stack
function Element.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Element.show() end

--- Hide the element widget in the in-game widget stack
function Element.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Element.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Element.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Element.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Element.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Element.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Element.getDataId() end

--- Returns the element name
---@return string The element's name
function Element.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Element.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Element.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Element.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Element.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Element.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Element.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Element.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Element.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Element.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Element.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Element.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Element.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Element.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Element.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Element.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Element.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Element.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Element.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Element.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Element.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Element.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Element.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Element.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Element.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Element.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Element.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Element.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Element.getSignalOut(plug) end


---@class Emitter
local Emitter = {}
--- Show the element widget in the in-game widget stack
function Emitter.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Emitter.show() end

--- Hide the element widget in the in-game widget stack
function Emitter.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Emitter.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Emitter.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Emitter.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Emitter.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Emitter.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Emitter.getDataId() end

--- Returns the element name
---@return string The element's name
function Emitter.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Emitter.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Emitter.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Emitter.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Emitter.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Emitter.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Emitter.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Emitter.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Emitter.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Emitter.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Emitter.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Emitter.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Emitter.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Emitter.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Emitter.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Emitter.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Emitter.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Emitter.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Emitter.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Emitter.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Emitter.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Emitter.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Emitter.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Emitter.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Emitter.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Emitter.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Emitter.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Emitter.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Emitter.getSignalOut(plug) end

--- Send a message on the given channel, limited to one transmission per frame and per channel
---@param channel string The channel name, limited to 64 characters. The message will not be sent if it exceeds this
---@param message string The message to be transmitted, truncated to 512 characters in case of overflow
function Emitter.send(channel, message) end

--- Returns the emitter range
---@return number The range in meters
function Emitter.getRange() end

--- Emitted when the emitter successfully sent a message
---@param channel string The channel name
---@param message string The transmitted message
---@type Event
Emitter.onSent = Event:new()


---@class Engine
local Engine = {}
--- Show the element widget in the in-game widget stack
function Engine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Engine.show() end

--- Hide the element widget in the in-game widget stack
function Engine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Engine.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Engine.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Engine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Engine.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Engine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Engine.getDataId() end

--- Returns the element name
---@return string The element's name
function Engine.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Engine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Engine.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Engine.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Engine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Engine.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Engine.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Engine.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Engine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Engine.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Engine.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Engine.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Engine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Engine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Engine.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Engine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Engine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Engine.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Engine.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Engine.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Engine.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Engine.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Engine.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Engine.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Engine.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Engine.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Engine.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Engine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Engine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number The obstruction ratio of the engine
function Engine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string Tags of the engine, in a CSV string
function Engine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean True to ignore the default engine tags
---@return boolean True if the tags have been applied, false if they have not
function Engine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return boolean True if the engine ignores default engine tags, false if not
function Engine.isIgnoringTags() end


---@class Firework
local Firework = {}
--- Show the element widget in the in-game widget stack
function Firework.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Firework.show() end

--- Hide the element widget in the in-game widget stack
function Firework.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Firework.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Firework.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Firework.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Firework.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Firework.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Firework.getDataId() end

--- Returns the element name
---@return string The element's name
function Firework.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Firework.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Firework.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Firework.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Firework.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Firework.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Firework.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Firework.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Firework.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Firework.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Firework.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Firework.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Firework.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Firework.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Firework.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Firework.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Firework.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Firework.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Firework.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Firework.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Firework.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Firework.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Firework.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Firework.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Firework.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Firework.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Firework.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Firework.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Firework.getSignalOut(plug) end

--- Fire the firework
function Firework.fire() end

---@deprecated Firework.activate() is deprecated, use Firework.open() instead.
function Firework.activate() end

--- Set the delay before the launched Fireworks explodes
---@param delay number The delay before explosion in seconds (maximum 5s)
function Firework.setExplosionDelay(delay) end

--- Returns the delay before the launched Fireworks explodes
---@return number The delay before explosion in seconds
function Firework.getExplosionDelay() end

--- Set the speed at which the firework will be launched (impacts its altitude, depending on the local gravity).
---@param speed number The launch speed in m/s (maximum 200m/s)
function Firework.setLaunchSpeed(speed) end

--- Returns the speed at which the firework will be launched
---@return number The launch speed in m/s
function Firework.getLaunchSpeed() end

--- Set the type of launched firework (will affect which firework is picked in the attached Container)
---@param type integer The type index of the firework (Ball = 1, Ring = 2, Palmtree = 3, Shower = 4)
function Firework.setType(type) end

--- Returns the type of launched firework
---@return integer The type index of the firework (Ball = 1, Ring = 2, Palmtree = 3, Shower = 4)
function Firework.getType() end

--- Set the color of the launched firework (will affect which firework is picked in the attached Container)
---@param color integer The color index of the firework (Blue = 1, Gold = 2, Green = 3, Purple = 4, Red = 5, Silver = 6)
function Firework.setColor(color) end

--- Returns the color of the launched firework
---@return integer The color index of the firework (Blue = 1, Gold = 2, Green = 3, Purple = 4, Red = 5, Silver = 6)
function Firework.getColor() end

--- Emitted when a firework has just been fired
---@type Event
Firework.onFired = Event:new()


---@class ForceField
local ForceField = {}
--- Show the element widget in the in-game widget stack
function ForceField.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function ForceField.show() end

--- Hide the element widget in the in-game widget stack
function ForceField.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function ForceField.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function ForceField.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function ForceField.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function ForceField.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function ForceField.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function ForceField.getDataId() end

--- Returns the element name
---@return string The element's name
function ForceField.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function ForceField.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function ForceField.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function ForceField.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function ForceField.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function ForceField.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function ForceField.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function ForceField.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function ForceField.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function ForceField.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function ForceField.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function ForceField.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function ForceField.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function ForceField.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function ForceField.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function ForceField.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function ForceField.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function ForceField.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function ForceField.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function ForceField.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function ForceField.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function ForceField.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function ForceField.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function ForceField.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function ForceField.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function ForceField.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function ForceField.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function ForceField.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function ForceField.getSignalOut(plug) end

--- Deploys the forcefield
function ForceField.deploy() end

---@deprecated ForceField.activate() is deprecated, use ForceField.deploy() instead.
function ForceField.activate() end

--- Retracts the forcefield
function ForceField.retract() end

---@deprecated ForceField.deactivate() is deprecated, use ForceField.retract() instead.
function ForceField.deactivate() end

--- Checks if the forcefield is deployed
---@return boolean True if the forcefield is deployed, false otherwise
function ForceField.isDeployed() end

---@deprecated ForceField.getState() is deprecated, use ForceField.isDeployed() instead.
function ForceField.getState() end

--- Toggle the forcefield
function ForceField.toggle() end

--- Returns the current length of the forcefield
---@return number The current length of the forcefield
function ForceField.getCurrentLength() end

--- Returns the maximum length of the forcefield
---@return number The maximum length of the forcefield (between 0 and the limit of the forcefield model)
function ForceField.getMaxLength() end

--- Sets the max length of the forcefield
---@param maxLength integer Maximum length (between 0 and the length limit)
---@return boolean True if the maximum length was set, false if an error occurred
function ForceField.setMaxLength(maxLength) end

--- Returns the length limit of this forcefield model
---@return number The length limit of this forcefield model
function ForceField.getLengthLimit() end


---@class FueledEngine
local FueledEngine = {}
--- Show the element widget in the in-game widget stack
function FueledEngine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function FueledEngine.show() end

--- Hide the element widget in the in-game widget stack
function FueledEngine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function FueledEngine.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function FueledEngine.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function FueledEngine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function FueledEngine.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function FueledEngine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function FueledEngine.getDataId() end

--- Returns the element name
---@return string The element's name
function FueledEngine.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function FueledEngine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function FueledEngine.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function FueledEngine.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function FueledEngine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function FueledEngine.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function FueledEngine.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function FueledEngine.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function FueledEngine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function FueledEngine.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function FueledEngine.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function FueledEngine.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function FueledEngine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function FueledEngine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function FueledEngine.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function FueledEngine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function FueledEngine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function FueledEngine.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function FueledEngine.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function FueledEngine.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function FueledEngine.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function FueledEngine.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function FueledEngine.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function FueledEngine.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function FueledEngine.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function FueledEngine.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function FueledEngine.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function FueledEngine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function FueledEngine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number The obstruction ratio of the engine
function FueledEngine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string Tags of the engine, in a CSV string
function FueledEngine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean True to ignore the default engine tags
---@return boolean True if the tags have been applied, false if they have not
function FueledEngine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return boolean True if the engine ignores default engine tags, false if not
function FueledEngine.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function FueledEngine.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function FueledEngine.deactivate() end

--- Checks if the engine is active
---@return boolean True if the engine is on, false otherwise
function FueledEngine.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function FueledEngine.getState() end

--- Toggle the state of the engine
function FueledEngine.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function FueledEngine.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number The thrust of the engine is currently delivering in newtons
function FueledEngine.getThrust() end

---@deprecated FueledEngine.getMaxThrust() is deprecated, use FueledEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function FueledEngine.getMaxThrust() end

---@deprecated FueledEngine.getMaxThrustBase() is deprecated, use FueledEngine.getMaxThrust().
function FueledEngine.getMaxThrustBase() end

--- Returns the minimal thrust the engine can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number The current minimal engine thrust in newtons
function FueledEngine.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function FueledEngine.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number The current maximum engine thrust in newtons
function FueledEngine.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number Usually 1 but can be lower for certain engines
function FueledEngine.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return boolean True if the torque is enabled on the engine, false otherwise
function FueledEngine.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function FueledEngine.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table The engine thrust direction vector in construct local coordinates
function FueledEngine.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table The torque axis vector in construct local coordinates
function FueledEngine.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table The engine thrust direction vector in world coordinates
function FueledEngine.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function FueledEngine.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table The torque axis vector in world coordinates
function FueledEngine.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function FueledEngine.torqueAxis() end

--- Checks if the engine out of fuel
---@return boolean True if the engine is out of fuel, false otherwise
function FueledEngine.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer The item ID of the fuel currently used
function FueledEngine.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer The local ID of the fueltank
function FueledEngine.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return boolean True if the linked tank is functional, false otherwise
function FueledEngine.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function FueledEngine.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number The current rate of fuel consumption in m³/(N.s)
function FueledEngine.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number Usually 1 but can be higher for certain engines at certain speeds
function FueledEngine.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number The rate of fuel consumption in m3/s
function FueledEngine.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number The time to half thrust in seconds
function FueledEngine.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function FueledEngine.getT50() end


---@class Gyro
local Gyro = {}
--- Show the element widget in the in-game widget stack
function Gyro.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Gyro.show() end

--- Hide the element widget in the in-game widget stack
function Gyro.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Gyro.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Gyro.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Gyro.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Gyro.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Gyro.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Gyro.getDataId() end

--- Returns the element name
---@return string The element's name
function Gyro.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Gyro.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Gyro.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Gyro.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Gyro.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Gyro.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Gyro.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Gyro.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Gyro.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Gyro.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Gyro.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Gyro.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Gyro.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Gyro.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Gyro.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Gyro.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Gyro.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Gyro.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Gyro.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Gyro.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Gyro.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Gyro.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Gyro.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Gyro.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Gyro.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Gyro.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Gyro.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Gyro.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Gyro.getSignalOut(plug) end

--- Selects this gyro as the main gyro used for ship orientation
function Gyro.activate() end

--- Deselects this gyro as the main gyro used for ship orientation, using the Core Unit instead
function Gyro.deactivate() end

--- Toggle the activation state of the gyro
function Gyro.toggle() end

--- Returns the activation state of the gyro
---@return boolean True if the gyro is the active ship orientation unit, false otherwise
function Gyro.isActive() end

---@deprecated Gyro.getState() is deprecated, use Gyro.isActive() instead.
function Gyro.getState() end

--- The pitch value relative to the gyro orientation and the local gravity
---@return number The pitch angle in degrees, relative to the gyro orientation and the local gravity
function Gyro.getPitch() end

--- The roll value relative to the gyro orientation and the local gravity
---@return number The roll angle in degrees, relative to the gyro orientation and the local gravity
function Gyro.getRoll() end

---@deprecated Gyro.localUp() is deprecated, use Gyro.getUp() instead.
function Gyro.localUp() end

---@deprecated Gyro.localForward() is deprecated, use Gyro.getForward() instead.
function Gyro.localForward() end

---@deprecated Gyro.localRight() is deprecated, use Gyro.getRight() instead.
function Gyro.localRight() end

---@deprecated Gyro.worldUp() is deprecated, use Gyro.getWorldUp() instead.
function Gyro.worldUp() end

---@deprecated Gyro.worldForward() is deprecated, use Gyro.getWorldForward() instead.
function Gyro.worldForward() end

---@deprecated Gyro.worldRight() is deprecated, use Gyro.getWorldRight() instead.
function Gyro.worldRight() end


---@class HoverEngine
local HoverEngine = {}
--- Show the element widget in the in-game widget stack
function HoverEngine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function HoverEngine.show() end

--- Hide the element widget in the in-game widget stack
function HoverEngine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function HoverEngine.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function HoverEngine.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function HoverEngine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function HoverEngine.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function HoverEngine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function HoverEngine.getDataId() end

--- Returns the element name
---@return string The element's name
function HoverEngine.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function HoverEngine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function HoverEngine.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function HoverEngine.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function HoverEngine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function HoverEngine.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function HoverEngine.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function HoverEngine.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function HoverEngine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function HoverEngine.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function HoverEngine.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function HoverEngine.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function HoverEngine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function HoverEngine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function HoverEngine.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function HoverEngine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function HoverEngine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function HoverEngine.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function HoverEngine.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function HoverEngine.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function HoverEngine.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function HoverEngine.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function HoverEngine.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function HoverEngine.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function HoverEngine.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function HoverEngine.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function HoverEngine.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function HoverEngine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function HoverEngine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number The obstruction ratio of the engine
function HoverEngine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string Tags of the engine, in a CSV string
function HoverEngine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean True to ignore the default engine tags
---@return boolean True if the tags have been applied, false if they have not
function HoverEngine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return boolean True if the engine ignores default engine tags, false if not
function HoverEngine.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function HoverEngine.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function HoverEngine.deactivate() end

--- Checks if the engine is active
---@return boolean True if the engine is on, false otherwise
function HoverEngine.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function HoverEngine.getState() end

--- Toggle the state of the engine
function HoverEngine.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function HoverEngine.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number The thrust of the engine is currently delivering in newtons
function HoverEngine.getThrust() end

---@deprecated FueledEngine.getMaxThrust() is deprecated, use FueledEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function HoverEngine.getMaxThrust() end

---@deprecated FueledEngine.getMaxThrustBase() is deprecated, use FueledEngine.getMaxThrust().
function HoverEngine.getMaxThrustBase() end

--- Returns the minimal thrust the engine can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number The current minimal engine thrust in newtons
function HoverEngine.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function HoverEngine.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number The current maximum engine thrust in newtons
function HoverEngine.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number Usually 1 but can be lower for certain engines
function HoverEngine.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return boolean True if the torque is enabled on the engine, false otherwise
function HoverEngine.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function HoverEngine.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table The engine thrust direction vector in construct local coordinates
function HoverEngine.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table The torque axis vector in construct local coordinates
function HoverEngine.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table The engine thrust direction vector in world coordinates
function HoverEngine.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function HoverEngine.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table The torque axis vector in world coordinates
function HoverEngine.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function HoverEngine.torqueAxis() end

--- Checks if the engine out of fuel
---@return boolean True if the engine is out of fuel, false otherwise
function HoverEngine.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer The item ID of the fuel currently used
function HoverEngine.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer The local ID of the fueltank
function HoverEngine.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return boolean True if the linked tank is functional, false otherwise
function HoverEngine.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function HoverEngine.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number The current rate of fuel consumption in m³/(N.s)
function HoverEngine.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number Usually 1 but can be higher for certain engines at certain speeds
function HoverEngine.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number The rate of fuel consumption in m3/s
function HoverEngine.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number The time to half thrust in seconds
function HoverEngine.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function HoverEngine.getT50() end

--- Returns the distance to the first object detected in the direction of the thrust
---@return number The distance to the first obstacle in meters
function HoverEngine.getDistance() end

--- Returns the maximum functional distance from the ground
---@return number The maximum functional distance in meters
function HoverEngine.getMaxDistance() end


---@class Industry
local Industry = {}
--- Show the element widget in the in-game widget stack
function Industry.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Industry.show() end

--- Hide the element widget in the in-game widget stack
function Industry.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Industry.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Industry.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Industry.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Industry.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Industry.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Industry.getDataId() end

--- Returns the element name
---@return string The element's name
function Industry.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Industry.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Industry.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Industry.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Industry.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Industry.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Industry.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Industry.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Industry.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Industry.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Industry.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Industry.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Industry.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Industry.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Industry.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Industry.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Industry.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Industry.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Industry.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Industry.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Industry.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Industry.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Industry.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Industry.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Industry.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Industry.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Industry.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Industry.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Industry.getSignalOut(plug) end

--- Start the production, and it will run unless it is stopped or the input resources run out
function Industry.startRun() end

---@deprecated Industry.start() is deprecated, use Industry.startRun() instead.
function Industry.start() end

--- Start maintaining the specified quantity. Resumes production when the quantity in the output Container is too low, and pauses production when it is equal or higher
---@param quantity integer Quantity to maintain inside output containers
function Industry.startMaintain(quantity) end

---@deprecated Industry.startAndMaintain(quantity) is deprecated, use Industry.startMaintain(quantity) instead.
function Industry.startAndMaintain() end

--- Start the production of numBatches and then stop
---@param numBatches integer Number of batches to run before unit stops
function Industry.startFor(numBatches) end

---@deprecated Industry.batchStart(quantity) is deprecated, use Industry.startFor(numBatches) instead.
function Industry.batchStart() end

--- Stop the production of the industry unit
---@param force boolean (optional by default false) True if you want to force the production to stop immediately
---@param allowLoss boolean (optional by default false) True if you want to allow the industry unit to lose components when recovering in use components
function Industry.stop(force, allowLoss) end

---@deprecated Industry.hardStop(allowLoss) is deprecated, use Industry.stop(true,allowLoss) instead.
function Industry.hardStop() end

---@deprecated Industry.softStop() is deprecated, use Industry.stop(false,false) instead.
function Industry.softStop() end

--- Get the current running state of the industry
---@return integer (Stopped = 1, Running = 2, Jammed missing ingredient = 3, Jammed output full = 4, Jammed no output container = 5, Pending = 6, Jammed missing schematics = 7)
function Industry.getState() end

---@deprecated Industry.getStatus() is deprecated, use Industry.getState() instead.
function Industry.getStatus() end

--- Returns the complete information of the industry
---@return integer The complete state of the industry, a table with fields {[int] state, [bool] stopRequested, [int] schematicId (deprecated = 0), [int] schematicsRemaining (deprecated = 0), [table] requiredSchematicIds {[int] id}, [int] requiredSchematicAmount, [int] unitsProduced, [int] remainingTime, [int] batchesRequested, [int] batchesRemaining, [float] maintainProductAmount, [int] currentProductAmount, [table] currentProducts:{{[int] id, [double] quantity},...}}
function Industry.getInfo() end

--- Get the count of completed cycles since the player started the unit
---@return integer The count of completed cycles since startup
function Industry.getCyclesCompleted() end

---@deprecated Industry.getCycleCountSinceStartup() is deprecated, use Industry.getCyclesCompleted() instead.
function Industry.getCycleCountSinceStartup() end

--- Returns the efficiency of the industry
---@return number The efficiency rate between 0 and 1
function Industry.getEfficiency() end

--- Returns the time elapsed in seconds since the player started the unit for the latest time
---@return number The time elapsed in seconds
function Industry.getUptime() end

--- Returns the list of items required to run the selected output product.
---@return table Returns the list of products
function Industry.getInputs() end

--- Returns the list of item ids of the currently required schematics. Empty if there are no required schematic.
---@return table the list of item ids of the currently required schematics
function Industry.getRequiredSchematicIds() end

--- Returns the list of id of the items currently produced.
---@return table The first entry in the table is always the main product produced
function Industry.getOutputs() end

---@deprecated Industry.getCurrentSchematic() is deprecated.
function Industry.getCurrentSchematic() end

--- Set the item to produce from its id
---@param itemId integer The item id of the item to produce
---@return integer The result of the operation 0 for a sucess, -1 if the industry is running
function Industry.setOutput(itemId) end

---@deprecated Industry.setCurrentSchematic(id) is deprecated, use Industry.setOutput(itemId) instead.
function Industry.setCurrentSchematic() end

--- Send a request to get an update of the content of the schematic bank, limited to one call allowed per 30 seconds
---@return number If the request is not yet possible, returns the remaining time to wait for
function Industry.updateBank() end

--- Returns a table describing the contents of the schematic bank, as a pair itemId and quantity per slot
---@return table The content of the schematic bank as a table with fields {[int] id, [float] quantity} per slot
function Industry.getBank() end

--- Emitted when the Industry Unit has started a new production process
---@param id integer The product item id
---@param quantity number The product quantity
---@type Event
Industry.onStarted = Event:new()

--- Emitted when the Industry Unit has completed a run
---@param id integer The product item id
---@param quantity number The product quantity
---@type Event
Industry.onCompleted = Event:new()

---@type Event
Industry.completed = Event:new()

--- Emitted when the industry status has changed
---@param status integer The status of the industry can be (Stopped = 1, Running = 2, Jammed missing ingredient = 3, Jammed output full = 4, Jammed no output container = 5, Pending = 6)
---@type Event
Industry.onStatusChanged = Event:new()

---@type Event
Industry.statusChanged = Event:new()

--- Emitted when the schematic bank content is updated(bank update or after a manual request made with updateBank())
---@type Event
Industry.onBankUpdate = Event:new()


---@class LandingGear
local LandingGear = {}
--- Show the element widget in the in-game widget stack
function LandingGear.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function LandingGear.show() end

--- Hide the element widget in the in-game widget stack
function LandingGear.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function LandingGear.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function LandingGear.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function LandingGear.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function LandingGear.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function LandingGear.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function LandingGear.getDataId() end

--- Returns the element name
---@return string The element's name
function LandingGear.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function LandingGear.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function LandingGear.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function LandingGear.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function LandingGear.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function LandingGear.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function LandingGear.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function LandingGear.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function LandingGear.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function LandingGear.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function LandingGear.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function LandingGear.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function LandingGear.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function LandingGear.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function LandingGear.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function LandingGear.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function LandingGear.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function LandingGear.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function LandingGear.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function LandingGear.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function LandingGear.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function LandingGear.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function LandingGear.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function LandingGear.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function LandingGear.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function LandingGear.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function LandingGear.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function LandingGear.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function LandingGear.getSignalOut(plug) end

--- Deploys the landing gear
function LandingGear.deploy() end

---@deprecated LandingGear.activate() is deprecated, use LandingGear.deploy() instead.
function LandingGear.activate() end

--- Retracts the landing gear
function LandingGear.retract() end

---@deprecated LandingGear.deactivate() is deprecated, use LandingGear.retract() instead.
function LandingGear.deactivate() end

--- Checks if the landing gear is deployed
---@return boolean True if the landing gear is deployed, false otherwise
function LandingGear.isDeployed() end

---@deprecated LandingGear.getState() is deprecated, use LandingGear.isDeployed() instead.
function LandingGear.getState() end

--- Toggle the landing gear
function LandingGear.toggle() end


---@class LaserDetector
local LaserDetector = {}
--- Show the element widget in the in-game widget stack
function LaserDetector.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function LaserDetector.show() end

--- Hide the element widget in the in-game widget stack
function LaserDetector.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function LaserDetector.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function LaserDetector.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function LaserDetector.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function LaserDetector.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function LaserDetector.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function LaserDetector.getDataId() end

--- Returns the element name
---@return string The element's name
function LaserDetector.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function LaserDetector.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function LaserDetector.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function LaserDetector.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function LaserDetector.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function LaserDetector.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function LaserDetector.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function LaserDetector.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function LaserDetector.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function LaserDetector.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function LaserDetector.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function LaserDetector.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function LaserDetector.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function LaserDetector.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function LaserDetector.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function LaserDetector.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function LaserDetector.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function LaserDetector.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function LaserDetector.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function LaserDetector.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function LaserDetector.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function LaserDetector.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function LaserDetector.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function LaserDetector.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function LaserDetector.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function LaserDetector.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function LaserDetector.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function LaserDetector.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function LaserDetector.getSignalOut(plug) end

--- Checks if any laser is hitting the detector
---@return boolean True if a laser is hitting the detector, false otherwise
function LaserDetector.isHit() end

---@deprecated LaserDetector.getState() is deprecated, use LaserDetector.isHit() instead.
function LaserDetector.getState() end

--- Emitted when a laser hit the detector
---@type Event
LaserDetector.onHit = Event:new()

---@type Event
LaserDetector.laserHit = Event:new()

--- Emitted when all lasers stop hitting the detector
---@type Event
LaserDetector.onLoss = Event:new()

---@type Event
LaserDetector.laserRelease = Event:new()


---@class LaserEmitter
local LaserEmitter = {}
--- Show the element widget in the in-game widget stack
function LaserEmitter.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function LaserEmitter.show() end

--- Hide the element widget in the in-game widget stack
function LaserEmitter.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function LaserEmitter.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function LaserEmitter.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function LaserEmitter.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function LaserEmitter.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function LaserEmitter.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function LaserEmitter.getDataId() end

--- Returns the element name
---@return string The element's name
function LaserEmitter.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function LaserEmitter.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function LaserEmitter.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function LaserEmitter.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function LaserEmitter.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function LaserEmitter.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function LaserEmitter.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function LaserEmitter.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function LaserEmitter.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function LaserEmitter.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function LaserEmitter.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function LaserEmitter.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function LaserEmitter.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function LaserEmitter.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function LaserEmitter.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function LaserEmitter.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function LaserEmitter.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function LaserEmitter.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function LaserEmitter.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function LaserEmitter.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function LaserEmitter.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function LaserEmitter.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function LaserEmitter.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function LaserEmitter.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function LaserEmitter.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function LaserEmitter.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function LaserEmitter.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function LaserEmitter.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function LaserEmitter.getSignalOut(plug) end

--- Activates the laser emitter
function LaserEmitter.activate() end

--- Deactivates the laser emitter
function LaserEmitter.deactivate() end

--- Toggle the laser emitter
function LaserEmitter.toggle() end

--- Checks if the laser emitter is active
---@return boolean True if the laser emitter is active, false otherwise
function LaserEmitter.isActive() end

---@deprecated LaserEmitter.getState() is deprecated, use LaserEmitter.isActive() instead.
function LaserEmitter.getState() end


---@class Library
local Library = {}
--- Solve the 3D linear system M*x=c0 where M is defined by its column vectors c1,c2,c3
---@param c1 table The first column of the matrix M
---@param c2 table The second column of the matrix M
---@param c3 table The third column of the matrix M
---@param c0 table The target column vector of the system
---@return table The vec3 solution of the above system
function Library.systemResolution3(c1, c2, c3, c0) end

--- Solve the 2D linear system M*x=c0 where M is defined by its column vectors c1,c2
---@param c1 table The first column of the matrix M
---@param c2 table The second column of the matrix M
---@param c0 table The target column vector of the system
---@return table The vec2 solution of the above system
function Library.systemResolution2(c1, c2, c0) end

--- Returns the position of the given point in world coordinates system, on the game screen
---@param worldPos table: The world position of the point
---@return table The position in percentage (between 0 and 1) of the screen resolution as vec3 with {x, y, depth}
function Library.getPointOnScreen(worldPos) end


---@class Light
local Light = {}
--- Show the element widget in the in-game widget stack
function Light.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Light.show() end

--- Hide the element widget in the in-game widget stack
function Light.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Light.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Light.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Light.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Light.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Light.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Light.getDataId() end

--- Returns the element name
---@return string The element's name
function Light.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Light.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Light.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Light.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Light.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Light.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Light.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Light.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Light.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Light.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Light.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Light.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Light.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Light.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Light.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Light.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Light.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Light.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Light.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Light.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Light.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Light.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Light.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Light.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Light.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Light.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Light.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Light.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Light.getSignalOut(plug) end

--- Switches the light on
function Light.activate() end

--- Switches the light off
function Light.deactivate() end

--- Checks if the light is on
---@return boolean True if the light is on, false otherwise
function Light.isActive() end

---@deprecated Light.getState() is deprecated, use Light.isActive() instead.
function Light.getState() end

--- Toggle the state of the light
function Light.toggle() end

--- Set the light color in RGB. Lights can use HDR color values above 1.0 to glow.
---@param r number The red component, between 0.0 and 1.0, up to 5.0 for HDR colors.
---@param g number The green component, between 0.0 and 1.0, up to 5.0 for HDR colors.
---@param b number The blue component, between 0.0 and 1.0, up to 5.0 for HDR colors.
function Light.setColor(r, g, b) end

---@deprecated Light.setRGBColor(r,g,b) is deprecated, use Light.setColor(r,g,b) instead.
function Light.setRGBColor() end

--- Returns the light color in RGB
---@return table  An array of number for the red, blue and green components of the light, with values between 0.0 and 1.0, up to 5.0.
function Light.getColor() end

---@deprecated Light.getRGBColor() is deprecated, use Light.getColor() instead.
function Light.getRGBColor() end

--- Returns the blinking state of the light
---@param state boolean True to enable light blinking
function Light.setBlinkingState(state) end

--- Checks if the light blinking is enabled
---@return boolean True if the light blinking is enabled, false otherwise
function Light.isBlinking() end

--- Returns the light 'on' blinking duration
---@return number The duration of the 'on' blinking in seconds
function Light.getOnBlinkingDuration() end

--- Set the light 'on' blinking duration
---@param time number The duration of the 'on' blinking in seconds
function Light.setOnBlinkingDuration(time) end

--- Returns the light 'off' blinking duration
---@return number The duration of the 'off' blinking in seconds
function Light.getOffBlinkingDuration() end

--- Set the light 'off' blinking duration
---@param time number The duration of the 'off' blinking in seconds
function Light.setOffBlinkingDuration(time) end

--- Returns the light blinking time shift
---@return number The time shift of the blinking in seconds
function Light.getBlinkingTimeShift() end

--- Set the light blinking time shift
---@param shift number The time shift of the blinking in seconds
function Light.setBlinkingTimeShift(shift) end


---@class ManualButton
local ManualButton = {}
--- Show the element widget in the in-game widget stack
function ManualButton.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function ManualButton.show() end

--- Hide the element widget in the in-game widget stack
function ManualButton.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function ManualButton.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function ManualButton.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function ManualButton.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function ManualButton.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function ManualButton.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function ManualButton.getDataId() end

--- Returns the element name
---@return string The element's name
function ManualButton.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function ManualButton.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function ManualButton.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function ManualButton.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function ManualButton.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function ManualButton.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function ManualButton.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function ManualButton.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function ManualButton.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function ManualButton.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function ManualButton.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function ManualButton.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function ManualButton.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function ManualButton.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function ManualButton.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function ManualButton.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function ManualButton.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function ManualButton.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function ManualButton.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function ManualButton.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function ManualButton.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function ManualButton.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function ManualButton.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function ManualButton.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function ManualButton.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function ManualButton.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function ManualButton.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function ManualButton.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function ManualButton.getSignalOut(plug) end

--- Checks if the manual button is down
---@return boolean True if the manual button is down, false otherwise
function ManualButton.isDown() end

---@deprecated ManualButton.getState() is deprecated, use ManualButton.isDown() instead.
function ManualButton.getState() end

--- Emitted when the button is pressed
---@type Event
ManualButton.onPressed = Event:new()

---@type Event
ManualButton.pressed = Event:new()

--- Emitted when the button is released
---@type Event
ManualButton.onReleased = Event:new()

---@type Event
ManualButton.released = Event:new()


---@class ManualSwitch
local ManualSwitch = {}
--- Show the element widget in the in-game widget stack
function ManualSwitch.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function ManualSwitch.show() end

--- Hide the element widget in the in-game widget stack
function ManualSwitch.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function ManualSwitch.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function ManualSwitch.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function ManualSwitch.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function ManualSwitch.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function ManualSwitch.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function ManualSwitch.getDataId() end

--- Returns the element name
---@return string The element's name
function ManualSwitch.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function ManualSwitch.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function ManualSwitch.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function ManualSwitch.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function ManualSwitch.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function ManualSwitch.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function ManualSwitch.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function ManualSwitch.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function ManualSwitch.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function ManualSwitch.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function ManualSwitch.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function ManualSwitch.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function ManualSwitch.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function ManualSwitch.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function ManualSwitch.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function ManualSwitch.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function ManualSwitch.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function ManualSwitch.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function ManualSwitch.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function ManualSwitch.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function ManualSwitch.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function ManualSwitch.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function ManualSwitch.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function ManualSwitch.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function ManualSwitch.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function ManualSwitch.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function ManualSwitch.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function ManualSwitch.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function ManualSwitch.getSignalOut(plug) end

--- Switches the switch on
function ManualSwitch.activate() end

--- Switches the switch off
function ManualSwitch.deactivate() end

--- Toggle the switch
function ManualSwitch.toggle() end

--- Checks if the switch is active
---@return boolean True if the switch is active, false otherwise
function ManualSwitch.isActive() end

---@deprecated ManualSwitch.getState() is deprecated, use ManualSwitch.isActive() instead.
function ManualSwitch.getState() end

--- Emitted when the button is pressed
---@type Event
ManualSwitch.onPressed = Event:new()

---@type Event
ManualSwitch.pressed = Event:new()

--- Emitted when the button is released
---@type Event
ManualSwitch.onReleased = Event:new()

---@type Event
ManualSwitch.released = Event:new()


---@class MiningUnit
local MiningUnit = {}
--- Show the element widget in the in-game widget stack
function MiningUnit.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function MiningUnit.show() end

--- Hide the element widget in the in-game widget stack
function MiningUnit.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function MiningUnit.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function MiningUnit.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function MiningUnit.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function MiningUnit.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function MiningUnit.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function MiningUnit.getDataId() end

--- Returns the element name
---@return string The element's name
function MiningUnit.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function MiningUnit.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function MiningUnit.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function MiningUnit.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function MiningUnit.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function MiningUnit.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function MiningUnit.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function MiningUnit.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function MiningUnit.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function MiningUnit.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function MiningUnit.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function MiningUnit.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function MiningUnit.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function MiningUnit.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function MiningUnit.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function MiningUnit.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function MiningUnit.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function MiningUnit.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function MiningUnit.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function MiningUnit.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function MiningUnit.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function MiningUnit.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function MiningUnit.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function MiningUnit.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function MiningUnit.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function MiningUnit.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function MiningUnit.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function MiningUnit.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function MiningUnit.getSignalOut(plug) end

--- Returns the current state of the mining unit
---@return integer The status of the mining unit can be (Stopped = 1, Running = 2, Jammed output full = 3, Jammed no output container = 4)
function MiningUnit.getState() end

---@deprecated MiningUnit.getStatus() is deprecated, use MiningUnit.getState() instead.
function MiningUnit.getStatus() end

--- Returns the remaining time of the current batch extraction process.
---@return number The remaining time in seconds
function MiningUnit.getRemainingTime() end

--- Returns the item ID of the currently selected ore.
---@return integer The item ID of the selected ore
function MiningUnit.getActiveOre() end

--- Returns the list of available ore pools
---@return table A list of tables composed with {[int] oreId, [float] available, [float] maximum}
function MiningUnit.getOrePools() end

--- Returns the base production rate of the mining unit.
---@return number The production rate in L/h
function MiningUnit.getBaseRate() end

--- Returns the efficiency rate of the mining unit.
---@return number The efficiency rate between 0 and 1
function MiningUnit.getEfficiency() end

--- Returns the calibration rate of the mining unit.
---@return number The calibration rate of the mining unit between 0 and 1
function MiningUnit.getCalibrationRate() end

--- Returns the optimal calibration rate of the mining unit.
---@return number The optimal calibration rate of the mining unit between 0 and 1
function MiningUnit.getOptimalRate() end

--- Returns the current production rate of the mining unit.
---@return number The production rate in L/h
function MiningUnit.getProductionRate() end

--- Returns the territory's adjacency bonus to the territory of the mining unit. Note: This value is updated only when a new batch is started.
---@return number The territory's adjacency bonus
function MiningUnit.getAdjacencyBonus() end

--- Returns the position of the last calibration excavation, in world coordinates.
---@return table The coordinates in world coordinates
function MiningUnit.getLastExtractionPosition() end

--- Returns the ID of the last player who calibrated the mining unit.
---@return integer The ID of the player
function MiningUnit.getLastExtractingPlayerId() end

--- Returns the time in seconds since the last calibration of the mining unit.
---@return number The time in seconds with milliseconds precision
function MiningUnit.getLastExtractionTime() end

--- Returns the item ID of the ore extracted during the last calibration excavation.
---@return integer The item ID of the extracted ore
function MiningUnit.getLastExtractedOre() end

--- Returns the volume of ore extracted during the last calibration excavation.
---@return number The volume of ore extracted in L
function MiningUnit.getLastExtractedVolume() end

--- Emitted when the mining unit is calibrated.
---@param oreId integer The item ID of the ore extracted during the calibration process
---@param amount number Amount of ore extracted during the calibration process
---@param rate number The new calibration rate after calibration process
---@type Event
MiningUnit.onCalibrated = Event:new()

---@type Event
MiningUnit.calibrated = Event:new()

--- Emitted when the mining unit started a new extraction process.
---@param oreId number The item ID of the ore mined during the extraction process
---@type Event
MiningUnit.onStarted = Event:new()

--- Emitted when the mining unit complete a batch.
---@param oreId number The item ID of the ore mined during the extraction process
---@param amount number Amount of ore mined
---@type Event
MiningUnit.onCompleted = Event:new()

---@type Event
MiningUnit.completed = Event:new()

--- Emitted when the mining unit status is changed.
---@param status integer The status of the mining unit can be (Stopped = 1, Running = 2, Jammed output full = 3, Jammed no output container = 4)
---@type Event
MiningUnit.onStatusChanged = Event:new()

---@type Event
MiningUnit.statusChanged = Event:new()

--- Emitted when the mining unit stopped the extraction process.
---@type Event
MiningUnit.onStopped = Event:new()


---@class PlasmaExtractor
local PlasmaExtractor = {}
--- Show the element widget in the in-game widget stack
function PlasmaExtractor.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function PlasmaExtractor.show() end

--- Hide the element widget in the in-game widget stack
function PlasmaExtractor.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function PlasmaExtractor.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function PlasmaExtractor.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function PlasmaExtractor.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function PlasmaExtractor.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function PlasmaExtractor.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function PlasmaExtractor.getDataId() end

--- Returns the element name
---@return string The element's name
function PlasmaExtractor.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function PlasmaExtractor.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function PlasmaExtractor.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function PlasmaExtractor.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function PlasmaExtractor.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function PlasmaExtractor.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function PlasmaExtractor.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function PlasmaExtractor.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function PlasmaExtractor.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function PlasmaExtractor.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function PlasmaExtractor.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function PlasmaExtractor.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function PlasmaExtractor.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function PlasmaExtractor.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function PlasmaExtractor.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function PlasmaExtractor.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function PlasmaExtractor.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function PlasmaExtractor.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function PlasmaExtractor.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function PlasmaExtractor.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function PlasmaExtractor.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function PlasmaExtractor.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function PlasmaExtractor.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function PlasmaExtractor.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function PlasmaExtractor.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function PlasmaExtractor.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function PlasmaExtractor.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function PlasmaExtractor.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function PlasmaExtractor.getSignalOut(plug) end

--- Returns the current status of the plasma extractor
---@return integer The status of the plasma extractor can be (Stopped = 1, Running = 2, Jammed output full = 3, Jammed no output container = 4)
function PlasmaExtractor.getStatus() end

--- Returns the remaining time of the current batch extraction process.
---@return number The remaining time in seconds
function PlasmaExtractor.getRemainingTime() end

--- Returns the list of available plasma pools
---@return table A list of tables composed with {[int] oreId, [int] quantity};
function PlasmaExtractor.getPlasmaPools() end

--- Emitted when the plasma extractor started a new extraction process
---@type Event
PlasmaExtractor.onStarted = Event:new()

--- Emitted when the plasma extractor complete a batch
---@type Event
PlasmaExtractor.onCompleted = Event:new()

--- Emitted when the plasma extractor status is changed
---@param status integer The status of the plasma extractor can be (Stopped = 1, Running = 2, Jammed output full = 3, Jammed no output container = 4)
---@type Event
PlasmaExtractor.onStatusChanged = Event:new()

--- Emitted when the plasma extractor stopped the extraction process
---@type Event
PlasmaExtractor.onStopped = Event:new()


---@class Player
local Player = {}
--- Returns the player name
---@return string The player name
function Player.getName() end

--- Return the ID of the player
---@return integer The ID of the player
function Player.getId() end

--- Returns the player mass
---@return number The mass of the player in kilograms
function Player.getMass() end

--- Returns the player's nanopack content mass
---@return number The player's nanopack content mass in kilograms
function Player.getNanopackMass() end

--- Returns the player's nanopack content volume
---@return number The player's nanopack content volume in liters
function Player.getNanopackVolume() end

--- Returns the player's nanopack maximum volume
---@return number The player's nanopack maximum volume in liters
function Player.getNanopackMaxVolume() end

--- Returns the list of organization IDs of the player
---@return table The list of organization IDs
function Player.getOrgIds() end

--- Returns the position of the player, in construct local coordinates
---@return table The position in construct local coordinates
function Player.getPosition() end

--- Returns the position of the player, in world coordinates
---@return table The position in world coordinates
function Player.getWorldPosition() end

--- Returns the position of the head of the player's character, in construct local coordinates
---@return table The position of the head in construct local coordinates
function Player.getHeadPosition() end

--- Returns the position of the head of the player's character, in world coordinates
---@return table The position of the head in world coordinates
function Player.getWorldHeadPosition() end

--- Returns the velocity vector of the player, in construct local coordinates
---@return table The velocity vector in construct local coordinates
function Player.getVelocity() end

--- Returns the velocity vector of the player, in world coordinates
---@return table The velocity vector in world coordinates
function Player.getWorldVelocity() end

--- Returns the absolute velocity vector of the player, in world coordinates
---@return table The velocity absolute vector in world coordinates
function Player.getAbsoluteVelocity() end

--- Returns the forward direction vector of the player, in construct local coordinates
---@return table The forward direction vector in construct local coordinates
function Player.getForward() end

--- Returns the right direction vector of the player, in construct local coordinates
---@return table The right direction vector in construct local coordinates
function Player.getRight() end

--- Returns the up direction vector of the player, in construct local coordinates
---@return table The up direction vector in construct local coordinates
function Player.getUp() end

--- Returns the forward direction vector of the player, in world coordinates
---@return table The forward direction vector in world coordinates
function Player.getWorldForward() end

--- Returns the right direction vector of the player, in world coordinates
---@return table The right direction vector in world coordinates
function Player.getWorldRight() end

--- Returns the up direction vector of the player, in world coordinates
---@return table The up direction vector in world coordinates
function Player.getWorldUp() end

--- Returns the id of the planet the player is located on
---@return integer The id of the planet, 0 if none
function Player.getPlanet() end

--- Returns the identifier of the construct to which the player is parented
---@return integer The id of the construct, 0 if none
function Player.getParent() end

--- Checks if the player is seated
---@return boolean True if the player is seated, false otherwise
function Player.isSeated() end

--- Returns the local id of the seat on which the player is sitting
---@return integer The local id of the seat, or 0 is not seated
function Player.getSeatId() end

--- Checks if the player is parented to the given construct
---@param id integer The construct id
---@return boolean True if the player is parented to the given construct, false otherwise
function Player.isParentedTo(id) end

--- Checks if the player is currently sprinting
---@return boolean True if the player is sprinting, false otherwise
function Player.isSprinting() end

--- Checks if the player's jetpack is on
---@return boolean True if the player's jetpack is on, false otherwise
function Player.isJetpackOn() end

--- Returns the state of the headlight of the player
---@return boolean True if the player has his headlight on, false otherwise
function Player.isHeadlightOn() end

--- Set the state of the headlight of the player
---@param state boolean True to turn on headlight
function Player.setHeadlightOn(state) end

--- Freezes the player movements, liberating the associated movement keys to be used by the script.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal)
---@param state boolean True to freeze the player, false to unfreeze
function Player.freeze(state) end

--- Checks if the player movements are frozen
---@return boolean True if the player is frozen, false otherwise
function Player.isFrozen() end

--- Checks if the player has DRM autorization to the control unit
---@return boolean True if the player has DRM autorization on the control unit, false otherwise
function Player.hasDRMAutorization() end

--- Emitted when the player parent change
---@param oldId integer The previous parent construct ID
---@param newId integer The new parent construct ID
---@type Event
Player.onParentChanged = Event:new()


---@class PressureTile
local PressureTile = {}
--- Show the element widget in the in-game widget stack
function PressureTile.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function PressureTile.show() end

--- Hide the element widget in the in-game widget stack
function PressureTile.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function PressureTile.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function PressureTile.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function PressureTile.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function PressureTile.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function PressureTile.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function PressureTile.getDataId() end

--- Returns the element name
---@return string The element's name
function PressureTile.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function PressureTile.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function PressureTile.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function PressureTile.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function PressureTile.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function PressureTile.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function PressureTile.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function PressureTile.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function PressureTile.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function PressureTile.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function PressureTile.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function PressureTile.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function PressureTile.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function PressureTile.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function PressureTile.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function PressureTile.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function PressureTile.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function PressureTile.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function PressureTile.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function PressureTile.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function PressureTile.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function PressureTile.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function PressureTile.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function PressureTile.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function PressureTile.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function PressureTile.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function PressureTile.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function PressureTile.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function PressureTile.getSignalOut(plug) end

--- Checks if the pressure tile is down
---@return boolean True when the tile is down, false otherwise
function PressureTile.isDown() end

---@deprecated PressureTile.getState() is deprecated, use PressureTile.isDown() instead.
function PressureTile.getState() end

--- Emitted when the pressure tile is pressed
---@type Event
PressureTile.onPressed = Event:new()

---@type Event
PressureTile.pressed = Event:new()

--- Emitter when the pressure tile is released
---@type Event
PressureTile.onReleased = Event:new()

---@type Event
PressureTile.released = Event:new()


---@class Radar
local Radar = {}
--- Show the element widget in the in-game widget stack
function Radar.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Radar.show() end

--- Hide the element widget in the in-game widget stack
function Radar.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Radar.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Radar.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Radar.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Radar.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Radar.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Radar.getDataId() end

--- Returns the element name
---@return string The element's name
function Radar.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Radar.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Radar.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Radar.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Radar.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Radar.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Radar.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Radar.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Radar.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Radar.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Radar.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Radar.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Radar.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Radar.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Radar.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Radar.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Radar.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Radar.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Radar.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Radar.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Radar.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Radar.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Radar.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Radar.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Radar.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Radar.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Radar.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Radar.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Radar.getSignalOut(plug) end

--- Checks if the radar is operational
---@return integer 1 if the radar is operational, otherwise: 0 = broken, -1 = bad environment, -2 = obstructed, -3 = already in use
function Radar.getOperationalState() end

---@deprecated Radar.isOperational() is deprecated, use Radar.getOperationalState() instead.
function Radar.isOperational() end

--- Returns the scan range of the radar
---@return number The scan range
function Radar.getRange() end

--- Returns ranges to identify a target based on its core size
---@return table The list of float values for ranges in meters as { xsRange, sRange, mRange, lRange }
function Radar.getIdentifyRanges() end

--- Returns the list of construct IDs in the scan range
---@return table The list of scanned construct IDs
function Radar.getConstructIds() end

--- Returns the sort method for construct data
---@return integer The sort method (Distance Ascending = 1, Distance Descending = 2, Size Ascending = 3, Size Descending = 4, Threat Ascending = 5, Threat Descending = 6)
function Radar.getSortMethod() end

--- Sets the sort method for construct data
---@param method integer The sort method (Distance Ascending = 1, Distance Descending = 2, Size Ascending = 3, Size Descending = 4, Threat Ascending = 5, Threat Descending = 6)
---@return boolean True if the sort method was set successfully, false otherwise
function Radar.setSortMethod(method) end

--- Returns the list of identified construct IDs
---@return table The list of identified construct IDs
function Radar.getIdentifiedConstructIds() end

--- Returns the list of constructs in a given range according to the current sort method
---@param offset integer Offset from the first entry
---@param size integer Total entries to return following the offset, 0 to return all entries
---@param filter table (optional) The filters to be applied as a table {[bool] isMatching, [int] constructKind, [string] coreSize, [bool] isAbandoned}
---@param isMatching boolean (optional) True to filter out constructs with a matching transponder, false otherwise
---@param constructKind integer (optional) The construct kind id to filter out constructs (Universe = 1, Planet = 2, Asteroid = 3, Static = 4, Dynamic = 5, Space = 6, Alien = 7)
---@param coreSize string (optional) The construct core unit size to filter out constructs ('XS', 'S', 'M', 'L', 'XL')
---@param isAbandoned boolean (optional) True to filter out abandoned constructs, false otherwise
---@return table The list of constructs tables {[integer] constructId, [string] name, [string] size, [string] constructType, [number] mass, [int] isIdentified, [int] inIdentifyRange, [number] identificationDuration, [number] remainingIdentificationTime, [int] myThreatStateToTarget, [int] targetThreatState, [number] distance, [table] worldPosition, [number] speed, [number] radialSpeed, [number] angularSpeed, [table] info}
function Radar.getConstructs(offset, size, filter, isMatching, constructKind, coreSize, isAbandoned) end

--- Returns the ID of the target construct
---@return integer The ID of the target construct
function Radar.getTargetId() end

--- Returns the distance to the given construct
---@param id integer The ID of the construct
---@return number The distance between the current and target construct center
function Radar.getConstructDistance(id) end

--- Returns 1 if the given construct is identified
---@param id integer The ID of the construct
---@return boolean True if the construct is identified, false otherwise
function Radar.isConstructIdentified(id) end

--- Returns 1 if the given construct was abandoned
---@param id integer The ID of the construct
---@return boolean True if the construct has no owner, false otherwise
function Radar.isConstructAbandoned(id) end

--- Returns the core size of the given construct
---@param id integer The ID of the construct
---@return string The core size name; can be 'XS', 'S', 'M', 'L', 'XL'
function Radar.getConstructCoreSize(id) end

--- Returns the threat rate your construct is for the given construct
---@param id integer The ID of the construct
---@return integer The threat rate index (None = 1, Identified = 2, Threatened and identified = 3, Threatened = 4, Attacked = 5), can be -1 if the radar is not operational
function Radar.getThreatRateTo(id) end

---@deprecated Radar.getThreatTo(id) is deprecated, use Radar.getThreatRateTo(id) instead.
function Radar.getThreatTo() end

--- Returns the threat rate the given construct is for your construct
---@param id integer The ID of the construct
---@return string The threat rate index (None = 1, Identified = 2, Threatened and identified = 3, Threatened = 4, Attacked = 5), can be -1 if the radar is not operational
function Radar.getThreatRateFrom(id) end

---@deprecated Radar.getThreatFrom(id) is deprecated, use Radar.getThreatRateFrom(id) instead.
function Radar.getThreatFrom() end

--- Returns whether the target has an active Transponder with matching tags
---@param id integer The ID of the construct
---@return boolean True if your Construct and the target have active Transponders with at least one matching tag, false otherwise
function Radar.hasMatchingTransponder(id) end

--- Returns a table with id of the owner entity (player or organization) of the given construct, if in range and if active transponder tags match for owned dynamic constructs.
---@param id integer The ID of the construct
---@return table A table with fields {[int] id, [bool] isOrganization} describing the owner. Use system.getPlayerName(id) and system.getOrganization(id) to retrieve info about it
function Radar.getConstructOwnerEntity(id) end

---@deprecated Radar.getConstructOwner(id) is deprecated, use Radar.getConstructOwnerEntity(id) instead.
function Radar.getConstructOwner() end

--- Return the size of the bounding box of the given construct, if in range
---@param id integer The ID of the construct
---@return table The size of the construct in xyz-coordinates
function Radar.getConstructSize(id) end

--- Return the kind of the given construct
---@param id integer The ID of the construct
---@return integer The kind index of the construct (Universe = 1, Planet = 2, Asteroid = 3, Static = 4, Dynamic = 5, Space = 6, Alien = 7)
function Radar.getConstructKind(id) end

---@deprecated Radar.getConstructType(id) is deprecated, use Radar.getConstructKind(id) instead.
function Radar.getConstructType() end

--- Returns the position of the given construct in construct local coordinates, if active transponder tags match for owned dynamic constructs
---@param id integer The ID of the construct
---@return table The position of the construct center in local construct coordinates
function Radar.getConstructPos(id) end

--- Returns the position of the given construct in world coordinates, if in range and if active transponder tags match for owned dynamic constructs
---@param id integer The ID of the construct
---@return table The position of the construct center in world coordinates
function Radar.getConstructWorldPos(id) end

--- Returns the velocity vector of the given construct in construct local coordinates, if identified and if active transponder tags match for owned dynamic constructs
---@param id integer The ID of the construct
---@return table The velocity of the construct in local construct coordinates
function Radar.getConstructVelocity(id) end

--- Returns the velocity vector of the given construct in world coordinates, if identified and if active transponder tags match for owned dynamic constructs
---@param id integer The ID of the construct
---@return table The velocity of the construct in world coordinates
function Radar.getConstructWorldVelocity(id) end

--- Returns the mass of the given construct, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return number The mass of the construct in kilograms
function Radar.getConstructMass(id) end

--- Return the name of the given construct, if defined
---@param id integer The ID of the construct
---@return string The name of the construct
function Radar.getConstructName(id) end

--- Returns a table of working elements on the given construction, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return table A table with fields : {[float] weapons, [float] radars, [float] antiGravity, [float] atmoEngines, [float] spaceEngines, [float] rocketEngines} with values between 0.0 and 1.0. Exceptionally antiGravity and rocketEngines are always 1.0 if present, even if broken
function Radar.getConstructInfos(id) end

--- Returns the speed of the given construct, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return number The speed of the construct relative to the universe in meters per second
function Radar.getConstructSpeed(id) end

--- Returns the angular speed of the given construct to your construct, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return number The angular speed of the construct relative to our construct in radians per second
function Radar.getConstructAngularSpeed(id) end

--- Returns the radial speed of the given construct to your construct, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return number The radial speed of the construct relative to our construct in meters per second
function Radar.getConstructRadialSpeed(id) end

--- Emitted when a Construct enters the scan range of the radar
---@param id integer The ID of the construct
---@type Event
Radar.onEnter = Event:new()

---@type Event
Radar.enter = Event:new()

--- Emitted when a construct leaves the range of the radar
---@param id integer The ID of the construct
---@type Event
Radar.onLeave = Event:new()

---@type Event
Radar.leave = Event:new()

--- Emitted when a construct is identified
---@param id integer The ID of the construct
---@type Event
Radar.onIdentified = Event:new()


---@class Receiver
local Receiver = {}
--- Show the element widget in the in-game widget stack
function Receiver.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Receiver.show() end

--- Hide the element widget in the in-game widget stack
function Receiver.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Receiver.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Receiver.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Receiver.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Receiver.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Receiver.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Receiver.getDataId() end

--- Returns the element name
---@return string The element's name
function Receiver.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Receiver.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Receiver.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Receiver.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Receiver.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Receiver.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Receiver.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Receiver.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Receiver.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Receiver.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Receiver.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Receiver.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Receiver.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Receiver.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Receiver.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Receiver.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Receiver.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Receiver.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Receiver.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Receiver.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Receiver.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Receiver.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Receiver.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Receiver.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Receiver.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Receiver.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Receiver.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Receiver.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Receiver.getSignalOut(plug) end

--- Returns the receiver range
---@return number The range in metres
function Receiver.getRange() end

--- Checks if the given channel exists in the receiver channels list
---@param channel string The channels list as Lua table
---@return boolean True if the channels list contains the given channel, false otherwise
function Receiver.hasChannel(channel) end

--- Set the channels list
---@param channels table The channels list as Lua table
---@return boolean True if the channels list has been successfully set, false otherwise
function Receiver.setChannelList(channels) end

---@deprecated Receiver.setChannels(channels) is deprecated, use Receiver.setChannelList(channels) instead.
function Receiver.setChannels() end

--- Returns the channels list
---@return table The channels list as Lua table
function Receiver.getChannelList() end

---@deprecated Receiver.getChannels() is deprecated, use Receiver.getChannelList() instead.
function Receiver.getChannels() end

--- Emitted when a message is received on any channel defined on the element
---@param channel string The channel; can be used as a filter
---@param message string The message received
---@type Event
Receiver.onReceived = Event:new()

---@type Event
Receiver.receive = Event:new()


---@class RenderScript
local RenderScript = {}
--- Add a quadratic bezier curve to the given layer.
--- Supported properties: shadow, strokeColor, strokeWidth
---@param layer integer The id of the layer to which to add
---@param x1 number X coordinate of the first point of the curve (the starting point)
---@param y1 number Y coordinate of the first point of the curve (the starting point)
---@param x2 number X coordinate of the second point of the curve (the control point)
---@param y2 number Y coordinate of the second point of the curve (the control point)
---@param x3 number X coordinate of the third point of the curve (the ending point)
---@param y3 number Y coordinate of the third point of the curve (the ending point)
function RenderScript.addBezier(layer, x1, y1, x2, y2, x3, y3) end

--- Add a box to the given layer.
--- Supported properties: fillColor, rotation, shadow, strokeColor, strokeWidth
---@param layer integer The id of the layer to which to add
---@param x number X coordinate of the box's top-left corner
---@param y number Y coordinate of the box's top-left corner
---@param sx number Width of the box
---@param sy number Height of the box
function RenderScript.addBox(layer, x, y, sx, sy) end

--- Add a rounded box to the given layer.
--- Supported properties: fillColor, rotation, shadow, strokeColor, strokeWidth
---@param layer integer The id of the layer to which to add
---@param x number X coordinate of the box's top-left corner
---@param y number Y coordinate of the box's top-left corner
---@param sx number Width of the box
---@param sy number Height of the box
---@param r number Rounding radius of the box
function RenderScript.addBoxRounded(layer, x, y, sx, sy, r) end

--- Add a circle to the given layer.
--- Supported properties: fillColor, shadow, strokeColor, strokeWidth
---@param layer integer The id of the layer to which to add
---@param x number X coordinate of the circle's center
---@param y number Y coordinate of the circle's center
---@param r number Radius of the circle
function RenderScript.addCircle(layer, x, y, r) end

--- Add an image to the given layer.
--- Supported properties: fillColor, rotation
---@param layer integer The id of the layer to which to add
---@param image integer The id of the image to add
---@param x number X coordinate of the image's top-left corner
---@param y number Y coordinate of the image's top-left corner
---@param sx number Width of the image
---@param sy number Height of the image
function RenderScript.addImage(layer, image, x, y, sx, sy) end

--- Add a sub-region of an image to the given layer.
--- Supported properties: fillColor, rotation
---@param layer integer The id of the layer to which to add
---@param image integer The id of the image to add
---@param x number X coordinate of the image's top-left corner
---@param y number Y coordinate of the image's top-left corner
---@param sx number Width of the image
---@param sy number Height of the image
---@param subX number X coordinate of the top-left corner of the sub-region to draw
---@param subY number Y coordinate of the top-left corner of the sub-region to draw
---@param subSx number Width of the sub-region within the image to draw
---@param subSy number Height of the sub-region within the image to draw
function RenderScript.addImageSub(layer, image, x, y, sx, sy, subX, subY, subSx, subSy) end

--- Add a line to the given layer.
--- Supported properties: rotation, shadow, strokeColor, strokeWidth
---@param layer integer The id of the layer to which to add
---@param x1 number X coordinate of the start of the line
---@param y1 number Y coordinate of the start of the line
---@param x2 number X coordinate of the end of the line
---@param y2 number Y coordinate of the end of the line
function RenderScript.addLine(layer, x1, y1, x2, y2) end

--- Add a quadrilateral to the given layer.
--- Supported properties: fillColor, rotation, shadow, strokeColor, strokeWidth
---@param layer integer The id of the layer to which to add
---@param x1 number X coordinate of the first point of the quad
---@param y1 number Y coordinate of the first point of the quad
---@param x2 number X coordinate of the second point of the quad
---@param y2 number Y coordinate of the second point of the quad
---@param x3 number X coordinate of the third point of the quad
---@param y3 number Y coordinate of the third point of the quad
---@param x4 number X coordinate of the fourth point of the quad
---@param y4 number Y coordinate of the fourth point of the quad
function RenderScript.addQuad(layer, x1, y1, x2, y2, x3, y3, x4, y4) end

--- Add a string of text to the given layer.
--- See setNextTextAlign for information on controlling text anchoring.
--- Supported properties: fillColor, shadow, strokeColor, strokeWidth
---@param layer integer The id of the layer to which to add
---@param font integer The id of the font to use
---@param text string The string of text to be added
---@param x number X coordinate of the text anchor
---@param y number Y coordinate of the text anchor
function RenderScript.addText(layer, font, text, x, y) end

--- Add a triangle to the given layer.
--- Supported properties: fillColor, rotation, shadow, strokeColor, strokeWidth
---@param layer integer The id of the layer to which to add
---@param x1 number X coordinate of the first point of the triangle
---@param y1 number Y coordinate of the first point of the triangle
---@param x2 number X coordinate of the second point of the triangle
---@param y2 number Y coordinate of the second point of the triangle
---@param x3 number X coordinate of the third point of the triangle
---@param y3 number Y coordinate of the third point of the triangle
function RenderScript.addTriangle(layer, x1, y1, x2, y2, x3, y3) end

--- Create a new layer that will be rendered on top of all previously-created layers
---@return integer The id that can be used to uniquely identify the layer for use with other API functions
function RenderScript.createLayer() end

--- Return the number of fonts available to be used by render script
---@return integer The total number of fonts available
function RenderScript.getAvailableFontCount() end

--- Return the name of the nth available font
---@param index integer A number between 1 and the return value of getAvailableFontCount
---@return string The name of the font, which can be used with the loadFont function
function RenderScript.getAvailableFontName(index) end

--- Return the screen location that is currently raycasted by the player
---@return number number y A tuple containing the (x, y) coordinates of the cursor, or (-1, -1) if the screen is not currently raycasted
function RenderScript.getCursor() end

--- Return the status of the mouse button
---@return boolean True if the mouse cursor is currently pressed down on the screen, false otherwise
function RenderScript.getCursorDown() end

--- Return the status of the mouse button
---@return boolean True if the mouse cursor has been pressed down on the screen at any time since the last script execution, false otherwise
function RenderScript.getCursorPressed() end

--- Return the status of the mouse button
---@return boolean True if the mouse cursor has been released on the screen at any time since the last script execution, false otherwise
function RenderScript.getCursorReleased() end

--- Return the time, in seconds, since the screen was last updated.
--- Useful for creating timing-based animations. Since screens are not guaranteed to be updated at any specific
--- time interval it is more reliable to update animations based on this timer than based on a frame counter.
---@return number Time, in seconds, since the last screen update
function RenderScript.getDeltaTime() end

--- Return informational metrics of a font
--- Can be used for advanced text layout, although setNextTextAlign is all that is needed in most use cases.
---@param font integer The font to query
---@return number number descender A tuple containing the maximal ascender and descender, respectively, of the given font
function RenderScript.getFontMetrics(font) end

--- Return the currently-set size for the given font
---@param font integer The font to query
---@return number The font size in vertical pixels
function RenderScript.getFontSize(font) end

--- Return the width and height of an image.
---@param image integer The image to query
---@return number number height A tuple containing the width and height, respectively, of the image, or (0, 0) if the image is not yet loaded
function RenderScript.getImageSize(image) end

--- Return the screen's current input string
---@return string The input string, as set by the screen unit API function setScriptInput, or an empty string if there is no current input
function RenderScript.getInput() end

--- Return the locale in which the game is currently running
---@return string The locale, currently one of "en-US", "fr-FR", or "de-DE"
function RenderScript.getLocale() end

--- Return the current render cost of the script
---@return number The cost of all rendering operations performed by the render script so far (at the time of the call to this function)
function RenderScript.getRenderCost() end

--- Return the current render cost limit
---@return number The render cost limit. A script that exceeds this limit (in one execution) will not render correctly and will instead throw an error. Note that this value may change between version releases
function RenderScript.getRenderCostMax() end

--- Return the screen's current resolution.
--- Ideally, your render scripts should be written to adapt to the resolution, as it may change in the future
---@return integer integer height A tuple containing the (width, height) of the screen's render surface, in pixels
function RenderScript.getResolution() end

--- Compute and return the bounding box of a text string rendered with a specific font
---@param font integer The font with which to render
---@param text string The text string to render
---@return number number height A tuple containing the width and height, respectively, of the bounding box
function RenderScript.getTextBounds(font, text) end

--- Return the time, in seconds, relative to the first execution
---@return number Time, in seconds, since the render script started running
function RenderScript.getTime() end

--- Return the load status of an image.
--- Note that render scripts will still render even when not all images are loaded (the call to addImage will
--- silently fail). You can use this function to do something else instead, such as draw a placeholder or
--- loading bar while images load
---@param image integer The image to query
---@return boolean True if the image is fully loaded and ready to use, false otherwise
function RenderScript.isImageLoaded(image) end

--- Load an image to be used with addImage from the given URL
---@param url string The URL of the image to be loaded; Novaquark CDN restrictions apply as usual
---@return integer The id that can be used to uniquely identify the image for use with other API functions
function RenderScript.loadImage(url) end

--- Load a font to be used with addText
---@param name string The name of the font to load; see the font list section for available font names
---@param size integer The size, in vertical pixels, at which the font will render. Note that this size can be changed during script execution with the setFontSize function
---@return integer The id that can be used to uniquely identify the font for use with other API functions
function RenderScript.loadFont(name, size) end

--- Log a message for debugging purposes. If the "enable output in Lua channel" box is
--- checked on the editor panel for the given screen, the message will be displayed in the Lua channel,
--- otherwise, this function does nothing. The checkbox is off by default, so you must explicitly enable this on
--- a screen to see debug output
---@param message string The message to log, as a string
function RenderScript.logMessage(message) end

--- Request that this screen should be redrawn in a certain number of frames.
--- A screen that requires highly-fluid animations should call requestAnimationFrame(1) before it returns.
--- Usage of this function has a significant performance impact on the screen unit system, so scripts should
--- try to request updates as infrequently as possible.
--- A screen with unchanging (static) contents should not call this function at all.
---@param frames integer The (approximate) number of frames after which the render script will run again and the screen will be redrawn
function RenderScript.requestAnimationFrame(frames) end

--- Set the background color of the screen
---@param r number Red component, between 0 and 1
---@param g number Green component, between 0 and 1
---@param b number Blue component, between 0 and 1
function RenderScript.setBackgroundColor(r, g, b) end

--- Set the default fill color for all subsequent shapes of the given type added to the given layer
---@param layer integer The layer for which the default will be set
---@param shapeType ShapeType The type of shape to which the default will apply
---@param r number Red component, between 0 and 1
---@param g number Green component, between 0 and 1
---@param b number Blue component, between 0 and 1
---@param a number Alpha component, between 0 and 1
function RenderScript.setDefaultFillColor(layer, shapeType, r, g, b, a) end

--- Set the default rotation for all subsequent shapes of the given type added to the given layer
---@param layer integer The layer for which the default will be set
---@param shapeType ShapeType The type of shape to which the default will apply
---@param rotation number Rotation, in radians; positive is counter-clockwise, negative is clockwise
function RenderScript.setDefaultRotation(layer, shapeType, rotation) end

--- Set the default shadow for all subsequent shapes of the given type added to the given layer
---@param layer integer The layer for which the default will be set
---@param shapeType ShapeType The type of shape to which the default will apply
---@param radius number The distance that the shadow extends from the shape's border
---@param r number Red component, between 0 and 1
---@param g number Green component, between 0 and 1
---@param b number Blue component, between 0 and 1
---@param a number Alpha component, between 0 and 1
function RenderScript.setDefaultShadow(layer, shapeType, radius, r, g, b, a) end

--- Set the default stroke color for all subsequent shapes of the given type added to the given layer
---@param layer integer The layer for which the default will be set
---@param shapeType ShapeType The type of shape to which the default will apply
---@param r number Red component, between 0 and 1
---@param g number Green component, between 0 and 1
---@param b number Blue component, between 0 and 1
---@param a number Alpha component, between 0 and 1
function RenderScript.setDefaultStrokeColor(layer, shapeType, r, g, b, a) end

--- Set the default stroke width for all subsequent shapes of the given type added to the given layer
---@param layer integer The layer for which the default will be set
---@param shapeType ShapeType The type of shape to which the default will apply
---@param strokeWidth number Stroke width, in pixels
function RenderScript.setDefaultStrokeWidth(layer, shapeType, strokeWidth) end

--- Set the default text alignment of all subsequent text strings on the given layer
---@param layer integer The layer for which the default will be set
---@param alignH AlignH Specifies the horizontal anchoring of a text string relative to the draw coordinates; must be one of the following built-in constants: AlignH_Left, AlignH_Center, AlignH_Right
---@param alignV AlignV Specifies the vertical anchoring of a text string relative to the draw coordinates; must be one of the following built-in constants: AlignV_Ascender, AlignV_Top, AlignV_Middle, AlignV_Baseline, AlignV_Bottom, AlignV_Descender
function RenderScript.setDefaultTextAlign(layer, alignH, alignV) end

--- Set the size at which a font will render.
--- Impacts all subsequent font-related calls, including addText, getFontMetrics, and getTextBounds.
---@param font integer The font for which the size will be set
---@param size integer The new size, in vertical pixels, at which the font will render
function RenderScript.setFontSize(font, size) end

--- Set a clipping rectangle applied to the layer as a whole.
--- Layer contents that fall outside the clipping rectangle will not be rendered, and those that are
--- partially within the rectangle will be 'clipped' against it. The clipping rectangle is applied
--- before layer transformations. Note that clipped contents still count toward the render cost.
---@param layer integer The layer for which the clipping rectangle will be set
---@param x number X coordinate of the clipping rectangle's top-left corner
---@param y number Y coordinate of the clipping rectangle's top-left corner
---@param sx number Width of the clipping rectangle
---@param sy number Height of the clipping rectangle
function RenderScript.setLayerClipRect(layer, x, y, sx, sy) end

--- Set the transform origin of a layer; layer scaling and rotation are applied relative to this origin
---@param layer integer The layer for which the origin will be set
---@param x number X coordinate of the layer's transform origin
---@param y number Y coordinate of the layer's transform origin
function RenderScript.setLayerOrigin(layer, x, y) end

--- Set a rotation applied to the layer as a whole, relative to the layer's transform origin
---@param layer integer The layer for which the rotation will be set
---@param rotation number Rotation, in radians; positive is counter-clockwise, negative is clockwise
function RenderScript.setLayerRotation(layer, rotation) end

--- Set a scale factor applied to the layer as a whole, relative to the layer's transform origin.
--- Scale factors are multiplicative, so that a scale >1 enlarges the size of the layer, 1.0 does nothing, and
--- <1 reduces the size of the layer.
---@param layer integer The layer for which the scale factor will be set
---@param sx number Scale factor along the X axis
---@param sy number Scale factor along the Y axis
function RenderScript.setLayerScale(layer, sx, sy) end

--- Set a translation applied to the layer as a whole
---@param layer integer The layer for which the translation will be set
---@param tx number Translation along the X axis
---@param ty number Translation along the Y axis
function RenderScript.setLayerTranslation(layer, tx, ty) end

--- Set the fill color of the next rendered shape on the given layer; has no effect on shapes that do not support a fill color
---@param layer integer The layer to which this property applies
---@param r number Red component, between 0 and 1
---@param g number Green component, between 0 and 1
---@param b number Blue component, between 0 and 1
---@param a number Alpha component, between 0 and 1
function RenderScript.setNextFillColor(layer, r, g, b, a) end

--- Set the rotation of the next rendered shape on the given layer; has no effect on shapes that do not support rotation
---@param layer integer The layer to which this property applies
---@param rotation number Rotation, in radians; positive is counter-clockwise, negative is clockwise
function RenderScript.setNextRotation(layer, rotation) end

--- Set the rotation of the next rendered shape on the given layer; has no effect on shapes that do not support rotation
---@param layer integer The layer to which this property applies
---@param rotation number Rotation, in degrees; positive is counter-clockwise, negative is clockwise
function RenderScript.setNextRotationDegrees(layer, rotation) end

--- Set the shadow of the next rendered shape on the given layer; has no effect on shapes that do not support a shadow
---@param layer integer The layer to which this property applies
---@param radius number The distance that the shadow extends from the shape's border
---@param r number Red component, between 0 and 1
---@param g number Green component, between 0 and 1
---@param b number Blue component, between 0 and 1
---@param a number Alpha component, between 0 and 1
function RenderScript.setNextShadow(layer, radius, r, g, b, a) end

--- Set the stroke color of the next rendered shape on the given layer; has no effect on shapes that do not support a stroke color
---@param layer integer The layer to which this property applies
---@param r number Red component, between 0 and 1
---@param g number Green component, between 0 and 1
---@param b number Blue component, between 0 and 1
---@param a number Alpha component, between 0 and 1
function RenderScript.setNextStrokeColor(layer, r, g, b, a) end

--- Set the stroke width of the next rendered shape on the given layer; has no effect on shapes that do not support a stroke width
---@param layer integer The layer to which this property applies
---@param strokeWidth number Stroke width, in pixels
function RenderScript.setNextStrokeWidth(layer, strokeWidth) end

--- Set the text alignment of the next rendered text string on the given layer.
--- By default, text is anchored horizontally on the left, and vertically on the baseline
---@param layer integer The layer to which this property applies
---@param alignH AlignH Specifies the horizontal anchoring of a text string relative to the draw coordinates; must be one of the following built-in constants: AlignH_Left, AlignH_Center, AlignH_Right
---@param alignV AlignV Specifies the vertical anchoring of a text string relative to the draw coordinates; must be one of the following built-in constants: AlignV_Ascender, AlignV_Top, AlignV_Middle, AlignV_Baseline, AlignV_Bottom, AlignV_Descender
function RenderScript.setNextTextAlign(layer, alignH, alignV) end

--- Set the script's output string, which can be retrieved via a programming board with the screen unit API function getScriptOutput
---@param output string The output string
function RenderScript.setOutput(output) end


---@class RocketEngine
local RocketEngine = {}
--- Show the element widget in the in-game widget stack
function RocketEngine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function RocketEngine.show() end

--- Hide the element widget in the in-game widget stack
function RocketEngine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function RocketEngine.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function RocketEngine.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function RocketEngine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function RocketEngine.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function RocketEngine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function RocketEngine.getDataId() end

--- Returns the element name
---@return string The element's name
function RocketEngine.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function RocketEngine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function RocketEngine.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function RocketEngine.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function RocketEngine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function RocketEngine.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function RocketEngine.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function RocketEngine.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function RocketEngine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function RocketEngine.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function RocketEngine.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function RocketEngine.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function RocketEngine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function RocketEngine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function RocketEngine.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function RocketEngine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function RocketEngine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function RocketEngine.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function RocketEngine.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function RocketEngine.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function RocketEngine.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function RocketEngine.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function RocketEngine.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function RocketEngine.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function RocketEngine.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function RocketEngine.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function RocketEngine.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function RocketEngine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function RocketEngine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number The obstruction ratio of the engine
function RocketEngine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string Tags of the engine, in a CSV string
function RocketEngine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean True to ignore the default engine tags
---@return boolean True if the tags have been applied, false if they have not
function RocketEngine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return boolean True if the engine ignores default engine tags, false if not
function RocketEngine.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function RocketEngine.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function RocketEngine.deactivate() end

--- Checks if the engine is active
---@return boolean True if the engine is on, false otherwise
function RocketEngine.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function RocketEngine.getState() end

--- Toggle the state of the engine
function RocketEngine.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function RocketEngine.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number The thrust of the engine is currently delivering in newtons
function RocketEngine.getThrust() end

---@deprecated FueledEngine.getMaxThrust() is deprecated, use FueledEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function RocketEngine.getMaxThrust() end

---@deprecated FueledEngine.getMaxThrustBase() is deprecated, use FueledEngine.getMaxThrust().
function RocketEngine.getMaxThrustBase() end

--- Returns the minimal thrust the engine can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number The current minimal engine thrust in newtons
function RocketEngine.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function RocketEngine.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number The current maximum engine thrust in newtons
function RocketEngine.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number Usually 1 but can be lower for certain engines
function RocketEngine.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return boolean True if the torque is enabled on the engine, false otherwise
function RocketEngine.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function RocketEngine.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table The engine thrust direction vector in construct local coordinates
function RocketEngine.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table The torque axis vector in construct local coordinates
function RocketEngine.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table The engine thrust direction vector in world coordinates
function RocketEngine.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function RocketEngine.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table The torque axis vector in world coordinates
function RocketEngine.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function RocketEngine.torqueAxis() end

--- Checks if the engine out of fuel
---@return boolean True if the engine is out of fuel, false otherwise
function RocketEngine.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer The item ID of the fuel currently used
function RocketEngine.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer The local ID of the fueltank
function RocketEngine.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return boolean True if the linked tank is functional, false otherwise
function RocketEngine.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function RocketEngine.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number The current rate of fuel consumption in m³/(N.s)
function RocketEngine.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number Usually 1 but can be higher for certain engines at certain speeds
function RocketEngine.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number The rate of fuel consumption in m3/s
function RocketEngine.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number The time to half thrust in seconds
function RocketEngine.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function RocketEngine.getT50() end

---@deprecated RocketEngine.getDistance() is deprecated.
function RocketEngine.getDistance() end


---@class Screen
local Screen = {}
--- Show the element widget in the in-game widget stack
function Screen.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Screen.show() end

--- Hide the element widget in the in-game widget stack
function Screen.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Screen.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Screen.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Screen.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Screen.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Screen.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Screen.getDataId() end

--- Returns the element name
---@return string The element's name
function Screen.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Screen.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Screen.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Screen.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Screen.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Screen.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Screen.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Screen.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Screen.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Screen.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Screen.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Screen.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Screen.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Screen.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Screen.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Screen.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Screen.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Screen.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Screen.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Screen.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Screen.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Screen.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Screen.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Screen.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Screen.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Screen.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Screen.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Screen.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Screen.getSignalOut(plug) end

--- Switch on the screen
function Screen.activate() end

--- Switch off the screen
function Screen.deactivate() end

--- Checks if the screen is on
---@return boolean True if the screen is on, false otherwise
function Screen.isActive() end

---@deprecated Screen.getState() is deprecated, use Screen.isActive() instead.
function Screen.getState() end

--- Toggle the state of the screen
function Screen.toggle() end

--- Displays the given text at the given coordinates in the screen, and returns an ID to move it later
---@param x number Horizontal position, as a percentage (between 0 and 100) of the screen width
---@param y number Vertical position, as a percentage (between 0 and 100) of the screen height
---@param fontSize number Text font size, as a percentage of the screen width
---@param text string The text to display
---@return integer  An integer ID that can be used later to update/remove the added Element
function Screen.addText(x, y, fontSize, text) end

--- Displays the given text centered in the screen with a font to maximize its visibility
---@param text string The text to display
function Screen.setCenteredText(text) end

--- Set the whole screen HTML content (overrides anything already set)
---@param html string The HTML content to display
function Screen.setHTML(html) end

--- Set the screen render script, switching the screen to native rendering mode
---@param script string The Lua render script
function Screen.setRenderScript(script) end

--- Defines the input of the screen rendering script, which will be automatically defined during the execution of Lua
---@param input string A string that can be retrieved by calling getInput in a render script
function Screen.setScriptInput(input) end

--- Set the screen render script output to the empty string
function Screen.clearScriptOutput() end

--- Get the screen render script output
---@return string The contents of the last render script setOutput call, or an empty string
function Screen.getScriptOutput() end

--- Displays the given HTML content at the given coordinates in the screen, and returns an ID to move it later
---@param x number Horizontal position, as a percentage (between 0 and 100) of the screen width
---@param y number Vertical position, as a percentage (between 0 and 100) of the screen height
---@param html string The HTML content to display, which can contain SVG html elements to make drawings
---@return integer An integer ID that can be used later to update/remove the added Element
function Screen.addContent(x, y, html) end

--- Displays SVG code (anything that fits within a <svg> section), which overrides any preexisting content
---@param svg string The SVG content to display, which fits inside a 1920x1080 canvas
function Screen.setSVG(svg) end

--- Update the html element with the given ID (returned by addContent) with a new HTML content
---@param id integer An integer ID that is used to identify the html element in the screen. Methods such as addContent return the ID that you can store to use later here
---@param html string The HTML content to display, which can contain SVG html elements to make drawings
function Screen.resetContent(id, html) end

--- Delete the html element with the given ID (returned by addContent)
---@param id integer An integer ID that is used to identify the html element in the screen. Methods such as addContent return the id that you can store to use later here
function Screen.deleteContent(id) end

--- Update the visibility of the html element with the given ID (returned by addContent)
---@param id integer An integer ID that is used to identify the html element in the screen. Methods such as addContent return the ID that you can store to use later here
---@param state boolean true to show the content, false to hide
function Screen.showContent(id, state) end

--- Move the html element with the given id (returned by addContent) to a new position in the screen
---@param id integer An integer id that is used to identify the html element in the screen. Methods such as addContent return the ID that you can store to use later here
---@param x number Horizontal position, as a percentage (between 0 and 100) of the screen width
---@param y number Vertical position, as a percentage (between 0 and 100) of the screen height
function Screen.moveContent(id, x, y) end

--- Returns the x-coordinate of the position point at in the screen
---@return number The x-position as a percentage (between 0 and 1) of screen width; -1 if nothing is point at
function Screen.getMouseX() end

--- Returns the y-coordinate of the position point at in the screen
---@return number The y-position as a percentage (between 0 and 1) of screen height; -1 if nothing is point at
function Screen.getMouseY() end

--- Returns the state of the mouse click
---@return boolean True if the mouse is pressed, false otherwise
function Screen.getMouseState() end

--- Clear the screen
function Screen.clear() end

--- Emitted when the player starts a click on the screen
---@param x number X-coordinate of the click in percentage (between 0 and 1) of the screen width
---@param y number Y-coordinate of the click in percentage (between 0 and 1) the screen height
---@type Event
Screen.onMouseDown = Event:new()

---@type Event
Screen.mouseDown = Event:new()

--- Emitted when the player releases a click on the screen
---@param x number X-coordinate of the click in percentage (between 0 and 1) of the screen width
---@param y number Y-coordinate of the click in percentage (between 0 and 1) the screen height
---@type Event
Screen.onMouseUp = Event:new()

---@type Event
Screen.mouseUp = Event:new()

--- Emitted when the output of the screen is changed
---@param output string The output string of the screen
---@type Event
Screen.onOutputChanged = Event:new()


---@class ShieldGenerator
local ShieldGenerator = {}
--- Show the element widget in the in-game widget stack
function ShieldGenerator.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function ShieldGenerator.show() end

--- Hide the element widget in the in-game widget stack
function ShieldGenerator.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function ShieldGenerator.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function ShieldGenerator.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function ShieldGenerator.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function ShieldGenerator.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function ShieldGenerator.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function ShieldGenerator.getDataId() end

--- Returns the element name
---@return string The element's name
function ShieldGenerator.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function ShieldGenerator.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function ShieldGenerator.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function ShieldGenerator.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function ShieldGenerator.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function ShieldGenerator.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function ShieldGenerator.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function ShieldGenerator.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function ShieldGenerator.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function ShieldGenerator.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function ShieldGenerator.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function ShieldGenerator.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function ShieldGenerator.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function ShieldGenerator.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function ShieldGenerator.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function ShieldGenerator.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function ShieldGenerator.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function ShieldGenerator.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function ShieldGenerator.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function ShieldGenerator.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function ShieldGenerator.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function ShieldGenerator.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function ShieldGenerator.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function ShieldGenerator.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function ShieldGenerator.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function ShieldGenerator.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function ShieldGenerator.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function ShieldGenerator.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function ShieldGenerator.getSignalOut(plug) end

--- Activate the shield
function ShieldGenerator.activate() end

--- Deactivate the shield
function ShieldGenerator.deactivate() end

--- Toggle the state of the shield
function ShieldGenerator.toggle() end

--- Returns the activation state of the shield
---@return boolean True when the shield is active, false otherwise
function ShieldGenerator.isActive() end

---@deprecated ShieldGenerator.getState() is deprecated, use ShieldGenerator.isActive() instead.
function ShieldGenerator.getState() end

--- Returns the current hitpoints of the shield
---@return number The current hitpoints of the shield
function ShieldGenerator.getShieldHitpoints() end

--- Returns the maximal hitpoints of the shield
---@return number The maximal hitpoints of the shield
function ShieldGenerator.getMaxShieldHitpoints() end

--- Activate shield venting to restore hit points
---@return boolean True if venting started, false if an error occurred
function ShieldGenerator.startVenting() end

--- Stop shield venting
---@return boolean True if venting stopped, false if an error occurred
function ShieldGenerator.stopVenting() end

--- Check whether venting is in progress
---@return boolean True if venting is ongoing, false otherwise
function ShieldGenerator.isVenting() end

--- Returns time after which venting is possible again
---@return number Remaining seconds of the venting cooldown
function ShieldGenerator.getVentingCooldown() end

--- Returns maximal cooldown between venting
---@return number Maximal seconds of the venting cooldown
function ShieldGenerator.getVentingMaxCooldown() end

--- Returns distribution of resistance pool over resistance types
---@return table Resistance to damage type {antimatter, electromagnetic, kinetic, thermic}
function ShieldGenerator.getResistances() end

--- Distribute the resistance pool according to damage type
---@param antimatter number Antimatter damage resistance
---@param electromagnetic number Electromagnetic damage resistance
---@param kinetic number Kinetic damage resistance
---@param thermic number Thermic damage resistance
---@return boolean True if resistance was distributed, false if an error occurred
function ShieldGenerator.setResistances(antimatter, electromagnetic, kinetic, thermic) end

--- Returns time after which adjusting resistances is possible again
---@return number Remaining time of the resistance cooldown in seconds
function ShieldGenerator.getResistancesCooldown() end

--- Returns maximal cooldown between adjusting resistances
---@return number The maximum time of the resistance cooldown in seconds
function ShieldGenerator.getResistancesMaxCooldown() end

--- Returns total resistance pool that may be distributed
---@return number Total pool of resistances
function ShieldGenerator.getResistancesPool() end

--- Returns the remaining amount of the resistance pool that can be distributed
---@return number Remaining resistance pool
function ShieldGenerator.getResistancesRemaining() end

--- Returns ratio per damage type of recent weapon impacts after applying resistance
---@return table Stress ratio due to damage type {antimatter, electromagnetic, kinetic, thermic}
function ShieldGenerator.getStressRatio() end

--- Returns ratio per damage type of recent weapon impacts without resistance
---@return table Stress ratio due to damage type {antimatter, electromagnetic, kinetic, thermic}
function ShieldGenerator.getStressRatioRaw() end

--- Returns stress, that is the total hitpoints of recent weapon impacts after applying resistance
---@return number Total stress hitpoints due to recent weapon impacts
function ShieldGenerator.getStressHitpoints() end

--- Returns stress, that is the total hitpoints of recent weapon impacts without resistance
---@return number Total stress hitpoints due to recent weapon impacts
function ShieldGenerator.getStressHitpointsRaw() end

--- Emitted when we started or stopped the shield generator
---@param active boolean True if the element was activated, false otherwise
---@type Event
ShieldGenerator.onToggled = Event:new()

---@type Event
ShieldGenerator.toggled = Event:new()

--- Emitted when the shield absorbed incoming damage
---@param hitpoints number Damage the shield absorbed
---@param rawHitpoints number Total damage without taking resistances into account
---@type Event
ShieldGenerator.onAbsorbed = Event:new()

---@type Event
ShieldGenerator.absorbed = Event:new()

--- Emitted when venting started, stopped or restored some hitpoints
---@param active boolean True when venting is active, false otherwise
---@param restoredHitpoints number Hitpoints restored since the last venting step
---@type Event
ShieldGenerator.onVenting = Event:new()

---@type Event
ShieldGenerator.venting = Event:new()

--- Emitted when the shield hit points reached 0 due to damage
---@type Event
ShieldGenerator.onDown = Event:new()

---@type Event
ShieldGenerator.down = Event:new()

--- Emitted when the shield hit points were fully restored
---@type Event
ShieldGenerator.onRestored = Event:new()

---@type Event
ShieldGenerator.restored = Event:new()


---@class SpaceBrake
local SpaceBrake = {}
--- Show the element widget in the in-game widget stack
function SpaceBrake.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function SpaceBrake.show() end

--- Hide the element widget in the in-game widget stack
function SpaceBrake.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function SpaceBrake.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function SpaceBrake.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function SpaceBrake.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function SpaceBrake.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function SpaceBrake.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function SpaceBrake.getDataId() end

--- Returns the element name
---@return string The element's name
function SpaceBrake.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function SpaceBrake.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function SpaceBrake.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function SpaceBrake.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function SpaceBrake.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function SpaceBrake.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function SpaceBrake.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function SpaceBrake.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function SpaceBrake.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function SpaceBrake.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function SpaceBrake.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function SpaceBrake.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function SpaceBrake.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function SpaceBrake.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function SpaceBrake.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function SpaceBrake.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function SpaceBrake.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function SpaceBrake.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function SpaceBrake.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function SpaceBrake.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function SpaceBrake.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function SpaceBrake.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function SpaceBrake.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function SpaceBrake.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function SpaceBrake.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function SpaceBrake.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function SpaceBrake.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function SpaceBrake.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function SpaceBrake.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number The obstruction ratio of the engine
function SpaceBrake.getObstructionFactor() end

--- Returns the tags of the engine
---@return string Tags of the engine, in a CSV string
function SpaceBrake.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean True to ignore the default engine tags
---@return boolean True if the tags have been applied, false if they have not
function SpaceBrake.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return boolean True if the engine ignores default engine tags, false if not
function SpaceBrake.isIgnoringTags() end

--- Start the brake at full power (works only when run inside a cockpit or under remote control)
function SpaceBrake.activate() end

--- Stops the brake (works only when run inside a cockpit or under remote control)
function SpaceBrake.deactivate() end

--- Checks if the brake is active
---@return boolean True if the brake is on, false otherwise
function SpaceBrake.isActive() end

---@deprecated BrakeEngine.getState() is deprecated, use BrakeEngine.isActive().
function SpaceBrake.getState() end

--- Toggle the state of the brake
function SpaceBrake.toggle() end

--- Set the thrust of the brake. Note that brakes can generate a force only in the movement opposite direction
---@param thrust number The brake thrust in newtons (limited by the maximum thrust)
function SpaceBrake.setThrust(thrust) end

--- Returns the current thrust of the brake
---@return number 
function SpaceBrake.getThrust() end

---@deprecated BrakeEngine.getMaxThrust() is deprecated, use BrakeEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function SpaceBrake.getMaxThrust() end

---@deprecated BrakeEngine.getMaxThrustBase() is deprecated, use BrakeEngine.getMaxThrust().
function SpaceBrake.getMaxThrustBase() end

--- Returns the minimal thrust the brake can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number 
function SpaceBrake.getCurrentMinThrust() end

---@deprecated BrakeEngine.getMinThrust() is deprecated, use BrakeEngine.getCurrentMinThrust().
function SpaceBrake.getMinThrust() end

--- Returns the maximal thrust the brake can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the brake
---@return number 
function SpaceBrake.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function SpaceBrake.getMaxThrustEfficiency() end

--- Returns the brake thrust direction in construct local coordinates
---@return table 
function SpaceBrake.getThrustAxis() end

--- Returns the brake thrust direction in world coordinates
---@return table 
function SpaceBrake.getWorldThrustAxis() end

---@deprecated BrakeEngine.thrustAxis() is deprecated, use BrakeEngine.getWorldThrustAxis().
function SpaceBrake.thrustAxis() end

---@deprecated BrakeEngine.isOutOfFuel() is deprecated.
function SpaceBrake.isOutOfFuel() end

---@deprecated BrakeEngine.hasFunctionalFuelTank() is deprecated.
function SpaceBrake.hasFunctionalFuelTank() end

---@deprecated BrakeEngine.getCurrentFuelRate() is deprecated.
function SpaceBrake.getCurrentFuelRate() end

---@deprecated BrakeEngine.getFuelRateEfficiency() is deprecated.
function SpaceBrake.getFuelRateEfficiency() end

---@deprecated BrakeEngine.getFuelConsumption() is deprecated.
function SpaceBrake.getFuelConsumption() end

---@deprecated BrakeEngine.getDistance() is deprecated.
function SpaceBrake.getDistance() end

---@deprecated BrakeEngine.getT50() is deprecated.
function SpaceBrake.getT50() end

---@deprecated BrakeEngine.torqueAxis() is deprecated.
function SpaceBrake.torqueAxis() end


---@class SpaceEngine
local SpaceEngine = {}
--- Show the element widget in the in-game widget stack
function SpaceEngine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function SpaceEngine.show() end

--- Hide the element widget in the in-game widget stack
function SpaceEngine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function SpaceEngine.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function SpaceEngine.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function SpaceEngine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function SpaceEngine.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function SpaceEngine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function SpaceEngine.getDataId() end

--- Returns the element name
---@return string The element's name
function SpaceEngine.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function SpaceEngine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function SpaceEngine.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function SpaceEngine.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function SpaceEngine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function SpaceEngine.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function SpaceEngine.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function SpaceEngine.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function SpaceEngine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function SpaceEngine.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function SpaceEngine.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function SpaceEngine.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function SpaceEngine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function SpaceEngine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function SpaceEngine.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function SpaceEngine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function SpaceEngine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function SpaceEngine.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function SpaceEngine.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function SpaceEngine.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function SpaceEngine.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function SpaceEngine.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function SpaceEngine.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function SpaceEngine.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function SpaceEngine.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function SpaceEngine.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function SpaceEngine.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function SpaceEngine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function SpaceEngine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number The obstruction ratio of the engine
function SpaceEngine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string Tags of the engine, in a CSV string
function SpaceEngine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean True to ignore the default engine tags
---@return boolean True if the tags have been applied, false if they have not
function SpaceEngine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return boolean True if the engine ignores default engine tags, false if not
function SpaceEngine.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function SpaceEngine.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function SpaceEngine.deactivate() end

--- Checks if the engine is active
---@return boolean True if the engine is on, false otherwise
function SpaceEngine.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function SpaceEngine.getState() end

--- Toggle the state of the engine
function SpaceEngine.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function SpaceEngine.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number The thrust of the engine is currently delivering in newtons
function SpaceEngine.getThrust() end

---@deprecated FueledEngine.getMaxThrust() is deprecated, use FueledEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function SpaceEngine.getMaxThrust() end

---@deprecated FueledEngine.getMaxThrustBase() is deprecated, use FueledEngine.getMaxThrust().
function SpaceEngine.getMaxThrustBase() end

--- Returns the minimal thrust the engine can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number The current minimal engine thrust in newtons
function SpaceEngine.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function SpaceEngine.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number The current maximum engine thrust in newtons
function SpaceEngine.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number Usually 1 but can be lower for certain engines
function SpaceEngine.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return boolean True if the torque is enabled on the engine, false otherwise
function SpaceEngine.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function SpaceEngine.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table The engine thrust direction vector in construct local coordinates
function SpaceEngine.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table The torque axis vector in construct local coordinates
function SpaceEngine.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table The engine thrust direction vector in world coordinates
function SpaceEngine.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function SpaceEngine.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table The torque axis vector in world coordinates
function SpaceEngine.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function SpaceEngine.torqueAxis() end

--- Checks if the engine out of fuel
---@return boolean True if the engine is out of fuel, false otherwise
function SpaceEngine.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer The item ID of the fuel currently used
function SpaceEngine.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer The local ID of the fueltank
function SpaceEngine.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return boolean True if the linked tank is functional, false otherwise
function SpaceEngine.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function SpaceEngine.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number The current rate of fuel consumption in m³/(N.s)
function SpaceEngine.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number Usually 1 but can be higher for certain engines at certain speeds
function SpaceEngine.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number The rate of fuel consumption in m3/s
function SpaceEngine.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number The time to half thrust in seconds
function SpaceEngine.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function SpaceEngine.getT50() end

---@deprecated SpaceEngine.getDistance() is deprecated.
function SpaceEngine.getDistance() end


---@class SpaceMiningUnit
local SpaceMiningUnit = {}
--- Show the element widget in the in-game widget stack
function SpaceMiningUnit.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function SpaceMiningUnit.show() end

--- Hide the element widget in the in-game widget stack
function SpaceMiningUnit.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function SpaceMiningUnit.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function SpaceMiningUnit.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function SpaceMiningUnit.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function SpaceMiningUnit.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function SpaceMiningUnit.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function SpaceMiningUnit.getDataId() end

--- Returns the element name
---@return string The element's name
function SpaceMiningUnit.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function SpaceMiningUnit.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function SpaceMiningUnit.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function SpaceMiningUnit.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function SpaceMiningUnit.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function SpaceMiningUnit.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function SpaceMiningUnit.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function SpaceMiningUnit.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function SpaceMiningUnit.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function SpaceMiningUnit.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function SpaceMiningUnit.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function SpaceMiningUnit.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function SpaceMiningUnit.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function SpaceMiningUnit.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function SpaceMiningUnit.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function SpaceMiningUnit.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function SpaceMiningUnit.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function SpaceMiningUnit.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function SpaceMiningUnit.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function SpaceMiningUnit.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function SpaceMiningUnit.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function SpaceMiningUnit.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function SpaceMiningUnit.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function SpaceMiningUnit.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function SpaceMiningUnit.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function SpaceMiningUnit.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function SpaceMiningUnit.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function SpaceMiningUnit.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function SpaceMiningUnit.getSignalOut(plug) end

--- Returns the current state of the space mining unit
---@return integer The status of the space mining unit can be (Stopped = 1, Running = 2, Jammed output full = 3, Jammed no output container = 4)
function SpaceMiningUnit.getState() end

---@deprecated MiningUnit.getStatus() is deprecated, use MiningUnit.getState() instead.
function SpaceMiningUnit.getStatus() end

--- Returns the remaining time of the current batch extraction process.
---@return number The remaining time in seconds
function SpaceMiningUnit.getRemainingTime() end

--- Returns the item ID of the currently selected ore.
---@return integer The item ID of the selected ore
function SpaceMiningUnit.getActiveOre() end

--- Returns the list of available ore pools
---@return table A list of tables composed with {[int] oreId, [float] available, [float] maximum}
function SpaceMiningUnit.getOrePools() end

--- Returns the base production rate of the space mining unit.
---@return number The production rate in L/h
function SpaceMiningUnit.getBaseRate() end

--- Returns the efficiency rate of the space mining unit.
---@return number The efficiency rate between 0 and 1
function SpaceMiningUnit.getEfficiency() end

--- Returns the calibration rate of the space mining unit.
---@return number The calibration rate of the space mining unit between 0 and 1
function SpaceMiningUnit.getCalibrationRate() end

--- Returns the optimal calibration rate of the space mining unit.
---@return number The optimal calibration rate of the space mining unit between 0 and 1
function SpaceMiningUnit.getOptimalRate() end

--- Returns the current production rate of the space mining unit.
---@return number The production rate in L/h
function SpaceMiningUnit.getProductionRate() end

--- Emitted when the space mining unit started a new extraction process.
---@param oreId number The item ID of the ore mined during the extraction process
---@type Event
SpaceMiningUnit.onStarted = Event:new()

--- Emitted when the space mining unit complete a batch.
---@param oreId number The item ID of the ore mined during the extraction process
---@param amount number Amount of ore mined
---@type Event
SpaceMiningUnit.onCompleted = Event:new()

---@type Event
SpaceMiningUnit.completed = Event:new()

--- Emitted when the space mining unit status is changed.
---@param status integer The status of the space mining unit can be
---@type Event
SpaceMiningUnit.onStatusChanged = Event:new()

---@type Event
SpaceMiningUnit.statusChanged = Event:new()

--- Emitted when the space mining unit stopped the extraction process.
---@type Event
SpaceMiningUnit.onStopped = Event:new()


---@class SurfaceEngine
local SurfaceEngine = {}
--- Show the element widget in the in-game widget stack
function SurfaceEngine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function SurfaceEngine.show() end

--- Hide the element widget in the in-game widget stack
function SurfaceEngine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function SurfaceEngine.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function SurfaceEngine.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function SurfaceEngine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function SurfaceEngine.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function SurfaceEngine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function SurfaceEngine.getDataId() end

--- Returns the element name
---@return string The element's name
function SurfaceEngine.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function SurfaceEngine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function SurfaceEngine.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function SurfaceEngine.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function SurfaceEngine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function SurfaceEngine.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function SurfaceEngine.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function SurfaceEngine.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function SurfaceEngine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function SurfaceEngine.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function SurfaceEngine.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function SurfaceEngine.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function SurfaceEngine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function SurfaceEngine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function SurfaceEngine.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function SurfaceEngine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function SurfaceEngine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function SurfaceEngine.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function SurfaceEngine.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function SurfaceEngine.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function SurfaceEngine.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function SurfaceEngine.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function SurfaceEngine.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function SurfaceEngine.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function SurfaceEngine.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function SurfaceEngine.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function SurfaceEngine.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function SurfaceEngine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function SurfaceEngine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number The obstruction ratio of the engine
function SurfaceEngine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string Tags of the engine, in a CSV string
function SurfaceEngine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean True to ignore the default engine tags
---@return boolean True if the tags have been applied, false if they have not
function SurfaceEngine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return boolean True if the engine ignores default engine tags, false if not
function SurfaceEngine.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function SurfaceEngine.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function SurfaceEngine.deactivate() end

--- Checks if the engine is active
---@return boolean True if the engine is on, false otherwise
function SurfaceEngine.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function SurfaceEngine.getState() end

--- Toggle the state of the engine
function SurfaceEngine.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function SurfaceEngine.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number The thrust of the engine is currently delivering in newtons
function SurfaceEngine.getThrust() end

---@deprecated FueledEngine.getMaxThrust() is deprecated, use FueledEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function SurfaceEngine.getMaxThrust() end

---@deprecated FueledEngine.getMaxThrustBase() is deprecated, use FueledEngine.getMaxThrust().
function SurfaceEngine.getMaxThrustBase() end

--- Returns the minimal thrust the engine can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number The current minimal engine thrust in newtons
function SurfaceEngine.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function SurfaceEngine.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number The current maximum engine thrust in newtons
function SurfaceEngine.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number Usually 1 but can be lower for certain engines
function SurfaceEngine.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return boolean True if the torque is enabled on the engine, false otherwise
function SurfaceEngine.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function SurfaceEngine.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table The engine thrust direction vector in construct local coordinates
function SurfaceEngine.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table The torque axis vector in construct local coordinates
function SurfaceEngine.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table The engine thrust direction vector in world coordinates
function SurfaceEngine.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function SurfaceEngine.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table The torque axis vector in world coordinates
function SurfaceEngine.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function SurfaceEngine.torqueAxis() end

--- Checks if the engine out of fuel
---@return boolean True if the engine is out of fuel, false otherwise
function SurfaceEngine.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer The item ID of the fuel currently used
function SurfaceEngine.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer The local ID of the fueltank
function SurfaceEngine.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return boolean True if the linked tank is functional, false otherwise
function SurfaceEngine.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function SurfaceEngine.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number The current rate of fuel consumption in m³/(N.s)
function SurfaceEngine.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number Usually 1 but can be higher for certain engines at certain speeds
function SurfaceEngine.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number The rate of fuel consumption in m3/s
function SurfaceEngine.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number The time to half thrust in seconds
function SurfaceEngine.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function SurfaceEngine.getT50() end

--- Returns the distance to the first object detected in the direction of the thrust
---@return number The distance to the first obstacle in meters
function SurfaceEngine.getDistance() end

--- Returns the maximum functional distance from the ground
---@return number The maximum functional distance in meters
function SurfaceEngine.getMaxDistance() end


---@class System
local System = {}
--- Return the currently key bound to the given action. Useful to display tips.
---@param actionName string The action name, represented as a string taken among the set of predefined Lua-available actions (you can check the drop down list to see what is available)
---@return string The key associated to the given action name
function System.getActionKeyName(actionName) end

--- Control the display of the Control Unit custom screen, where you can define customized display information in HTML.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param bool boolean True to show the screen, false to hide the screen
function System.showScreen(bool) end

--- Set the content of the Control Unit custom screen with some HTML code.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param content string The HTML content you want to display on the screen widget. You can also use SVG here to make drawings.
function System.setScreen(content) end

--- Create an empty panel.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param label string The title of the panel
---@return string The panel ID, or "" on failure
function System.createWidgetPanel(label) end

--- Destroy the panel.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param panelId string The panel ID
---@return boolean True if the panel has been successfully destroyed, false otherwise
function System.destroyWidgetPanel(panelId) end

--- Create an empty widget and add it to a panel.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param panelId string The panel ID
---@param type string Widget type, determining how it will display data attached to ID
---@return string The widget ID, or "" on failure.
function System.createWidget(panelId, type) end

--- Destroy the widget.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param widgetId string The widget ID
---@return boolean True if the widget has been successfully destroyed, false otherwise
function System.destroyWidget(widgetId) end

--- Create data.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataJson string The data fields as JSON
---@return string The data ID, or "" on failure.
function System.createData(dataJson) end

--- Destroy the data.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataId string The data ID
---@return boolean True if the data has been successfully destroyed, false otherwise
function System.destroyData(dataId) end

--- Update JSON associated to data.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataId string The data ID
---@param dataJson string The data fields as JSON
---@return boolean True if the data has been successfully updated, false otherwise
function System.updateData(dataId, dataJson) end

--- Add data to widget.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataId string The data ID
---@param widgetId string The widget ID
---@return boolean True if the data has been successfully added to the widget, false otherwise
function System.addDataToWidget(dataId, widgetId) end

--- Remove data from widget.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataId string The data ID
---@param widgetId string The widget ID
---@return boolean True if the data has been successfully removed from the widget, false otherwise
function System.removeDataFromWidget(dataId, widgetId) end

--- Return the current value of the mouse wheel
---@return number The current value of the mouse wheel
function System.getMouseWheel() end

--- Return the current value of the mouse delta X
---@return number The current value of the mouse delta X
function System.getMouseDeltaX() end

--- Return the current value of the mouse delta Y
---@return number The current value of the mouse delta Y
function System.getMouseDeltaY() end

--- Return the current value of the mouse pos X
---@return number The current value of the mouse pos X
function System.getMousePosX() end

--- Return the current value of the mouse pos Y
---@return number The current value of the mouse pos Y
function System.getMousePosY() end

--- Return the value of mouse sensitivity game setting
---@return number Sensitivity setting value
function System.getMouseSensitivity() end

--- Return the current value of the screen height
---@return integer The current value of the screen height
function System.getScreenHeight() end

--- Return the current value of the screen width
---@return integer The current value of the screen width
function System.getScreenWidth() end

--- Return the current value of the player's horizontal field of view
---@return number The current value of the player's horizontal field of view
function System.getCameraHorizontalFov() end

---@deprecated System.getFov() is deprecated, use System.getCameraHorizontalFov().
function System.getFov() end

--- Return the current value of the player's vertical field of view
---@return number The current value of the player's vertical field of view
function System.getCameraVerticalFov() end

--- Returns the active camera mode.
---@return integer 1: First Person View, 2: Look Around Construct View, 3: Follow Construct View
function System.getCameraMode() end

--- Checks if the active camera is in first person view.
---@return boolean True if the camera is in first person view, false otherwise
function System.isFirstPerson() end

--- Returns the position of the camera, in construct local coordinates.
---@return table Camera position in construct local coordinates.
function System.getCameraPos() end

--- Returns the position of the camera, in world coordinates.
---@return table Camera position in world coordinates.
function System.getCameraWorldPos() end

--- Returns the forward direction vector of the active camera, in world coordinates.
---@return table Camera forward direction vector in world coordinates.
function System.getCameraWorldForward() end

--- Returns the right direction vector of the active camera, in world coordinates.
---@return table Camera right direction vector in world coordinates.
function System.getCameraWorldRight() end

--- Returns the up direction vector of the active camera, in world coordinates.
---@return table Camera up direction vector in world coordinates.
function System.getCameraWorldUp() end

--- Returns the forward direction vector of the active camera, in construct local coordinates.
---@return table Camera forward direction vector in construct local coordinates.
function System.getCameraForward() end

--- Returns the right direction vector of the active camera, in construct local coordinates.
---@return table Camera right direction vector in construct local coordinates.
function System.getCameraRight() end

--- Returns the up direction vector of the active camera, in construct local coordinates.
---@return table Camera up direction vector in construct local coordinates.
function System.getCameraUp() end

--- Return the current value of the mouse wheel (for the throttle speedUp/speedDown action)
--- This value will go through the control scheme, devices and sensitivity
---@return number The current input
function System.getThrottleInputFromMouseWheel() end

--- Return the mouse input for the ship control action (forward/backward)
--- This value will go through the control scheme to know on which input the mouse is mapped and its current sensitivity
---@return number The current input
function System.getControlDeviceForwardInput() end

--- Return the mouse input for the ship control action  (yaw right/left)
--- This value will go through the control scheme to know on which input the mouse is mapped and its current sensitivity
---@return number The current input
function System.getControlDeviceYawInput() end

--- Return the mouse input for the ship control action  (right/left)
--- This value will go through the control scheme to know on which input the mouse is mapped and its current sensitivity
---@return number The current value of the mouse delta Y
function System.getControlDeviceLeftRightInput() end

--- Lock or unlock the mouse free look.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param state boolean True to lock the view, false to unlock
function System.lockView(state) end

--- Return the lock state of the mouse free look
---@return boolean True if the view is locked, false otherwise
function System.isViewLocked() end

---@deprecated System.freeze() is deprecated, use Player.freeze().
function System.freeze() end

---@deprecated System.isFrozen() is deprecated, use Player.isFrozen().
function System.isFrozen() end

--- Return the current time since the arrival of the Arkship on September 30th, 2017
---@return number Time in seconds
function System.getArkTime() end

---@deprecated System.getTime() is deprecated, use System.getArkTime().
function System.getTime() end

--- Return the current time since January 1st, 1970.
---@return number Time in seconds
function System.getUtcTime() end

--- Return the time offset between local timezone and UTC
---@return number Time in seconds
function System.getUtcOffset() end

--- Return the locale in which the game is currently running
---@return string The locale, currently one of "en-US", "fr-FR", or "de-DE"
function System.getLocale() end

--- Return delta time of action updates (to use in ActionLoop)
---@return number The delta time in seconds
function System.getActionUpdateDeltaTime() end

--- Return the name of the given player, if in range of visibility or broadcasted by a transponder
---@param id integer The ID of the player
---@return string The name of the player
function System.getPlayerName(id) end

--- Return the world position of the given player, if in range of visibility
---@param id integer The ID of the player
---@return table The coordinates of the player in world coordinates
function System.getPlayerWorldPos(id) end

--- Return the item table corresponding to the given item ID.
---@param id integer The ID of the item
---@return table An item table with fields: {[int] id, [string] name, [string] displayName, [string] locDisplayName, [string] displayNameWithSize, [string] locDisplayNameWithSize, [string] description, [string] locDescription, [string] type, [number] unitMass, [number] unitVolume, [integer] tier, [string] size, [string] iconPath, [table] schematics, [table] products}
function System.getItem(id) end

--- Checks if the item is an item of the class identified by its item id
---@param itemId integer The ID of the item
---@param classId integer The item ID of the item class
---@return boolean True if the item is an item of the given class, false otherwise
function System.isItemInClassId(itemId, classId) end

--- Checks if the given item is an item of the class given by its class name
---@param itemId integer The ID of the item
---@param className[string]: The name of the item class
---@return boolean True if the item is an item of the given class, false otherwise
function System.isItemInClass(itemId, className[string]:) end

--- Checks if the given item is a class item
---@param itemId integer The ID of the item
---@return boolean True if the item is a class item, false otherwise
function System.isClassItem(itemId) end

--- Checks if the given item is an element
---@param itemId integer The ID of the item
---@return boolean True if the item is an element, false otherwise
function System.isElementItem(itemId) end

--- Checks if the given item is a material
---@param itemId integer The ID of the item
---@return boolean True if the item is a material, false otherwise
function System.isMaterialItem(itemId) end

--- Checks if the given item is a raw material
---@param itemId integer The ID of the item
---@return boolean True if the item is a raw material, false otherwise
function System.isRawMaterialItem(itemId) end

--- Checks if the given item is a blueprint
---@param itemId integer The ID of the item
---@return boolean True if the item is a blueprint, false otherwise
function System.isBlueprintItem(itemId) end

--- Checks if the given item is a scrap item
---@param itemId integer The ID of the item
---@return boolean True if the item is a scrap item, false otherwise
function System.isScrapItem(itemId) end

--- Checks if the given item is a part
---@param itemId integer The ID of the item
---@return boolean True if the item is a part, false otherwise
function System.isPartItem(itemId) end

--- Checks if the given item is an ammo item
---@param itemId integer The ID of the item
---@return boolean True if the item is an ammo item, false otherwise
function System.isAmmoItem(itemId) end

--- Checks if the given item is a package
---@param itemId integer The ID of the item
---@return boolean True if the item is a package, false otherwise
function System.isPackageItem(itemId) end

--- Checks if the given item is a schematic
---@param itemId integer The ID of the item
---@return boolean True if the item is a schematic, false otherwise
function System.isSchematicItem(itemId) end

--- Returns a list of recipes producing the given item from its id.
---@param itemId integer The ID of the item
---@return table A list of recipe table with field: {[integer] id, [integer] tier,[number] time, [bool] nanocraftable, [table] producers, [table] products:{{[integer] id, [number] quantity},...}, [table] ingredients:{{[integer] id, [number] quantity},...}}
function System.getRecipes(itemId) end

---@deprecated System.getSchematic(id) is deprecated, use System.getRecipes(itemId).tag.
function System.getSchematic() end

--- Returns the corresping organization to the given organization id, if known, e.g. broadcasted by a transponder
---@param id integer The ID of the organization
---@return table A table containing information about the given organization {[string] name, [string] tag}
function System.getOrganization(id) end

---@deprecated System.getOrganizationName() is deprecated, use System.getOrganization(id).name .
function System.getOrganizationName() end

---@deprecated System.getOrganizationTag() is deprecated, use System.getOrganization(id).tag .
function System.getOrganizationTag() end

--- Return the player's world position as a waypoint string, starting with '::pos' (only in explicit runs)
---@return string The waypoint as a string
function System.getWaypointFromPlayerPos() end

--- Set a waypoint at the destination described by the waypoint string, of the form '::pos{...}' (only in explicit runs)
---@param waypointStr string The waypoint as a string
---@param notify boolean (Optional) True to display a notification on waypoint change
function System.setWaypoint(waypointStr, notify) end

--- Clear the active destination waypoint. (only in explicit runs)'
---@param notify boolean (Optional) True to display a notification about the waypoint's clearing
function System.clearWaypoint(notify) end

--- Returns the current instruction count during this tick
---@return integer The current instruction count during this tick
function System.getInstructionCount() end

--- Returns the instruction limit before the CPU overload
---@return integer The instruction limit per tick
function System.getInstructionLimit() end

--- Set the visibility of the helper top menu.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param show boolean True to show the top helper menu, false to hide the top helper menu
function System.showHelper(show) end

--- Play a sound file from your audio folder (located in "My documents/NQ/DualUniverse/audio"). Only one sound can be played at a time.
---@param filePath string Relative path to audio folder (.mp3, .wav)
function System.playSound(filePath) end

--- Checks if a sound is playing
---@return boolean True if a sound is playing, false otherwise
function System.isPlayingSound() end

--- Stop the current playing sound
function System.stopSound() end

--- Print the given string in the Lua chat channel
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param msg string The message to print
function System.print(msg) end

--- Emitted when an action starts
---@param action string The action name, represented as a string taken among the set of predefined Lua-available actions (you can check the drop down list to see what is available)
---@type Event
System.onActionStart = Event:new()

---@type Event
System.actionStart = Event:new()

--- Emitted when an action stops
---@param action string The action name, represented as a string taken among the set of predefined Lua-available actions (you can check the drop down list to see what is available)
---@type Event
System.onActionStop = Event:new()

---@type Event
System.actionStop = Event:new()

--- Emitted at each update as long as the action is maintained
---@param action string The action name, represented as a string taken among the set of predefined Lua-available actions (you can check the drop down list to see what is available)
---@type Event
System.onActionLoop = Event:new()

---@type Event
System.actionLoop = Event:new()

--- Game update event. This is equivalent to a timer set at 0 seconds, as updates will go as fast as the FPS can go
---@type Event
System.onUpdate = Event:new()

---@type Event
System.update = Event:new()

--- Physics update. Do not use to put anything else by a call to updateICC on your Control Unit, as many functions are
--- disabled when called from 'onFlush'. This is only to update the physics (engine control, etc), not to setup some gameplay code
---@type Event
System.onFlush = Event:new()

---@type Event
System.flush = Event:new()

--- A new message has been entered in the Lua tab of the chat, acting like a command line interface
---@param text string The message entered
---@type Event
System.onInputText = Event:new()

---@type Event
System.inputText = Event:new()

--- Emitted when the player changes the camera mode.
---@param mode integer The camera mode, represented by an integer (First Person View = 1, Look Around Construct View = 2, Follow Construct View = 3)
---@type Event
System.onCameraChanged = Event:new()

---@type Event
System.cameraChanged = Event:new()


---@class Telemeter
local Telemeter = {}
--- Show the element widget in the in-game widget stack
function Telemeter.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Telemeter.show() end

--- Hide the element widget in the in-game widget stack
function Telemeter.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Telemeter.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Telemeter.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Telemeter.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Telemeter.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Telemeter.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Telemeter.getDataId() end

--- Returns the element name
---@return string The element's name
function Telemeter.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Telemeter.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Telemeter.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Telemeter.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Telemeter.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Telemeter.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Telemeter.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Telemeter.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Telemeter.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Telemeter.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Telemeter.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Telemeter.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Telemeter.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Telemeter.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Telemeter.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Telemeter.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Telemeter.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Telemeter.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Telemeter.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Telemeter.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Telemeter.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Telemeter.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Telemeter.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Telemeter.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Telemeter.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Telemeter.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Telemeter.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Telemeter.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Telemeter.getSignalOut(plug) end

---@deprecated Telemeter.getDistance() is deprecated, use Telemeter.raycast().distance instead.
function Telemeter.getDistance() end

--- Emits a raycast from the telemeter, returns a raycastHit object
---@return table A table with fields : {[bool] hit, [float] distance, [vec3] point}
function Telemeter.raycast() end

--- Returns telemeter raycast origin in local construct coordinates
---@return table The telemeter raycast origin in local construct coordinates
function Telemeter.getRayOrigin() end

--- Returns telemeter raycast origin in world coordinates
---@return table The telemeter raycast origin in world coordinates
function Telemeter.getRayWorldOrigin() end

--- Returns telemeter raycast axis in local construct coordinates
---@return table The telemeter raycast axis in local construct coordinates
function Telemeter.getRayAxis() end

--- Returns telemeter raycast axis in world coordinates
---@return table The telemeter raycast axis in world coordinates
function Telemeter.getRayWorldAxis() end

--- Returns the max distance from which an obstacle can be detected (default is 100m)
---@return number The max distance to detectable obstacles in meters
function Telemeter.getMaxDistance() end


---@class Transponder
local Transponder = {}
--- Show the element widget in the in-game widget stack
function Transponder.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Transponder.show() end

--- Hide the element widget in the in-game widget stack
function Transponder.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Transponder.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Transponder.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Transponder.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Transponder.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Transponder.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Transponder.getDataId() end

--- Returns the element name
---@return string The element's name
function Transponder.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Transponder.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Transponder.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Transponder.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Transponder.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Transponder.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Transponder.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Transponder.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Transponder.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Transponder.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Transponder.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Transponder.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Transponder.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Transponder.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Transponder.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Transponder.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Transponder.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Transponder.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Transponder.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Transponder.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Transponder.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Transponder.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Transponder.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Transponder.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Transponder.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Transponder.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Transponder.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Transponder.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Transponder.getSignalOut(plug) end

--- Activate the transponder
function Transponder.activate() end

--- Deactivate the transponder
function Transponder.deactivate() end

--- Toggle the state of the transponder
function Transponder.toggle() end

--- Checks if the transponder is active
---@return boolean True if the transponder is active, false otherwise
function Transponder.isActive() end

---@deprecated Transponder.getState() is deprecated, use Transponder.isActive().
function Transponder.getState() end

--- Set the tags list with up to 8 entries
---@param tags table List of up to 8 transponder tag strings
---@return boolean True if transponder tags were set, false if an error occurred
function Transponder.setTags(tags) end

--- Returns the tag list
---@return table List of up to 8 transponder tag strings
function Transponder.getTags() end

--- Emitted when the transponder is started or stopped
---@param active boolean True if the element was activated, false otherwise
---@type Event
Transponder.onToggled = Event:new()

---@type Event
Transponder.toggled = Event:new()


---@class VerticalBooster
local VerticalBooster = {}
--- Show the element widget in the in-game widget stack
function VerticalBooster.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function VerticalBooster.show() end

--- Hide the element widget in the in-game widget stack
function VerticalBooster.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function VerticalBooster.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function VerticalBooster.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function VerticalBooster.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function VerticalBooster.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function VerticalBooster.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function VerticalBooster.getDataId() end

--- Returns the element name
---@return string The element's name
function VerticalBooster.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function VerticalBooster.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function VerticalBooster.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function VerticalBooster.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function VerticalBooster.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function VerticalBooster.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function VerticalBooster.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function VerticalBooster.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function VerticalBooster.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function VerticalBooster.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function VerticalBooster.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function VerticalBooster.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function VerticalBooster.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function VerticalBooster.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function VerticalBooster.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function VerticalBooster.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function VerticalBooster.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function VerticalBooster.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function VerticalBooster.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function VerticalBooster.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function VerticalBooster.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function VerticalBooster.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function VerticalBooster.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function VerticalBooster.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function VerticalBooster.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function VerticalBooster.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function VerticalBooster.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function VerticalBooster.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function VerticalBooster.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number The obstruction ratio of the engine
function VerticalBooster.getObstructionFactor() end

--- Returns the tags of the engine
---@return string Tags of the engine, in a CSV string
function VerticalBooster.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean True to ignore the default engine tags
---@return boolean True if the tags have been applied, false if they have not
function VerticalBooster.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return boolean True if the engine ignores default engine tags, false if not
function VerticalBooster.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function VerticalBooster.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function VerticalBooster.deactivate() end

--- Checks if the engine is active
---@return boolean True if the engine is on, false otherwise
function VerticalBooster.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function VerticalBooster.getState() end

--- Toggle the state of the engine
function VerticalBooster.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function VerticalBooster.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number The thrust of the engine is currently delivering in newtons
function VerticalBooster.getThrust() end

---@deprecated FueledEngine.getMaxThrust() is deprecated, use FueledEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function VerticalBooster.getMaxThrust() end

---@deprecated FueledEngine.getMaxThrustBase() is deprecated, use FueledEngine.getMaxThrust().
function VerticalBooster.getMaxThrustBase() end

--- Returns the minimal thrust the engine can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number The current minimal engine thrust in newtons
function VerticalBooster.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function VerticalBooster.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number The current maximum engine thrust in newtons
function VerticalBooster.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number Usually 1 but can be lower for certain engines
function VerticalBooster.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return boolean True if the torque is enabled on the engine, false otherwise
function VerticalBooster.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function VerticalBooster.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table The engine thrust direction vector in construct local coordinates
function VerticalBooster.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table The torque axis vector in construct local coordinates
function VerticalBooster.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table The engine thrust direction vector in world coordinates
function VerticalBooster.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function VerticalBooster.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table The torque axis vector in world coordinates
function VerticalBooster.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function VerticalBooster.torqueAxis() end

--- Checks if the engine out of fuel
---@return boolean True if the engine is out of fuel, false otherwise
function VerticalBooster.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer The item ID of the fuel currently used
function VerticalBooster.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer The local ID of the fueltank
function VerticalBooster.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return boolean True if the linked tank is functional, false otherwise
function VerticalBooster.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function VerticalBooster.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number The current rate of fuel consumption in m³/(N.s)
function VerticalBooster.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number Usually 1 but can be higher for certain engines at certain speeds
function VerticalBooster.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number The rate of fuel consumption in m3/s
function VerticalBooster.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number The time to half thrust in seconds
function VerticalBooster.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function VerticalBooster.getT50() end

--- Returns the distance to the first object detected in the direction of the thrust
---@return number The distance to the first obstacle in meters
function VerticalBooster.getDistance() end

--- Returns the maximum functional distance from the ground
---@return number The maximum functional distance in meters
function VerticalBooster.getMaxDistance() end


---@class WarpDrive
local WarpDrive = {}
--- Show the element widget in the in-game widget stack
function WarpDrive.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function WarpDrive.show() end

--- Hide the element widget in the in-game widget stack
function WarpDrive.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function WarpDrive.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function WarpDrive.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function WarpDrive.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function WarpDrive.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function WarpDrive.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function WarpDrive.getDataId() end

--- Returns the element name
---@return string The element's name
function WarpDrive.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function WarpDrive.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function WarpDrive.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function WarpDrive.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function WarpDrive.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function WarpDrive.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function WarpDrive.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function WarpDrive.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function WarpDrive.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function WarpDrive.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function WarpDrive.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function WarpDrive.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function WarpDrive.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function WarpDrive.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function WarpDrive.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function WarpDrive.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function WarpDrive.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function WarpDrive.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function WarpDrive.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function WarpDrive.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function WarpDrive.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function WarpDrive.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function WarpDrive.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function WarpDrive.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function WarpDrive.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function WarpDrive.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function WarpDrive.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function WarpDrive.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function WarpDrive.getSignalOut(plug) end

--- Initiate the warp jump process
function WarpDrive.initiate() end

--- Returns the current status of the warp drive
---@return integer The current status of the warp drive (NoWarpDrive = 1, Broken = 2, Warping = 3, ParentWarping = 4, NotAnchored = 5, WarpCooldown = 6, PvPCooldown = 7, MovingChild = 8, NoContainer = 9, PlanetTooClose = 10, DestinationNotSet = 11, DestinationTooClose = 12, DestinationTooFar = 13, NotEnoughWarpCells = 14, Ready = 15)
function WarpDrive.getStatus() end

--- Returns the distance to the current warp destination
---@return number The distance to the current warp destination
function WarpDrive.getDistance() end

--- Returns the construct ID of the current warp destination
---@return integer The construct id of the warp destination
function WarpDrive.getDestination() end

--- Returns the name of the current warp destination construct
---@return string The warp destination name
function WarpDrive.getDestinationName() end

--- Returns the local id of the container linked to the warp drive
---@return integer The local id of the container
function WarpDrive.getContainerId() end

--- Returns the quantity of warp cells available in the linked container
---@return integer The quantity of available warp cells
function WarpDrive.getAvailableWarpCells() end

--- Returns the quantity of warp cells required to warp to the warp destination set
---@return integer The quantity of required warp cells for the jump set
function WarpDrive.getRequiredWarpCells() end


---@class Weapon
local Weapon = {}
--- Show the element widget in the in-game widget stack
function Weapon.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Weapon.show() end

--- Hide the element widget in the in-game widget stack
function Weapon.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Weapon.hide() end

--- Returns the widget type compatible with the element data
---@return string Widget type. "" if invalid.
function Weapon.getWidgetType() end

--- Returns the element data as JSON
---@return string Data as JSON
function Weapon.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Weapon.getData() end

--- Returns the element data ID
---@return string Data ID. "" if invalid
function Weapon.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Weapon.getDataId() end

--- Returns the element name
---@return string The element's name
function Weapon.getName() end

--- Returns the class of the element
---@return string The class name of the Element
function Weapon.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Weapon.getElementClass() end

--- Returns the item id of the class of the Element
---@param return integer The item ID of the item class
function Weapon.getClassId(return) end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number The mass of the element
function Weapon.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer The element item ID
function Weapon.getItemId() end

--- Checks if the element is an element of the class given by its item id
---@param classId integer The item ID of the item class
---@return boolean if the element is a valid element of the given class, false otherwise
function Weapon.isInClassId(classId) end

--- Checks if the element is an element of the class given by its class name
---@param className string The name of the item class
---@return boolean True if the element is a valid element of the given class, false otherwise
function Weapon.isInClass(className) end

--- Returns the unique local ID of the element
---@return integer The element local ID
function Weapon.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Weapon.getId() end

--- Returns the element integrity between 0 and 100
---@return number The integrity value; 0 = Element fully destroyed, 100 = Element fully functional
function Weapon.getIntegrity() end

--- Returns the element's current hitpoints (0 = destroyed)
---@return number The current element hitpoints
function Weapon.getHitPoints() end

--- Returns the element's maximal hitpoints
---@return number The maximum element hitpoints
function Weapon.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer The number of restorations before the element is ultimately destroyed
function Weapon.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer The max number of restorations of the element
function Weapon.getMaxRestorations() end

--- Returns the position of the element in construct local coordinates.
---@return table The position of the element in construct local coordinates
function Weapon.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table The dimensions of the element bounding box
function Weapon.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table The dimensions the position of the center of bounding box
function Weapon.getBoundingBoxCenter() end

--- Returns the up direction vector of the element in construct local coordinates
---@return table Up direction vector of the element in construct local coordinates
function Weapon.getUp() end

--- Returns the right direction vector of the element in construct local coordinates
---@return table Right direction vector of the element in construct local coordinates
function Weapon.getRight() end

--- Returns the forward direction vector of the element in construct local coordinates
---@return table Forward direction vector of the element in construct local coordinates
function Weapon.getForward() end

--- Returns the up direction vector of the element in world coordinates
---@return table Up direction vector of the element in world coordinates
function Weapon.getWorldUp() end

--- Returns the right direction vector of the element in world coordinates
---@return table Right direction vector of the element in world coordinates
function Weapon.getWorldRight() end

--- Returns the forward direction vector of the element in world coordinates
---@return table Forward direction vector of the Element in world coordinates
function Weapon.getWorldForward() end

--- Returns the Element IN plug map
---@return table The IN plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Weapon.getInPlugs() end

--- Returns the Element OUT plug map
---@return table The OUT plug map of the Element as a table with fields per plug: {[int] type, [string] name, [int nullable] elementId, [bool] isRestricted, [list nullable] restrictedIds}
function Weapon.getOutPlugs() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function Weapon.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Weapon.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer The plug signal state
function Weapon.getSignalOut(plug) end

--- Returns the item id of the currently equipped ammo
---@return integer The item id of the ammunition in the weapon
function Weapon.getAmmo() end

--- Returns the current amount of remaining ammunition
---@return integer The remaining ammunition count (0 when reloading)
function Weapon.getAmmoCount() end

--- Returns the maximum amount of ammunition the weapon can carry
---@return integer The maximum amount of ammunition
function Weapon.getMaxAmmo() end

--- Checks if the weapon is out of ammo
---@return boolean True if the weapon is out of ammo, false otherwise
function Weapon.isOutOfAmmo() end

--- Checks if the weapon is operational
---@return integer 1 if the weapon is operational, otherwise 0 = broken, -1 = incompatible size
function Weapon.getOperationalState() end

---@deprecated Weapon.isOperational() is deprecated, use Weapon.getOperationalState() instead.
function Weapon.isOperational() end

--- Returns the current weapon status
---@return integer The current status of the weapon (Idle = 1, Firing = 2, Stopping = 3, Reloading = 4, Unloading = 5, FiringBlocked = 6)
function Weapon.getStatus() end

--- Returns the local id of the container linked to the weapon
---@return integer The local id of the container
function Weapon.getContainerId() end

--- Returns the current hit probability of the weapon for the current target
---@return number The hit probability of the weapon
function Weapon.getHitProbability() end

--- Returns the base weapon damage
---@return number The base weapon damage in hitpoints
function Weapon.getBaseDamage() end

--- Returns the optimal aim cone
---@return number The optimal aim cone in degrees
function Weapon.getOptimalAimingCone() end

--- Returns the optimal distance to target
---@return number The optimal distance in meters
function Weapon.getOptimalDistance() end

--- Returns the maximum distance to target
---@return number The optimal distance in meters
function Weapon.getMaxDistance() end

--- Returns the optimal tracking rate
---@return number The optimal tracking rate in degrees per second
function Weapon.getOptimalTracking() end

--- Returns the magazine volume
---@return number The magazine volume in liters
function Weapon.getMagazineVolume() end

--- Returns the weapon cycle time
---@return number The weapon cycle time in seconds
function Weapon.getCycleTime() end

--- Returns the weapon reload time
---@return number The weapon reload time in seconds
function Weapon.getReloadTime() end

--- Returns the weapon unload time
---@return number The weapon unload time in seconds
function Weapon.getUnloadTime() end

--- Returns the id of the current target construct of the weapon
---@return integer The target construct id
function Weapon.getTargetId() end

--- Emitted when the weapon start reloading
---@param ammoId integer The item id of the ammo
---@type Event
Weapon.onReload = Event:new()

--- Emitted when the weapon has reloaded
---@param ammoId integer The item id of the ammo
---@type Event
Weapon.onReloaded = Event:new()

--- Emitted when the weapon has missed its target
---@param targetId integer The construct id of the target
---@type Event
Weapon.onMissed = Event:new()

--- Emitted when the weapon target has been destroyed
---@param targetId integer The construct id of the target
---@type Event
Weapon.onDestroyed = Event:new()

--- Emitted when an element on the weapon target has been destroyed
---@param targetId integer The construct id of the target
---@param itemId integer The item id of the destroyed element
---@type Event
Weapon.onElementDestroyed = Event:new()

--- Emitted when the weapon has hit
---@param targetId integer The construct id of the target
---@param damage number The damage amount dealt by the hit
---@type Event
Weapon.onHit = Event:new()


library = Library()

system = System()

unit = ControlUnit()

player = Player()

construct = Construct()

DULibrary = Library()

DUSystem = System()

DUPlayer = Player()

DUConstruct = Construct()