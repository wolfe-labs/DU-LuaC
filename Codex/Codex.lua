---@class Adjustor
function Adjustor()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function self.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function self.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function self.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function self.isIgnoringTags() end

--- Start the adjustor at full power (works only when run inside a cockpit or under remote control)
function self.activate() end

--- Stops the adjustor (works only when run inside a cockpit or under remote control)
function self.deactivate() end

--- Checks if the adjustor is active
---@return integer 
function self.isActive() end

---@deprecated Adjustor.getState() is deprecated, use Adjustor.isActive().
function self.getState() end

--- Toggle the state of the adjustor
function self.toggle() end

--- Set the exhaust thrust of the adjustor
---@param thrust number The adjustor thrust in newtons (limited by the maximum thrust)
function self.setThrust(thrust) end

--- Returns the current exhaust thrust of the adjustor
---@return number 
function self.getThrust() end

--- Returns the maximal exhaust thrust the adjustor can deliver
---@return number 
function self.getMaxThrust() end

---@deprecated Adjustor.getMaxThrustBase() is deprecated, use Adjustor.getMaxThrust().
function self.getMaxThrustBase() end

--- Returns the adjustor exhaust thrust direction in construct local coordinates
---@return table 
function self.getThrustAxis() end

--- Returns the adjustor torque axis in construct local coordinates
---@return table 
function self.getTorqueAxis() end

--- Returns the adjustor exhaust thrust direction in world coordinates
---@return table 
function self.getWorldThrustAxis() end

---@deprecated Adjustor.thrustAxis() is deprecated, use Adjustor.getWorldThrustAxis().
function self.thrustAxis() end

--- Returns the adjustor torque axis in world coordinates
---@return table 
function self.getWorldTorqueAxis() end

---@deprecated Adjustor.torqueAxis() is deprecated, use Adjustor.getWorldTorqueAxis().
function self.torqueAxis() end

---@deprecated Adjustor.isOutOfFuel() is deprecated.
function self.isOutOfFuel() end

---@deprecated Adjustor.hasFunctionalFuelTank() is deprecated.
function self.hasFunctionalFuelTank() end

---@deprecated Adjustor.getCurrentFuelRate()
function self.getCurrentFuelRate() end

---@deprecated Adjustor.getFuelRateEfficiency()
function self.getFuelRateEfficiency() end

---@deprecated Adjustor.getFuelConsumption()
function self.getFuelConsumption() end

---@deprecated Adjustor.getDistance()
function self.getDistance() end

---@deprecated Adjustor.getT50() is deprecated.
function self.getT50() end

return self
end

---@class Airbrake
function Airbrake()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function self.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function self.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function self.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function self.isIgnoringTags() end

--- Start the brake at full power (works only when run inside a cockpit or under remote control)
function self.activate() end

--- Stops the brake (works only when run inside a cockpit or under remote control)
function self.deactivate() end

--- Checks if the brake is active
---@return integer 
function self.isActive() end

---@deprecated BrakeEngine.getState() is deprecated, use BrakeEngine.isActive().
function self.getState() end

--- Toggle the state of the brake
function self.toggle() end

--- Set the thrust of the brake. Note that brakes can generate a force only in the movement opposite direction
---@param thrust number The brake thrust in newtons (limited by the maximum thrust)
function self.setThrust(thrust) end

--- Returns the current thrust of the brake
---@return number 
function self.getThrust() end

---@deprecated BrakeEngine.getMaxThrust() is deprecated, use BrakeEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function self.getMaxThrust() end

---@deprecated BrakeEngine.getMaxThrustBase() is deprecated, use BrakeEngine.getMaxThrust().
function self.getMaxThrustBase() end

--- Returns the minimal thrust the brake can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number 
function self.getCurrentMinThrust() end

---@deprecated BrakeEngine.getMinThrust() is deprecated, use BrakeEngine.getCurrentMinThrust().
function self.getMinThrust() end

--- Returns the maximal thrust the brake can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the brake
---@return number 
function self.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function self.getMaxThrustEfficiency() end

--- Returns the brake thrust direction in construct local coordinates
---@return table 
function self.getThrustAxis() end

--- Returns the brake thrust direction in world coordinates
---@return table 
function self.getWorldThrustAxis() end

---@deprecated BrakeEngine.thrustAxis() is deprecated, use BrakeEngine.getWorldThrustAxis().
function self.thrustAxis() end

---@deprecated BrakeEngine.isOutOfFuel() is deprecated.
function self.isOutOfFuel() end

---@deprecated BrakeEngine.hasFunctionalFuelTank() is deprecated.
function self.hasFunctionalFuelTank() end

---@deprecated BrakeEngine.getCurrentFuelRate() is deprecated.
function self.getCurrentFuelRate() end

---@deprecated BrakeEngine.getFuelRateEfficiency() is deprecated.
function self.getFuelRateEfficiency() end

---@deprecated BrakeEngine.getFuelConsumption() is deprecated.
function self.getFuelConsumption() end

---@deprecated BrakeEngine.getDistance() is deprecated.
function self.getDistance() end

---@deprecated BrakeEngine.getT50() is deprecated.
function self.getT50() end

---@deprecated BrakeEngine.torqueAxis() is deprecated.
function self.torqueAxis() end

return self
end

---@class Airfoil
function Airfoil()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function self.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function self.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function self.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function self.isIgnoringTags() end

--- Returns the current lift of the airfoil
---@return number 
function self.getLift() end

---@deprecated Airfoil.getThrust() is deprecated, use Airfoil.getLift().
function self.getThrust() end

--- Gives the maximum lift that the airfoil can generate, under optimal conditions.
--- Note that the actual maximum lift will most of the time be less than this value
---@return number 
function self.getMaxLift() end

---@deprecated Airfoil.getMaxThrustBase() is deprecated, use Airfoil.getMaxLift().
function self.getMaxThrustBase() end

--- Returns the current drag of the airfoil
---@return number 
function self.getDrag() end

--- The ratio between lift and drag, depending of the aerodynamic profile of the airfoil
---@return number 
function self.getDragRatio() end

--- Returns the minimal lift the airfoil can deliver at the moment (can be higher than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
---@return number 
function self.getCurrentMinLift() end

---@deprecated Airfoil.getMinThrust() is deprecated, use Airfoil.getCurrentMinLift().
function self.getMinThrust() end

--- Returns the maximal lift the aifoil can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual lift will be
--- anything below this maximum lift, which defines the current max capability of the airfoil
---@return number 
function self.getCurrentMaxLift() end

---@deprecated Airfoil.getMaxThrust() is deprecated, use Airfoil.getCurrentMaxLift().
function self.getMaxThrust() end

--- Returns the ratio between the current maximum lift and the optimal maximum lift
---@return number 
function self.getMaxLiftEfficiency() end

---@deprecated Airfoil.getMaxThrustEfficiency() is deprecated, use Airfoil.getMaxLiftEfficiency().
function self.getMaxThrustEfficiency() end

--- Returns the airfoil lift direction in construct local coordinates
---@return table 
function self.getLiftAxis() end

--- Returns the airfoil torque axis in construct local coordinates
---@return table 
function self.getTorqueAxis() end

--- Returns the airfoil lift direction in world coordinates
---@return table 
function self.getWorldLiftAxis() end

---@deprecated Airfoil.thrustAxis() is deprecated, use Airfoil.getWorldLiftAxis().
function self.thrustAxis() end

--- Returns the adjustor torque axis in world coordinates
---@return table 
function self.getWorldTorqueAxis() end

---@deprecated Airfoil.torqueAxis() is deprecated, use Airfoil.getWorldTorqueAxis().
function self.torqueAxis() end

--- Checks if the airfoil is stalled
---@return integer 
function self.isStalled() end

--- Returns the airfoil stall angle
---@return number 
function self.getStallAngle() end

--- Returns the minimum angle to produce the maximum lift of the airfoil
--- Note that the airfoil will produce lift at a lower angle but not optimally
---@return number 
function self.getMinAngle() end

--- Returns the maximum angle to produce the maximum lift of the airfoil
--- Note that the airfoil will produce lift at a higher angle but not optimally
---@return number 
function self.getMaxAngle() end

---@deprecated Airfoil.activate() is deprecated.
function self.activate() end

---@deprecated Airfoil.deactivate() is deprecated.
function self.deactivate() end

---@deprecated Airfoil.getState() is deprecated.
function self.getState() end

---@deprecated Airfoil.toggle() is deprecated.
function self.toggle() end

---@deprecated Airfoil.setThrust(thrust) is deprecated.
function self.setThrust() end

---@deprecated Airfoil.isOutOfFuel() is deprecated.
function self.isOutOfFuel() end

---@deprecated Airfoil.hasFunctionalFuelTank() is deprecated.
function self.hasFunctionalFuelTank() end

---@deprecated Airfoil.getCurrentFuelRate() is deprecated.
function self.getCurrentFuelRate() end

---@deprecated Airfoil.getFuelRateEfficiency() is deprecated.
function self.getFuelRateEfficiency() end

---@deprecated Airfoil.getFuelConsumption() is deprecated.
function self.getFuelConsumption() end

---@deprecated Airfoil.getDistance() is deprecated.
function self.getDistance() end

---@deprecated Airfoil.getT50() is deprecated.
function self.getT50() end

return self
end

---@class AntiGravityGenerator
function AntiGravityGenerator()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Activate the anti-gravity generator
function self.activate() end

--- Deactivate the anti-gravity generator
function self.deactivate() end

--- Returns the state of activation of the anti-gravity generator
---@return integer 
function self.isActive() end

---@deprecated AntiGravityGenerator.getState() is deprecated, use AntiGravityGenerator.isActive() instead.
function self.getState() end

--- Toggle the anti-gravity generator
function self.toggle() end

--- Returns the strength of the anti-gravitational field
---@return number 
function self.getFieldStrength() end

--- Returns the current rate of compensation of the gravitational field
---@return number 
function self.getCompensationRate() end

--- Returns the current power of the gravitational field
---@return number 
function self.getFieldPower() end

--- Returns the number of pulsors linked to the anti-gravity generator
---@return integer 
function self.getPulsorCount() end

--- Set the target altitude for the anti-gravity field. Cannot be called from onFlush
---@param altitude number The target altitude in meters. It will be reached with a slow acceleration (not instantaneous)
function self.setTargetAltitude(altitude) end

---@deprecated AntiGravityGenerator.setBaseAltitude(altitude) is deprecated, use AntiGravityGenerator.setTargetAltitude(altitude) instead.
function self.setBaseAltitude() end

--- Returns the target altitude defined for the anti-gravitational field
---@return number 
function self.getTargetAltitude() end

--- Returns the current base altitude of the anti-gravitational field
---@return number 
function self.getBaseAltitude() end

return self
end

---@class AtmosphericEngine
function AtmosphericEngine()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function self.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function self.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function self.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function self.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function self.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function self.deactivate() end

--- Checks if the engine is active
---@return integer 
function self.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function self.getState() end

--- Toggle the state of the engine
function self.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function self.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number 
function self.getThrust() end

---@deprecated FueledEngine.getMaxThrust() is deprecated, use FueledEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function self.getMaxThrust() end

---@deprecated FueledEngine.getMaxThrustBase() is deprecated, use FueledEngine.getMaxThrust().
function self.getMaxThrustBase() end

--- Returns the minimal thrust the engine can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number 
function self.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function self.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number 
function self.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function self.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return integer 
function self.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function self.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table 
function self.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table 
function self.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table 
function self.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function self.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table 
function self.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function self.torqueAxis() end

--- Checks if the engine out of fuel
---@return integer 
function self.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer 
function self.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer 
function self.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return integer 
function self.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function self.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number 
function self.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number 
function self.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number 
function self.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number 
function self.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function self.getT50() end

---@deprecated AtmosphericEngine.getDistance() is deprecated.
function self.getDistance() end

return self
end

---@class BaseShieldGenerator
function BaseShieldGenerator()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Activate the shield
function self.activate() end

--- Deactivate the shield
function self.deactivate() end

--- Toggle the state of the shield
function self.toggle() end

--- Returns the activation state of the shield
---@return integer 
function self.isActive() end

---@deprecated BaseShieldGenerator.getState() is deprecated, use BaseShieldGenerator.isActive() instead.
function self.getState() end

--- Returns the current hit points of the shield
---@return number 
function self.getShieldHitpoints() end

--- Returns the maximal hit points of the shield
---@return number 
function self.getMaxShieldHitpoints() end

--- Returns distribution of resistance pool over resistance types
---@return table resistances Resistance to damage type {antimatter, electromagnetic, kinetic, thermic}
function self.getResistances() end

--- Distribute the resistance pool according to damage type
---@param antimatter number Antimatter damage resistance
---@param electromagnetic number Electromagnetic damage resistance
---@param kinetic number Kinetic damage resistance
---@param thermic number Thermic damage resistance
---@return integer 
function self.setResistances(antimatter, electromagnetic, kinetic, thermic) end

--- Returns time after which adjusting resistances is possible again
---@return number 
function self.getResistancesCooldown() end

--- Returns maximal cooldown between adjusting resistances
---@return number 
function self.getResistancesMaxCooldown() end

--- Returns total resistance pool that may be distributed
---@return number 
function self.getResistancesPool() end

--- Returns the remaining amount of the resistance pool that can be distributed
---@return number 
function self.getResistancesRemaining() end

--- Returns ratio per damage type of recent weapon impacts after applying resistance
---@return table stress Stress ratio due to damage type {antimatter, electromagnetic, kinetic, thermic}
function self.getStressRatio() end

--- Returns ratio per damage type of recent weapon impacts without resistance
---@return table stress Stress ratio due to damage type {antimatter, electromagnetic, kinetic, thermic}
function self.getStressRatioRaw() end

--- Returns stress, that is the total hit points of recent weapon impacts after applying resistance
---@return number 
function self.getStressHitpoints() end

--- Returns stress, that is the total hit points of recent weapon impacts without resistance
---@return number 
function self.getStressHitpointsRaw() end

--- Returns whether the base shield is currently in lockdown
---@return integer 
function self.inLockdown() end

--- Returns the remaining time of the base shield lockdown
---@return number 
function self.getLockdownRemaining() end

--- Returns the hour since midnight of the preferred lockdown exit
---@return integer 
function self.getLockdownExitTime() end

--- Set hour since midnight for the preferred lockdown exit
---@param hour integer Preferred lockdown exit hour UTC
---@return integer 
function self.setLockdownExitTime(hour) end

--- Emitted when we started or stopped the shield generator
---@param active integer 1 if the element was activated, 0 otherwise
---@type Event
self.onToggled = Event:new()

---@type Event
self.toggled = Event:new()

--- Emitted when the shield absorbed incoming damage
---@param hitpoints number Damage the shield absorbed
---@param rawHitpoints number Total damage without taking resistances into account
---@type Event
self.onAbsorbed = Event:new()

---@type Event
self.absorbed = Event:new()

--- Emitted when the shield hit points reached 0 due to damage
---@type Event
self.onDown = Event:new()

---@type Event
self.down = Event:new()

--- Emitted when the shield hit points were fully restored
---@type Event
self.onRestored = Event:new()

---@type Event
self.restored = Event:new()

--- Emitted when the shield enters lockdown
---@type Event
self.onEnterLockdown = Event:new()

---@type Event
self.enterLockdown = Event:new()

--- Emitted when the shield exits the lockdown
---@type Event
self.onLeaveLockdown = Event:new()

---@type Event
self.leaveLockdown = Event:new()

return self
end

---@class BrakeEngine
function BrakeEngine()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function self.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function self.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function self.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function self.isIgnoringTags() end

--- Start the brake at full power (works only when run inside a cockpit or under remote control)
function self.activate() end

--- Stops the brake (works only when run inside a cockpit or under remote control)
function self.deactivate() end

--- Checks if the brake is active
---@return integer 
function self.isActive() end

---@deprecated BrakeEngine.getState() is deprecated, use BrakeEngine.isActive().
function self.getState() end

--- Toggle the state of the brake
function self.toggle() end

--- Set the thrust of the brake. Note that brakes can generate a force only in the movement opposite direction
---@param thrust number The brake thrust in newtons (limited by the maximum thrust)
function self.setThrust(thrust) end

--- Returns the current thrust of the brake
---@return number 
function self.getThrust() end

---@deprecated BrakeEngine.getMaxThrust() is deprecated, use BrakeEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function self.getMaxThrust() end

---@deprecated BrakeEngine.getMaxThrustBase() is deprecated, use BrakeEngine.getMaxThrust().
function self.getMaxThrustBase() end

--- Returns the minimal thrust the brake can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number 
function self.getCurrentMinThrust() end

---@deprecated BrakeEngine.getMinThrust() is deprecated, use BrakeEngine.getCurrentMinThrust().
function self.getMinThrust() end

--- Returns the maximal thrust the brake can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the brake
---@return number 
function self.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function self.getMaxThrustEfficiency() end

--- Returns the brake thrust direction in construct local coordinates
---@return table 
function self.getThrustAxis() end

--- Returns the brake thrust direction in world coordinates
---@return table 
function self.getWorldThrustAxis() end

---@deprecated BrakeEngine.thrustAxis() is deprecated, use BrakeEngine.getWorldThrustAxis().
function self.thrustAxis() end

---@deprecated BrakeEngine.isOutOfFuel() is deprecated.
function self.isOutOfFuel() end

---@deprecated BrakeEngine.hasFunctionalFuelTank() is deprecated.
function self.hasFunctionalFuelTank() end

---@deprecated BrakeEngine.getCurrentFuelRate() is deprecated.
function self.getCurrentFuelRate() end

---@deprecated BrakeEngine.getFuelRateEfficiency() is deprecated.
function self.getFuelRateEfficiency() end

---@deprecated BrakeEngine.getFuelConsumption() is deprecated.
function self.getFuelConsumption() end

---@deprecated BrakeEngine.getDistance() is deprecated.
function self.getDistance() end

---@deprecated BrakeEngine.getT50() is deprecated.
function self.getT50() end

---@deprecated BrakeEngine.torqueAxis() is deprecated.
function self.torqueAxis() end

return self
end

---@class Construct
function Construct()
local self = {}

--- Returns the name of the construct
---@return string 
function self.getName() end

--- Returns the construct unique ID
---@return integer 
function self.getId() end

--- Returns the owner entity
---@return table entity The owner entity table with fields {[int] id, [bool] isOrganization} describing the owner. Use system.getPlayerName(id) and system.getOrganization(id) to retrieve info about it
function self.getOwner() end

--- Returns the creator entity
---@return integer entity The owner entity table with fields {[int] id, [bool] isOrganization} describing the owner. Use system.getPlayerName(id) and system.getOrganization(id) to retrieve info about it
function self.getCreator() end

--- Checks if the construct is currently warping
---@return integer 
function self.isWarping() end

--- Returns the current warp state
---@return integer state The current warp state index (Idle = 1, Engage = 2, Align = 3, Spool = 4, Accelerate = 5, Cruise = 6, Decelerate = 7, Stopping = 8, Disengage = 9)
function self.getWarpState() end

--- Checks if the construct is in PvP zone
---@return integer 
function self.isInPvPZone() end

--- Returns the distance between the construct and the nearest safe zone
---@return number distance The distance to the nearest safe zone border in meters. Positive value if the construct is outside of any safe zone
function self.getDistanceToSafeZone() end

--- Returns the current construct PvP timer state
---@return number time The remaining time of the PvP timer, or 0.0 if elapsed
function self.getPvPTimer() end

--- Returns the mass of the construct
---@return number 
function self.getMass() end

--- Returns the inertial mass of the construct, calculated as 1/3 of the trace of the inertial tensor
---@return number 
function self.getInertialMass() end

--- Returns the inertial tensor of the construct
---@return table 
function self.getInertialTensor() end

--- Returns the position of the center of mass of the construct, in local construct coordinates
---@return table 
function self.getCenterOfMass() end

--- Returns the position of the center of mass of the construct, in world coordinates
---@return table 
function self.getWorldCenterOfMass() end

--- Returns the construct's cross sectional surface in the current direction of movement
---@return number value The construct's surface exposed in the current direction of movement in meters square
function self.getCrossSection() end

--- Returns the size of the building zone of the construct
---@return table 
function self.getSize() end

--- Returns the size of the bounding box of the construct
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the construct in local construct coordinates
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the max speed along current moving direction
---@return number value The max speed along current moving direction in m/s
function self.getMaxSpeed() end

--- Returns the max angular speed
---@return number value The max angular speed in rad/s
function self.getMaxAngularSpeed() end

--- Returns the max speed per axis
---@return table value The max speed along axes {x, -x, y, -y, z, -z} in m/s
function self.getMaxSpeedPerAxis() end

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
---@return table value The kinematics parameters in Newtons in the order: atmoRange.FMaxPlus, atmoRange.FMaxMinus, spaceRange.FMaxPlus, spaceRange.FMaxMinus
function self.getMaxThrustAlongAxis(taglist, CRefAxis) end

--- Returns the current braking force generated by construct brakes
---@return number value The current braking force in Newtons
function self.getCurrentBrake() end

--- Returns the maximum braking force that can currently be generated by the construct brakes
---@return number value The maximum braking force in Newtons
function self.getMaxBrake() end

--- Returns the world position of the construct
---@return table value The xyz world coordinates of the construct center position in meters
function self.getWorldPosition() end

--- The construct's linear velocity, relative to its parent, in construct local coordinates
---@return table value Relative linear velocity vector, in construct local coordinates in m/s
function self.getVelocity() end

--- The construct's linear velocity, relative to its parent, in world coordinates
---@return table value Relative linear velocity vector, in world coordinates in m/s
function self.getWorldVelocity() end

--- The construct's absolute linear velocity, in construct local coordinates
---@return table value Absolute linear velocity vector, in construct local coordinates in m/s
function self.getAbsoluteVelocity() end

--- The construct's absolute linear velocity, in world coordinates
---@return table value Absolute linear velocity vector, in world coordinates in m/s
function self.getWorldAbsoluteVelocity() end

--- The construct's linear acceleration, in construct local coordinates
---@return table value Linear acceleration vector, in construct local coordinates in m/s2
function self.getAcceleration() end

--- The construct's linear acceleration, in world coordinates
---@return table value Linear acceleration vector, in world coordinates in m/s2
function self.getWorldAcceleration() end

--- The construct's angular velocity, in construct local coordinates
---@return table value Angular velocity vector, in construct local coordinates in rad/s
function self.getAngularVelocity() end

--- The construct's angular velocity, in world coordinates
---@return table value Angular velocity vector, in world coordinates in rad/s
function self.getWorldAngularVelocity() end

--- The construct's angular acceleration, in construct local coordinates
---@return table value Angular acceleration vector, in construct local coordinates in rad/s2
function self.getAngularAcceleration() end

--- The construct's angular acceleration, in world coordinates
---@return table value Angular acceleration vector, in world coordinates in rad/s2
function self.getWorldAngularAcceleration() end

--- Returns the acceleration generated by air resistance
---@return table value The xyz world acceleration generated by air resistance
function self.getWorldAirFrictionAcceleration() end

--- Returns the acceleration torque generated by air resistance
---@return table value The xyz world acceleration torque generated by air resistance
function self.getWorldAirFrictionAngularAcceleration() end

--- Returns the speed at which your construct will suffer damage due to friction with the air
---@return number value The construct speed to get damages due to friction in m/s
function self.getFrictionBurnSpeed() end

--- Returns the forward vector of the construct coordinates system
---@return table value The forward vector of the construct coordinates system. It's a static value equal to (0,1,0)
function self.getForward() end

--- Returns the right vector of the construct coordinates system
---@return table value The right vector of the construct coordinates system. It's a static value equal to (1,0,0)
function self.getRight() end

--- Returns the up direction vector of the construct coordinates system
---@return table value The up vector of the construct coordinates system.. It's a static value equal to (0,0,1)
function self.getUp() end

--- Returns the forward direction vector of the construct, in world coordinates
---@return table value The forward direction vector of the construct, in world coordinates
function self.getWorldForward() end

--- Returns the right direction vector of the construct, in world coordinates
---@return table value The right direction vector of the construct, in world coordinates
function self.getWorldRight() end

--- Returns the up direction vector of the construct, in world coordinates
---@return table value The up direction vector of the construct, in world coordinates
function self.getWorldUp() end

--- Returns the local id of the current active orientation unit (core unit or gyro unit)
---@return integer value local id of the current active orientation unit (core unit or gyro unit)
function self.getOrientationUnitId() end

--- Returns the forward direction vector of the active orientation unit, in construct local coordinates
---@return table value Forward direction vector of the active orientation unit, in construct local coordinates
function self.getOrientationForward() end

--- Returns the right direction vector of the active orientation unit, in construct local coordinates
---@return table value Right direction vector of the active orientation unit, in construct local coordinates
function self.getOrientationRight() end

--- Returns the up direction vector of the active orientation unit, in construct local coordinates
---@return table value Up direction vector of the active orientation unit, in construct local coordinates
function self.getOrientationUp() end

--- Returns the forward direction vector of the active orientation unit, in world coordinates
---@return table value Forward direction vector of the active orientation unit, in world coordinates
function self.getWorldOrientationForward() end

--- Returns the right direction vector of the active orientation unit, in world coordinates
---@return table value Right direction vector of the active orientation unit, in world coordinates
function self.getWorldOrientationRight() end

--- Returns the up direction vector of the active orientation unit, in world coordinates
---@return table value Up direction vector of the active orientation unit, in world coordinates
function self.getWorldOrientationUp() end

--- Returns the id of the parent construct of our active construct
---@return integer 
function self.getParent() end

--- Returns the id of the nearest constructs, on which the construct can dock
---@return integer 
function self.getClosestParent() end

--- Returns the list of ids of nearby constructs, on which the construct can dock
---@return table 
function self.getCloseParents() end

--- Returns the position of the construct's parent when docked in local coordinates
---@return table value The position of the construct's parent in local coordinates
function self.getParentPosition() end

--- Returns the position of the construct's parent when docked in world coordinates
---@return table value The position of the construct's parent in world coordinates
function self.getParentWorldPosition() end

--- Returns the construct's parent forward direction vector, in local coordinates
---@return table value The construct's parent forward direction vector, in local coordinates
function self.getParentForward() end

--- Returns the construct's parent right direction vector, in construct local coordinates
---@return table value The construct's parent right direction vector, in construct local coordinates
function self.getParentRight() end

--- Returns the construct's parent up direction vector, in construct local coordinates
---@return table value The construct's parent up direction vector, in construct local coordinates
function self.getParentUp() end

--- Returns the construct's parent forward direction vector, in world coordinates
---@return table value The construct's parent forward direction vector, in world coordinates
function self.getParentWorldForward() end

--- Returns the construct's parent right direction vector, in world coordinates
---@return table value The construct's parent right direction vector, in world coordinates
function self.getParentWorldRight() end

--- Returns the construct's parent up direction vector, in world coordinates
---@return table value The construct's parent up direction vector, in world coordinates
function self.getParentWorldUp() end

--- Returns the list of player IDs on board the construct
---@return table 
function self.getPlayersOnBoard() end

--- Returns the list of player ids on board the construct inside a VR Station
---@return table 
function self.getPlayersOnBoardInVRStation() end

--- Checks if the given player is on board in the construct
---@param id integer The player id
---@return integer 
function self.isPlayerBoarded(id) end

--- Returns 1 if the given player is boarded to the construct inside a VR Station
---@param id integer The player id
---@return integer 
function self.isPlayerBoardedInVRStation(id) end

--- Returns the mass of the given player or surrogate if it is on board the construct
---@param id integer The player id
---@return number 
function self.getBoardedPlayerMass(id) end

--- Returns the mass of the given player if in VR station on board the construct
---@param id integer The player id
---@return number 
function self.getBoardedInVRStationAvatarMass(id) end

--- Returns the list of IDs of constructs docked to the construct
---@return table 
function self.getDockedConstructs() end

--- Checks if the given construct is docked to the construct
---@param id integer The construct id
---@return integer 
function self.isConstructDocked(id) end

--- Returns the mass of the given construct if it is docked to the construct
---@param id integer The construct id
---@return number 
function self.getDockedConstructMass(id) end

--- Sets the docking mode
---@param mode integer The docking mode (Manual = 0, Automatic = 1, Semi-automatic = 2)
---@return integer 
function self.setDockingMode(mode) end

--- Returns the current docking mode
---@return integer mode The docking mode (Manual = 0, Automatic = 1, Semi-automatic = 2)
function self.getDockingMode() end

--- Sends a request to dock to the given construct. Limited to piloting controllers
---@param id integer The parent construct id
---@return integer 
function self.dock(id) end

--- Sends a request to undock the construct. Limited to piloting controllers
---@return integer 
function self.undock() end

--- Sends a request to deboard a player or surrogate with the given id
---@param id integer The player id
---@return integer 
function self.forceDeboard(id) end

--- Sends a request to undock a construct with the given id
---@param id integer The construct id
---@return integer 
function self.forceUndock(id) end

--- Sends a request to interrupt the surrogate session of a player with the given id
---@param id integer The player id
---@return integer 
function self.forceInterruptVRSession(id) end

--- Emitted when the construct becomes docked
---@param id integer The parent id
---@type Event
self.onDocked = Event:new()

--- Emitted when the construct is undocked
---@param id integer The previous parent id
---@type Event
self.onUndocked = Event:new()

--- Emitted when a player or surrogate boards the construct
---@param id integer The id of the boarding player
---@type Event
self.onPlayerBoarded = Event:new()

--- Emitted when a player enters a VR Station
---@param id integer The id of the boarding player
---@type Event
self.onVRStationEntered = Event:new()

--- Emitted when another construct docks this construct
---@param id integer The id of the docking construct
---@type Event
self.onConstructDocked = Event:new()

--- Emitted when the PvP timer started or elapsed
---@param active boolean 1 if the timer started, false when the timer elapsed
---@type Event
self.onPvPTimer = Event:new()

return self
end

---@class Container
function Container()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the mass of the container element(as if it were empty).
---@return number 
function self.getSelfMass() end

--- Returns the container content mass(the sum of the mass of all items it contains).
---@return number 
function self.getItemsMass() end

--- Returns the container content volume(the sum of the volume of all items it contains).
---@return number 
function self.getItemsVolume() end

--- Returns the maximum volume of the container.
---@return number 
function self.getMaxVolume() end

--- Returns a table describing the contents of the container, as a pair itemId and quantity per slot.
---@return table content The content of the container as a table with fields {[int] id, [float] quantity} per slot
function self.getContent() end

---@deprecated Container.getItemsList() is deprecated, use Container.getContent() instead.
function self.getItemsList() end

--- Send a request to get an update of the content of the container, limited to one call allowed per 30 seconds.
--- The onContentUpdate event is emitted by the container when the content is updated.
---@return number time If the request is not yet possible, returns the remaining time to wait for.
function self.updateContent() end

---@deprecated Container.acquireStorage() is deprecated, use Container.updateContent() instead.
function self.acquireStorage() end

--- Emitted when the container content is updated(storage update or after a manual request made with updateContent())
---@type Event
self.onContentUpdate = Event:new()

---@type Event
self.storageAcquired = Event:new()

return self
end

---@class ControlUnit
function ControlUnit()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Stops the Control Unit's Lua code and exits. Warning: calling this might cause your ship to fall from the sky,
--- use it with care. It is typically used in the coding of emergency Control Unit scripts to stop control once the ECU
--- thinks that the ship has safely landed.
function self.exit() end

---@deprecated ControlUnit.getMasterPlayerId() is deprecated, use player.getId() instead.
function self.getMasterPlayerId() end

---@deprecated ControlUnit.getMasterPlayerOrgIds() is deprecated, use player.getOrgIds() instead.
function self.getMasterPlayerOrgIds() end

---@deprecated ControlUnit.getMasterPlayerPosition() is deprecated, use player.getPosition() instead.
function self.getMasterPlayerPosition() end

---@deprecated ControlUnit.getMasterPlayerWorldPosition() is deprecated, use player.getWorldPosition() instead.
function self.getMasterPlayerWorldPosition() end

---@deprecated ControlUnit.getMasterPlayerForward() is deprecated, use player.getForward() instead.
function self.getMasterPlayerForward() end

---@deprecated ControlUnit.getMasterPlayerUp() is deprecated, use player.getUp() instead.
function self.getMasterPlayerUp() end

---@deprecated ControlUnit.getMasterPlayerRight() is deprecated, use player.getRight() instead.
function self.getMasterPlayerRight() end

---@deprecated ControlUnit.getMasterPlayerWorldForward() is deprecated, use player.getWorldForward() instead.
function self.getMasterPlayerWorldForward() end

---@deprecated ControlUnit.getMasterPlayerWorldUp() is deprecated, use player.getWorldUp() instead.
function self.getMasterPlayerWorldUp() end

---@deprecated ControlUnit.getMasterPlayerWorldRight() is deprecated, use player.getWorldRight() instead.
function self.getMasterPlayerWorldRight() end

---@deprecated ControlUnit.isMasterPlayerSeated() is deprecated, use player.isSeated() instead.
function self.isMasterPlayerSeated() end

---@deprecated ControlUnit.getMasterPlayerSeatId() is deprecated, use player.getSeatId() instead.
function self.getMasterPlayerSeatId() end

---@deprecated ControlUnit.getMasterPlayerParent() is deprecated, use player.getParent() instead.
function self.getMasterPlayerParent() end

---@deprecated ControlUnit.getMasterPlayerMass() is deprecated, use player.getMass() instead.
function self.getMasterPlayerMass() end

--- Set up a timer with a given tag in a given period. This will start to trigger the 'onTimer' event with
--- the corresponding tag as an argument, to help you identify what is ticking, and when.
---@param tag string The tag of the timer, as a string, which will be used in the 'onTimer' event to identify this particular timer
---@param period number The period of the timer, in seconds. The time resolution is limited by the framerate here, so you cannot set arbitrarily fast timers
function self.setTimer(tag, period) end

--- Stop the timer with the given tag
---@param tag string The tag of the timer to stop, as a string
function self.stopTimer(tag) end

--- Returns the ambient atmospheric density
---@return number density The atmospheric density(between 0 and 1)
function self.getAtmosphereDensity() end

--- Returns the influence rate of the nearest planet
---@return number rate The planet influence rate(between 0 and 1)
function self.getClosestPlanetInfluence() end

--- Checks if the control unit is protected by DRM
---@return integer 
function self.hasDRM() end

--- Check if the construct is remote controlled
---@return integer 
function self.isRemoteControlled() end

--- Automatically assign the engines within the taglist
--- to result in the given acceleration and angular acceleration provided. Can only be called within the system.onFlush event
--- If engines designated by the tags are not capable of producing the desired command, setEngineCommand will try to do its best
--- to approximate it
--- This function must be used on a piloting controller in onFlush event
--- Other included engines not in any priority will be used last
---@param taglist string Comma (for union) or space (for intersection) separated list of tags. You can set tags directly on the engines in the right-click menu
---@param acceleration table The desired acceleration expressed in world coordinates in m/s2
---@param angularAcceleration table The desired angular acceleration expressed in world coordinates in rad/s2
---@param keepForceCollinearity boolean Forces the resulting acceleration vector to be collinear to the acceleration parameter
---@param keepTorqueCollinearity boolean Forces the resulting angular acceleration vector to be collinear to the angular acceleration parameter
---@param priority1SubTags string Comma (for union) or space (for intersection) separated list of tags of included engines to use as priority 1
---@param priority2SubTags string Comma (for union) or space (for intersection) separated list of tags of included engines to use as priority 2
---@param priority3SubTags string Comma (for union) or space (for intersection) separated list of tags of included engines to use as priority 3
---@param toleranceRatioToStopCommand number When going through with priorities, if we reach a command that is achieved within this tolerance, we will stop there
function self.setEngineCommand(taglist, acceleration, angularAcceleration, keepForceCollinearity, keepTorqueCollinearity, priority1SubTags, priority2SubTags, priority3SubTags, toleranceRatioToStopCommand) end

--- Sets the thrust values for all engines in the tag list
--- This function must be used on a piloting controller
---@param taglist string Comma separated list of tags. You can set tags directly on the engines in the right-click menu
---@param thrust number The desired thrust in newtons (note that for boosters, any non zero value here will set them to 100%)
function self.setEngineThrust(taglist, thrust) end

--- Returns the total thrust values of all engines in the tag list
--- This function must be used on a piloting controller
---@param taglist string Comma separated list of tags. You can set tags directly on the engines in the right-click menu
---@return table The total thrust in newtons
function self.getEngineThrust(taglist) end

--- Set the value of throttle in the cockpit, which will be displayed in the cockpit widget when flying
--- This function must be used on a piloting controller
---@param axis integer Longitudinal = 0, lateral = 1, vertical = 2
---@param commandValue number In 'by throttle', the value of the throttle position: -1 = full reverse, 1 = full forward. Or In 'By Target Speed', the value of the target speed in km/h
function self.setAxisCommandValue(axis, commandValue) end

--- Get the value of throttle in the cockpit
--- This function must be used on a piloting controller
---@param axis integer Longitudinal = 0, lateral = 1, vertical = 2
---@return number value In travel mode, return the value of the throttle position: -1 = full reverse, 1 = full forward or in cruise mode, return the value of the target speed
function self.getAxisCommandValue(axis) end

--- Set the properties of an axis command
--- This function must be used on a piloting controller
--- These properties will be used to display the command in UI
---@param axis integer Longitudinal = 0, lateral = 1, vertical = 2
---@param commandType integer By throttle = 0, by target speed = 1, hidden = 2
---@param targetSpeedRanges table This is to specify the cruise control target speed ranges (for now, only for the longitudinal axis) in m/s
function self.setupAxisCommandProperties(axis, commandType, targetSpeedRanges) end

--- Returns the current control mode. The mode is set by clicking the UI button or using the associated keybinding
--- This function must be used on a piloting controller
---@return integer The current control mode (for now, only 2 are available, 0 and 1)
function self.getControlMode() end

---@deprecated ControlUnit.getControlMasterModeId() is deprecated, use ControlUnit.getControlMode() instead.
function self.getControlMasterModeId() end

--- Cancel the current master mode in use
--- This function must be used on a piloting controller
function self.cancelCurrentControlMasterMode() end

--- Check if a mouse control scheme is selected
--- This function must be used on a piloting controller
---@return integer 
function self.isMouseControlActivated() end

--- Check if the mouse control direct scheme is selected
--- This function must be used on a piloting controller
---@return integer 
function self.isMouseDirectControlActivated() end

--- Check if the mouse control virtual joystick scheme is selected
--- This function must be used on a piloting controller
---@return integer 
function self.isMouseVirtualJoystickActivated() end

--- The ground engines will stabilize to this altitude within their limits
--- The stabilization will be done by adjusting thrust to never go over the target altitude
--- This includes VerticalBooster and HoverEngine
--- This function must be used on a piloting controller
---@param targetAltitude number The stabilization target altitude in m
function self.activateGroundEngineAltitudeStabilization(targetAltitude) end

--- Return the ground engines' stabilization altitude
--- This function must be used on a piloting controller
---@return number Stab altitude in m or 0 if none is set
function self.getSurfaceEngineAltitudeStabilization() end

--- The ground engines will behave like regular engine
--- This includes VerticalBooster and HoverEngine
--- This function must be used on a piloting controller
function self.deactivateGroundEngineAltitudeStabilization() end

--- Returns ground engine stabilization altitude capabilities (lower and upper ranges)
--- This function must be used on a piloting controller
---@return table range Stabilization altitude capabilities for the least powerful engine and the most powerful engine
function self.computeGroundEngineAltitudeStabilizationCapabilities() end

--- Return the current throttle value
--- This function must be used on a piloting controller
---@return number value Throttle value between -100 and 100
function self.getThrottle() end

--- Set the label of a control mode buttons shown in the control unit widget
--- This function must be used on a piloting controller
---@param modeId integer The control mode: 0=Travel Mode, 1=Cruise Control by default
---@param label string The display name of the control mode, displayed on the widget button
function self.setWidgetControlModeLabel(modeId, label) end

---@deprecated ControlUnit.setupControlMasterModeProperties() is deprecated, use ControlUnit.setWidgetControlModeLabel() instead.
function self.setupControlMasterModeProperties() end

--- Checks if any landing gear is deployed
---@return 0 or 1 1 if any landing gear is deployed
function self.isAnyLandingGearDeployed() end

---@deprecated ControlUnit.isAnyLandingGearDeployed() is deprecated, use ControlUnit.isAnyLandingGearExtended() instead.
function self.isAnyLandingGearExtended() end

--- Deploy a end
function self.deployLandingGears() end

---@deprecated ControlUnit.extendLandingGears() is deprecated, use ControlUnit.deployLandingGears() instead.
function self.extendLandingGears() end

--- Retract all landing gears
function self.retractLandingGears() end

--- Check construct lights status
---@return integer 
function self.isAnyHeadlightSwitchedOn() end

--- Turn on the construct headlights
function self.switchOnHeadlights() end

--- Turn off the construct headlights
function self.switchOffHeadlights() end

--- Emitted when the timer with the tag 'tag' is ticking
---@param tag string The tag of the timer that just ticked (see setTimer to set a timer with a given tag)
---@type Event
self.onTimer = Event:new()

---@type Event
self.tick = Event:new()

return self
end

---@class CoreUnit
function CoreUnit()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

---@deprecated CoreUnit.getConstructId() is deprecated, use construct.getId() instead.
function self.getConstructId() end

---@deprecated CoreUnit.getConstructName() is deprecated, use construct.getName() instead.
function self.getConstructName() end

---@deprecated CoreUnit.getConstructWorldPos() is deprecated, use construct.getWorldPosition() instead.
function self.getConstructWorldPos() end

---@deprecated CoreUnit.getWorldAirFrictionAcceleration() is deprecated, use construct.getWorldAirFrictionAcceleration() instead.
function self.getWorldAirFrictionAcceleration() end

---@deprecated CoreUnit.getWorldAirFrictionAngularAcceleration() is deprecated, use construct.getWorldAirFrictionAngularAcceleration() instead.
function self.getWorldAirFrictionAngularAcceleration() end

---@deprecated CoreUnit.getSchematicInfo(schematicId) is deprecated, use construct.getSchematic(id) instead.
function self.getSchematicInfo() end

---@deprecated CoreUnit.getAngularVelocity() is deprecated, use construct.getAngularVelocity() instead.
function self.getAngularVelocity() end

---@deprecated CoreUnit.getWorldAngularVelocity() is deprecated, use construct.getWorldAngularVelocity() instead.
function self.getWorldAngularVelocity() end

---@deprecated CoreUnit.getAngularAcceleration() is deprecated, use construct.getAngularAcceleration() instead.
function self.getAngularAcceleration() end

---@deprecated CoreUnit.getWorldAngularAcceleration() is deprecated, use construct.getWorldAngularAcceleration() instead.
function self.getWorldAngularAcceleration() end

---@deprecated CoreUnit.getVelocity() is deprecated, use construct.getVelocity() instead.
function self.getVelocity() end

---@deprecated CoreUnit.getWorldVelocity() is deprecated, use construct.getWorldVelocity() instead.
function self.getWorldVelocity() end

---@deprecated CoreUnit.getAbsoluteVelocity() is deprecated, use construct.getAbsoluteVelocity() instead.
function self.getAbsoluteVelocity() end

---@deprecated CoreUnit.getWorldAbsoluteVelocity() is deprecated, use construct.getWorldAbsoluteVelocity() instead.
function self.getWorldAbsoluteVelocity() end

---@deprecated CoreUnit.getWorldAcceleration() is deprecated, use construct.getWorldAcceleration() instead.
function self.getWorldAcceleration() end

---@deprecated CoreUnit.getAcceleration() is deprecated, use construct.getAcceleration() instead.
function self.getAcceleration() end

---@deprecated CoreUnit.getOrientationUnitId() is deprecated, use construct.getOrientationUnitId() instead.
function self.getOrientationUnitId() end

---@deprecated CoreUnit.getConstructOrientationUp() is deprecated, use construct.getOrientationUp() instead.
function self.getConstructOrientationUp() end

---@deprecated CoreUnit.getConstructOrientationRight() is deprecated, use construct.getOrientationRight() instead.
function self.getConstructOrientationRight() end

---@deprecated CoreUnit.getConstructOrientationForward() is deprecated, use construct.getOrientationForward() instead.
function self.getConstructOrientationForward() end

---@deprecated CoreUnit.getConstructWorldOrientationUp() is deprecated, use construct.getWorldOrientationUp() instead.
function self.getConstructWorldOrientationUp() end

---@deprecated CoreUnit.getConstructWorldOrientationRight() is deprecated, use construct.getWorldOrientationRight() instead.
function self.getConstructWorldOrientationRight() end

---@deprecated CoreUnit.getConstructWorldOrientationForward() is deprecated, use construct.getWorldOrientationForward() instead.
function self.getConstructWorldOrientationForward() end

---@deprecated CoreUnit.getConstructWorldUp() is deprecated, use construct.getWorldUp() instead.
function self.getConstructWorldUp() end

---@deprecated CoreUnit.getConstructWorldRight() is deprecated, use construct.getWorldRight() instead.
function self.getConstructWorldRight() end

---@deprecated CoreUnit.getConstructWorldForward() is deprecated, use construct.getWorldForward() instead.
function self.getConstructWorldForward() end

---@deprecated CoreUnit.getPvPTimer() is deprecated, use construct.getPvPTimer() instead.
function self.getPvPTimer() end

---@deprecated CoreUnit.getPlayersOnBoard() is deprecated, use construct.getPlayersOnBoard() instead.
function self.getPlayersOnBoard() end

---@deprecated CoreUnit.getPlayersOnBoardInVRStation() is deprecated, use construct.getPlayersOnBoardInVRStation() instead.
function self.getPlayersOnBoardInVRStation() end

---@deprecated CoreUnit.getDockedConstructs() is deprecated, use construct.getDockedConstructs() instead.
function self.getDockedConstructs() end

---@deprecated CoreUnit.isPlayerBoarded(pid) is deprecated, use construct.isPlayerBoarded(id) instead.
function self.isPlayerBoarded() end

---@deprecated CoreUnit.isPlayerBoardedInVRStation(pid) is deprecated, use construct.isPlayerBoardedInVRStation(id) instead.
function self.isPlayerBoardedInVRStation() end

---@deprecated CoreUnit.isConstructDocked(cid) is deprecated, use construct.isConstructDocked(id) instead.
function self.isConstructDocked() end

---@deprecated CoreUnit.forceDeboard(pid) is deprecated, use construct.forceDeboard(id) instead.
function self.forceDeboard() end

---@deprecated CoreUnit.forceInterruptVRSession(pid) is deprecated, use construct.forceInterruptVRSession(id) instead.
function self.forceInterruptVRSession() end

---@deprecated CoreUnit.forceUndock(cid) is deprecated, use construct.forceUndock(id) instead.
function self.forceUndock() end

---@deprecated CoreUnit.getBoardedPlayerMass(pid) is deprecated, use construct.getBoardedPlayerMass(id) instead.
function self.getBoardedPlayerMass() end

---@deprecated CoreUnit.getBoardedInVRStationAvatarMass(pid) is deprecated, use construct.getId() instead.
function self.getBoardedInVRStationAvatarMass() end

---@deprecated CoreUnit.getDockedConstructMass(cid) is deprecated, use construct.getDockedConstructMass(id) instead.
function self.getDockedConstructMass() end

---@deprecated CoreUnit.getParent() is deprecated, use construct.getParent() instead.
function self.getParent() end

---@deprecated CoreUnit.getCloseParents() is deprecated, use construct.getCloseParents() instead.
function self.getCloseParents() end

---@deprecated CoreUnit.getClosestParent() is deprecated, use construct.getClosestParent() instead.
function self.getClosestParent() end

---@deprecated CoreUnit.dock(cid) is deprecated, use construct.dock(id) instead.
function self.dock() end

---@deprecated CoreUnit.undock() is deprecated, use construct.undock() instead.
function self.undock() end

---@deprecated CoreUnit.setDockingMode(mode) is deprecated, use construct.setDockingMode(mode) instead.
function self.setDockingMode() end

---@deprecated CoreUnit.getDockingMode() is deprecated, use construct.getDockingMode() instead.
function self.getDockingMode() end

---@deprecated CoreUnit.getParentPosition() is deprecated, use construct.getParentPosition() instead.
function self.getParentPosition() end

---@deprecated CoreUnit.getParentWorldPosition() is deprecated, use construct.getParentWorldPosition() instead.
function self.getParentWorldPosition() end

---@deprecated CoreUnit.getParentForward() is deprecated, use construct.getParentForward() instead.
function self.getParentForward() end

---@deprecated CoreUnit.getParentUp() is deprecated, use construct.getParentUp() instead.
function self.getParentUp() end

---@deprecated CoreUnit.getParentRight() is deprecated, use construct.getParentRight() instead.
function self.getParentRight() end

---@deprecated CoreUnit.getParentWorldForward() is deprecated, use construct.getParentWorldForward() instead.
function self.getParentWorldForward() end

---@deprecated CoreUnit.getParentWorldUp() is deprecated, use construct.getParentWorldUp() instead.
function self.getParentWorldUp() end

---@deprecated CoreUnit.getParentWorldRight() is deprecated, use construct.getParentWorldRight() instead.
function self.getParentWorldRight() end

---@deprecated CoreUnit.getMaxSpeed() is deprecated, use construct.getMaxSpeed() instead.
function self.getMaxSpeed() end

---@deprecated CoreUnit.getMaxAngularSpeed() is deprecated, use construct.getMaxAngularSpeed() instead.
function self.getMaxAngularSpeed() end

---@deprecated CoreUnit.getMaxSpeedPerAxis() is deprecated, use construct.getMaxSpeedPerAxis() instead.
function self.getMaxSpeedPerAxis() end

---@deprecated CoreUnit.getConstructMass() is deprecated, use construct.getMass() instead.
function self.getConstructMass() end

---@deprecated CoreUnit.getConstructIMass() is deprecated, use construct.getInertialMass() instead.
function self.getConstructIMass() end

---@deprecated CoreUnit.getConstructCrossSection() is deprecated, use construct.getCrossSection() instead.
function self.getConstructCrossSection() end

---@deprecated CoreUnit.getMaxKinematicsParametersAlongAxis(taglist, CRefAxis) is deprecated, use construct.getMaxThrustAlongAxis(taglist, CRefAxis) instead.
function self.getMaxKinematicsParametersAlongAxis() end

--- Returns the list of all the local IDs of the Elements of this construct
---@return table 
function self.getElementIdList() end

--- Returns the name of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return string 
function self.getElementNameById(localId) end

--- Returns the class of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return string 
function self.getElementClassById(localId) end

--- Returns the display name of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return string 
function self.getElementDisplayNameById(localId) end

---@deprecated CoreUnit.getElementTypeById(localId) is deprecated, use CoreUnit.getElementDisplayNameById(localId) instead.
function self.getElementTypeById() end

--- Returns the item ID of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return integer 
function self.getElementItemIdById(localId) end

--- Returns the current level of hit points of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return number 
function self.getElementHitPointsById(localId) end

--- Returns the maximum level of hit points of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return number 
function self.getElementMaxHitPointsById(localId) end

--- Returns the mass of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return number 
function self.getElementMassById(localId) end

--- Returns the position of the Element, identified by its local ID, in construct local coordinates.
---@param localId integer The local ID of the Element
---@return table 
function self.getElementPositionById(localId) end

--- Returns the up direction vector of the Element, identified by its local ID, in construct local coordinates
---@param localId integer The local ID of the Element
---@return table 
function self.getElementUpById(localId) end

--- Returns the right direction vector of the Element, identified by its local ID, in construct local coordinates
---@param localId integer The local ID of the Element
---@return table 
function self.getElementRightById(localId) end

--- Returns the forward direction vector of the Element, identified by its local ID, in construct local coordinates
---@param localId integer The local ID of the Element
---@return table 
function self.getElementForwardById(localId) end

--- Returns the status of the Industry Unit Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return table info If the Element is an Industry Unit, a table with fields {[int] state, [bool] stopRequested, [int] schematicId (deprecated = 0), [int] schematicsRemaining, [int] unitsProduced, [int] remainingTime, [int] batchesRequested, [int] batchesRemaining, [float] maintainProductAmount, [int] currentProductAmount, [table] currentProducts:{{[int] id, [double] quantity},...}}
function self.getElementIndustryInfoById(localId) end

---@deprecated CoreUnit.getElementIndustryStatusById(localId) is deprecated, use CoreUnit.getElementIndustryInfoById(localId) instead.
function self.getElementIndustryStatusById() end

--- Returns the list of tags associated to the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return string 
function self.getElementTagsById(localId) end

--- Returns the altitude above sea level, with respect to the closest planet (0 in space)
---@return number 
function self.getAltitude() end

--- Returns the local gravity intensity
---@return number 
function self.getGravityIntensity() end

---@deprecated CoreUnit.g() is deprecated, use CoreUnit.getGravityIntensity() instead.
function self.g() end

--- Returns the local gravity vector in world coordinates
---@return table 
function self.getWorldGravity() end

--- Returns the vertical unit vector along gravity, in world coordinates (0 in space)
---@return table 
function self.getWorldVertical() end

--- Returns the id of the current close stellar body
---@return integer 
function self.getCurrentPlanetId() end

--- Returns the core's current stress, destroyed when reaching max stress
---@return number 
function self.getCoreStress() end

--- Returns the maximal stress the core can bear before it gets destroyed
---@return number 
function self.getMaxCoreStress() end

--- Returns the core's current stress to max stress ratio
---@return number 
function self.getCoreStressRatio() end

--- Spawns a number sticker in the 3D world, with coordinates relative to the construct
---@param nb integer The number to display 0 to 9
---@param x number The x-coordinate in the construct in meters. 0 = center
---@param y number The y-coordinate in the construct in meters. 0 = center
---@param z number The z-coordinate in the construct in meters. 0 = center
---@param orientation string Orientation of the number. Possible values are "front", "side"
---@return integer 
function self.spawnNumberSticker(nb, x, y, z, orientation) end

--- Spawns an arrow sticker in the 3D world, with coordinates relative to the construct
---@param x number The x-coordinate in the construct in meters. 0 = center
---@param y number the y-coordinate in the construct in meters. 0 = center
---@param z number The z-coordinate in the construct in meters. 0 = center
---@param orientation string Orientation of the arrow. Possible values are "up", "down", "north", "south", "east", "west"
---@return integer 
function self.spawnArrowSticker(x, y, z, orientation) end

--- Delete the referenced sticker
---@param index integer Index of the sticker to delete
---@return integer 
function self.deleteSticker(index) end

--- Move the referenced sticker
---@param index integer Index of the sticker to move
---@param x number The x-coordinate in the construct in meters. 0 = center
---@param y number The y-coordinate in the construct in meters. 0 = center
---@param z number The z-coordinate in the construct in meters. 0 = center
---@return integer 
function self.moveSticker(index, x, y, z) end

--- Rotate the referenced sticker.
---@param index integer Index of the sticker to rotate
---@param angle_x number Rotation along the x-axis in degrees
---@param angle_y number Rotation along the y-axis in degrees
---@param angle_z number Rotation along the z-axis in degrees
---@return integer 
function self.rotateSticker(index, angle_x, angle_y, angle_z) end

---@type Event
self.pvpTimer = Event:new()

---@type Event
self.playerBoarded = Event:new()

---@type Event
self.VRStationEntered = Event:new()

---@type Event
self.constructDocked = Event:new()

---@type Event
self.docked = Event:new()

---@type Event
self.undocked = Event:new()

--- Emitted when core unit stress changed
---@param stress number Difference to previous stress value
---@type Event
self.onStressChanged = Event:new()

---@type Event
self.stressChanged = Event:new()

return self
end

---@class Counter
function Counter()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the index of the current active output plug
---@return integer 
function self.getIndex() end

---@deprecated Counter.getCounterState() is deprecated, use Counter.getIndex() instead.
function self.getCounterState() end

--- Returns the maximum index of the counter
---@return integer 
function self.getMaxIndex() end

--- Moves the next counter index
function self.nextIndex() end

---@deprecated Counter.next() is deprecated, use Counter.nextIndex() instead.
function self.next() end

--- Sets the counter index
---@param index integer The index of the plug to activate
function self.setIndex(index) end

return self
end

---@class Databank
function Databank()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Clear the Databank
function self.clear() end

--- Returns the number of keys that are stored inside the Databank
---@return integer 
function self.getNbKeys() end

--- Returns all the keys in the Databank
---@return table value The key list, as a list of string
function self.getKeyList() end

---@deprecated Databank.getKeys() is deprecated, use Databank.getKeyList().
function self.getKeys() end

--- Returns 1 if the key is present in the Databank, 0 otherwise
---@param key string The key used to store a value
---@return integer value 1 if the key exists and 0 otherwise
function self.hasKey(key) end

--- Remove the given key if the key is present in the Databank
---@param key string The key used to store a value
---@return integer value 1 if the key has been successfully removed, 0 otherwise
function self.clearValue(key) end

--- Stores a string value at the given key
---@param key string The key used to store the value
---@param val string The value, as a string
function self.setStringValue(key, val) end

--- Returns value stored in the given key as a string
---@param key string The key used to retrieve the value
---@return string value The value as a string
function self.getStringValue(key) end

--- Stores an integer value at the given key
---@param key string The key used to store the value
---@param val integer The value, as an integer
function self.setIntValue(key, val) end

--- Returns value stored in the given key as an integer
---@param key string The key used to retrieve the value
---@return integer value The value as an integer
function self.getIntValue(key) end

--- Stores a floating number value at the given key
---@param key string The key used to store the value
---@param val number The value, as a floating number
function self.setFloatValue(key, val) end

--- Returns value stored in the given key as a floating number
---@param key string The key used to retrieve the value
---@return number value The value as a floating number
function self.getFloatValue(key) end

return self
end

---@class DetectionZone
function DetectionZone()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the detection zone radius
---@return number 
function self.getRadius() end

--- Returns the list of ids of the players in the detection zone
---@return table 
function self.getPlayers() end

--- Emitted when a player enters in the detection zone
---@param id integer The ID of the player. Use system.getPlayerName(id) to retrieve its name
---@type Event
self.onEnter = Event:new()

---@type Event
self.enter = Event:new()

--- Emitted when a player leaves in the detection zone
---@param id integer The ID of the player. Use system.getPlayerName(id) to retrieve its name
---@type Event
self.onLeave = Event:new()

---@type Event
self.leave = Event:new()

return self
end

---@class Door
function Door()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Open the door
function self.open() end

---@deprecated Door.activate() is deprecated, use Door.open() instead.
function self.activate() end

--- Close the door
function self.close() end

---@deprecated Door.deactivate() is deprecated, use Door.close() instead.
function self.deactivate() end

--- Return the opening status of the door
---@return integer 
function self.isOpen() end

---@deprecated Door.getState() is deprecated, use Door.isOpen() instead.
function self.getState() end

--- Toggle the door
function self.toggle() end

return self
end

---@class Element
function Element()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

return self
end

---@class Emitter
function Emitter()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Send a message on the given channel, limited to one transmission per frame and per channel
---@param channel string The channel name, limited to 64 characters. The message will not be sent if it exceeds this
---@param message string The message to be transmitted, truncated to 512 characters in case of overflow
function self.send(channel, message) end

--- Returns the emitter range
---@return number 
function self.getRange() end

--- Emitted when the emitter successfully sent a message
---@param channel string The channel name
---@param message string The transmitted message
---@type Event
self.onSent = Event:new()

return self
end

---@class Engine
function Engine()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function self.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function self.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function self.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function self.isIgnoringTags() end

return self
end

---@class Firework
function Firework()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Fire the firework
function self.fire() end

---@deprecated Firework.activate() is deprecated, use Firework.open() instead.
function self.activate() end

--- Set the delay before the launched Fireworks explodes
---@param delay number The delay before explosion in seconds (maximum 5s)
function self.setExplosionDelay(delay) end

--- Returns the delay before the launched Fireworks explodes
---@return number 
function self.getExplosionDelay() end

--- Set the speed at which the firework will be launched (impacts its altitude, depending on the local gravity).
---@param speed number The launch speed in m/s (maximum 200m/s)
function self.setLaunchSpeed(speed) end

--- Returns the speed at which the firework will be launched
---@return number 
function self.getLaunchSpeed() end

--- Set the type of launched firework (will affect which firework is picked in the attached Container)
---@param type integer The type index of the firework (Ball = 1, Ring = 2, Palmtree = 3, Shower = 4)
function self.setType(type) end

--- Returns the type of launched firework
---@return integer 
function self.getType() end

--- Set the color of the launched firework (will affect which firework is picked in the attached Container)
---@param color integer The color index of the firework (Blue = 1, Gold = 2, Green = 3, Purple = 4, Red = 5, Silver = 6)
function self.setColor(color) end

--- Returns the color of the launched firework
---@return integer 
function self.getColor() end

--- Emitted when a firework has just been fired
---@type Event
self.onFired = Event:new()

return self
end

---@class ForceField
function ForceField()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Deploys the forcefield
function self.deploy() end

---@deprecated ForceField.activate() is deprecated, use ForceField.deploy() instead.
function self.activate() end

--- Retracts the forcefield
function self.retract() end

---@deprecated ForceField.deactivate() is deprecated, use ForceField.retract() instead.
function self.deactivate() end

--- Checks if the forcefield is deployed
---@return integer 
function self.isDeployed() end

---@deprecated ForceField.getState() is deprecated, use ForceField.isDeployed() instead.
function self.getState() end

--- Toggle the forcefield
function self.toggle() end

return self
end

---@class FueledEngine
function FueledEngine()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function self.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function self.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function self.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function self.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function self.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function self.deactivate() end

--- Checks if the engine is active
---@return integer 
function self.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function self.getState() end

--- Toggle the state of the engine
function self.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function self.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number 
function self.getThrust() end

---@deprecated FueledEngine.getMaxThrust() is deprecated, use FueledEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function self.getMaxThrust() end

---@deprecated FueledEngine.getMaxThrustBase() is deprecated, use FueledEngine.getMaxThrust().
function self.getMaxThrustBase() end

--- Returns the minimal thrust the engine can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number 
function self.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function self.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number 
function self.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function self.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return integer 
function self.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function self.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table 
function self.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table 
function self.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table 
function self.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function self.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table 
function self.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function self.torqueAxis() end

--- Checks if the engine out of fuel
---@return integer 
function self.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer 
function self.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer 
function self.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return integer 
function self.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function self.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number 
function self.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number 
function self.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number 
function self.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number 
function self.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function self.getT50() end

return self
end

---@class Gyro
function Gyro()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Selects this gyro as the main gyro used for ship orientation
function self.activate() end

--- Deselects this gyro as the main gyro used for ship orientation, using the Core Unit instead
function self.deactivate() end

--- Toggle the activation state of the gyro
function self.toggle() end

--- Returns the activation state of the gyro
---@return integer 
function self.isActive() end

---@deprecated Gyro.getState() is deprecated, use Gyro.isActive() instead.
function self.getState() end

--- The pitch value relative to the gyro orientation and the local gravity
---@return number pitch The pitch angle in degrees, relative to the gyro orientation and the local gravity
function self.getPitch() end

--- The roll value relative to the gyro orientation and the local gravity
---@return number roll The roll angle in degrees, relative to the gyro orientation and the local gravity
function self.getRoll() end

---@deprecated Gyro.localUp() is deprecated, use Gyro.getUp() instead.
function self.localUp() end

---@deprecated Gyro.localForward() is deprecated, use Gyro.getForward() instead.
function self.localForward() end

---@deprecated Gyro.localRight() is deprecated, use Gyro.getRight() instead.
function self.localRight() end

---@deprecated Gyro.worldUp() is deprecated, use Gyro.getWorldUp() instead.
function self.worldUp() end

---@deprecated Gyro.worldForward() is deprecated, use Gyro.getWorldForward() instead.
function self.worldForward() end

---@deprecated Gyro.worldRight() is deprecated, use Gyro.getWorldRight() instead.
function self.worldRight() end

return self
end

---@class HoverEngine
function HoverEngine()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function self.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function self.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function self.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function self.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function self.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function self.deactivate() end

--- Checks if the engine is active
---@return integer 
function self.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function self.getState() end

--- Toggle the state of the engine
function self.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function self.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number 
function self.getThrust() end

---@deprecated FueledEngine.getMaxThrust() is deprecated, use FueledEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function self.getMaxThrust() end

---@deprecated FueledEngine.getMaxThrustBase() is deprecated, use FueledEngine.getMaxThrust().
function self.getMaxThrustBase() end

--- Returns the minimal thrust the engine can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number 
function self.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function self.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number 
function self.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function self.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return integer 
function self.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function self.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table 
function self.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table 
function self.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table 
function self.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function self.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table 
function self.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function self.torqueAxis() end

--- Checks if the engine out of fuel
---@return integer 
function self.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer 
function self.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer 
function self.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return integer 
function self.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function self.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number 
function self.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number 
function self.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number 
function self.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number 
function self.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function self.getT50() end

--- Returns the distance to the first object detected in the direction of the thrust
---@return number 
function self.getDistance() end

--- Returns the maximum functional distance from the ground
---@return number 
function self.getMaxDistance() end

return self
end

---@class Industry
function Industry()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Start the production, and it will run unless it is stopped or the input resources run out
function self.startRun() end

---@deprecated Industry.start() is deprecated, use Industry.startRun() instead.
function self.start() end

--- Start maintaining the specified quantity. Resumes production when the quantity in the output Container is too low, and pauses production when it is equal or higher
---@param quantity integer Quantity to maintain inside output containers
function self.startMaintain(quantity) end

---@deprecated Industry.startAndMaintain(quantity) is deprecated, use Industry.startMaintain(quantity) instead.
function self.startAndMaintain() end

--- Start the production of numBatches and then stop
---@param numBatches integer Number of batches to run before unit stops
function self.startFor(numBatches) end

---@deprecated Industry.batchStart(quantity) is deprecated, use Industry.startFor(numBatches) instead.
function self.batchStart() end

--- Stop the production of the industry unit
---@param force boolean (optional by default false) True if you want to force the production to stop immediately
---@param allowLoss boolean (optional by default false) True if you want to allow the industry unit to lose components when recovering in use components
function self.stop(force, allowLoss) end

---@deprecated Industry.hardStop(allowLoss) is deprecated, use Industry.stop(true,allowLoss) instead.
function self.hardStop() end

---@deprecated Industry.softStop() is deprecated, use Industry.stop(false,false) instead.
function self.softStop() end

--- Get the current running state of the industry
---@return integer value (Stopped = 1, Running = 2, Jammed missing ingredient = 3, Jammed output full = 4, Jammed no output container = 5, Pending = 6, Jammed missing schematics = 7)
function self.getState() end

function self.getStatus() end

--- Returns the complete information of the industry
---@return integer value The complete state of the industry, a table with fields {[int] state, [bool] stopRequested, [int] schematicId (deprecated = 0), [int] schematicsRemaining, [int] unitsProduced, [int] remainingTime, [int] batchesRequested, [int] batchesRemaining, [float] maintainProductAmount, [int] currentProductAmount, [table] currentProducts:{{[int] id, [double] quantity},...}}
function self.getInfo() end

--- Get the count of completed cycles since the player started the unit
---@return integer 
function self.getCyclesCompleted() end

---@deprecated Industry.getCycleCountSinceStartup() is deprecated, use Industry.getCyclesCompleted() instead.
function self.getCycleCountSinceStartup() end

--- Returns the efficiency of the industry
---@return number 
function self.getEfficiency() end

--- Returns the time elapsed in seconds since the player started the unit for the latest time
---@return number 
function self.getUptime() end

--- Returns the list of items required to run the selected output product.
---@return table outputs Returns the list of products
function self.getInputs() end

--- Returns the list of id of the items currently produced.
---@return table outputs The first entry in the table is always the main product produced
function self.getOutputs() end

---@deprecated Industry.getCurrentSchematic() is deprecated.
function self.getCurrentSchematic() end

--- Set the item to produce from its id
---@param itemId integer The item id of the item to produce
---@return integer success The result of the operation 0 for a sucess, -1 if the industry is running
function self.setOutput(itemId) end

---@deprecated Industry.setCurrentSchematic(id) is deprecated, use Industry.setOutput(itemId) instead.
function self.setCurrentSchematic() end

--- Send a request to get an update of the content of the schematic bank, limited to one call allowed per 30 seconds
---@return number time If the request is not yet possible, returns the remaining time to wait for
function self.updateBank() end

--- Returns a table describing the contents of the schematic bank, as a pair itemId and quantity per slot
---@return table content The content of the schematic bank as a table with fields {[int] id, [float] quantity} per slot
function self.getBank() end

--- Emitted when the Industry Unit has started a new production process
---@param id integer The product item id
---@param quantity number The product quantity
---@type Event
self.onStarted = Event:new()

--- Emitted when the Industry Unit has completed a run
---@param id integer The product item id
---@param quantity number The product quantity
---@type Event
self.onCompleted = Event:new()

---@type Event
self.completed = Event:new()

--- Emitted when the industry status has changed
---@param status integer The status of the industry can be (Stopped = 1, Running = 2, Jammed missing ingredient = 3, Jammed output full = 4, Jammed no output container = 5, Pending = 6)
---@type Event
self.onStatusChanged = Event:new()

---@type Event
self.statusChanged = Event:new()

--- Emitted when the schematic bank content is updated(bank update or after a manual request made with updateBank())
---@type Event
self.onBankUpdate = Event:new()

return self
end

---@class LandingGear
function LandingGear()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Deploys the landing gear
function self.deploy() end

---@deprecated LandingGear.activate() is deprecated, use LandingGear.deploy() instead.
function self.activate() end

--- Retracts the landing gear
function self.retract() end

---@deprecated ForceField.deactivate() is deprecated, use ForceField.retract() instead.
function self.deactivate() end

--- Checks if the landing gear is deployed
---@return integer 
function self.isDeployed() end

---@deprecated ForceField.getState() is deprecated, use ForceField.isDeployed() instead.
function self.getState() end

--- Toggle the landing gear
function self.toggle() end

return self
end

---@class LaserDetector
function LaserDetector()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Checks if any laser is hitting the detector
---@return integer 
function self.isHit() end

---@deprecated LaserDetector.getState() is deprecated, use LaserDetector.isHit() instead.
function self.getState() end

--- Emitted when a laser hit the detector
---@type Event
self.onHit = Event:new()

---@type Event
self.laserHit = Event:new()

--- Emitted when all lasers stop hitting the detector
---@type Event
self.onLoss = Event:new()

---@type Event
self.laserRelease = Event:new()

return self
end

---@class LaserEmitter
function LaserEmitter()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Activates the laser emitter
function self.activate() end

--- Deactivates the laser emitter
function self.deactivate() end

--- Toggle the laser emitter
function self.toggle() end

--- Checks if the laser emitter is active
---@return integer 
function self.isActive() end

---@deprecated LaserEmitter.getState() is deprecated, use LaserEmitter.isActive() instead.
function self.getState() end

return self
end

---@class Library
function Library()
local self = {}

--- Solve the 3D linear system M*x=c0 where M is defined by its column vectors c1,c2,c3
---@param c1 table The first column of the matrix M
---@param c2 table The second column of the matrix M
---@param c3 table The third column of the matrix M
---@param c0 table The target column vector of the system
---@return table value The vec3 solution of the above system
function self.systemResolution3(c1, c2, c3, c0) end

--- Solve the 2D linear system M*x=c0 where M is defined by its column vectors c1,c2
---@param c1 table The first column of the matrix M
---@param c2 table The second column of the matrix M
---@param c0 table The target column vector of the system
---@return table value The vec2 solution of the above system
function self.systemResolution2(c1, c2, c0) end

--- Returns the position of the given point in world coordinates system, on the game screen
---@param worldPos table: The world position of the point
---@return table value The position in percentage (between 0 and 1) of the screen resolution as vec3 with {x, y, depth}
function self.getPointOnScreen(worldPos) end

return self
end

---@class Light
function Light()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Switches the light on
function self.activate() end

--- Switches the light off
function self.deactivate() end

--- Checks if the light is on
---@return integer 
function self.isActive() end

---@deprecated Light.getState() is deprecated, use Light.isActive() instead.
function self.getState() end

--- Toggle the state of the light
function self.toggle() end

--- Set the light color in RGB. Lights can use HDR color values above 1.0 to glow.
---@param r number The red component, between 0.0 and 1.0, up to 5.0 for HDR colors.
---@param g number The green component, between 0.0 and 1.0, up to 5.0 for HDR colors.
---@param b number The blue component, between 0.0 and 1.0, up to 5.0 for HDR colors.
function self.setColor(r, g, b) end

---@deprecated Light.setRGBColor(r,g,b) is deprecated, use Light.setColor(r,g,b) instead.
function self.setRGBColor() end

--- Returns the light color in RGB
---@return table color  A vec3 for the red, blue and green components of the light, with values between 0.0 and 1.0, up to 5.0.
function self.getColor() end

---@deprecated Light.getRGBColor() is deprecated, use Light.getColor() instead.
function self.getRGBColor() end

--- Returns the blinking state of the light
---@param state boolean True to enable light blinking
function self.setBlinkingState(state) end

--- Checks if the light blinking is enabled
---@return integer 
function self.isBlinking() end

--- Returns the light 'on' blinking duration
---@return number 
function self.getOnBlinkingDuration() end

--- Set the light 'on' blinking duration
---@param time number The duration of the 'on' blinking in seconds
function self.setOnBlinkingDuration(time) end

--- Returns the light 'off' blinking duration
---@return number 
function self.getOffBlinkingDuration() end

--- Set the light 'off' blinking duration
---@param time number The duration of the 'off' blinking in seconds
function self.setOffBlinkingDuration(time) end

--- Returns the light blinking time shift
---@return number 
function self.getBlinkingTimeShift() end

--- Set the light blinking time shift
---@param shift number The time shift of the blinking
function self.setBlinkingTimeShift(shift) end

return self
end

---@class ManualButton
function ManualButton()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Checks if the manual button is down
---@return integer 
function self.isDown() end

---@deprecated ManualButton.getState() is deprecated, use ManualButton.isDown() instead.
function self.getState() end

--- Emitted when the button is pressed
---@type Event
self.onPressed = Event:new()

---@type Event
self.pressed = Event:new()

--- Emitted when the button is released
---@type Event
self.onReleased = Event:new()

---@type Event
self.released = Event:new()

return self
end

---@class ManualSwitch
function ManualSwitch()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Switches the switch on
function self.activate() end

--- Switches the switch off
function self.deactivate() end

--- Toggle the switch
function self.toggle() end

--- Checks if the switch is active
---@return integer 
function self.isActive() end

---@deprecated ManualSwitch.getState() is deprecated, use ManualSwitch.isActive() instead.
function self.getState() end

--- Emitted when the button is pressed
---@type Event
self.onPressed = Event:new()

---@type Event
self.pressed = Event:new()

--- Emitted when the button is released
---@type Event
self.onReleased = Event:new()

---@type Event
self.released = Event:new()

return self
end

---@class MiningUnit
function MiningUnit()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the current state of the mining unit
---@return integer state The status of the mining unit can be (Stopped = 1, Running = 2, Jammed output full = 3, Jammed no output container = 4)
function self.getState() end

---@deprecated MiningUnit.getStatus() is deprecated, use MiningUnit.getState() instead.
function self.getStatus() end

--- Returns the remaining time of the current batch extraction process.
---@return number 
function self.getRemainingTime() end

--- Returns the item ID of the currently selected ore.
---@return integer 
function self.getActiveOre() end

--- Returns the list of available ore pools
---@return table pool A list of tables composed with {[int] oreId, [float] available, [float] maximum);
function self.getOrePools() end

--- Returns the base production rate of the mining unit.
---@return number 
function self.getBaseRate() end

--- Returns the efficiency rate of the mining unit.
---@return number 
function self.getEfficiency() end

--- Returns the calibration rate of the mining unit.
---@return number 
function self.getCalibrationRate() end

--- Returns the optimal calibration rate of the mining unit.
---@return number 
function self.getOptimalRate() end

--- Returns the current production rate of the mining unit.
---@return number 
function self.getProductionRate() end

--- Returns the territory's adjacency bonus to the territory of the mining unit. Note: This value is updated only when a new batch is started.
---@return number 
function self.getAdjacencyBonus() end

--- Returns the position of the last calibration excavation, in world coordinates.
---@return table 
function self.getLastExtractionPosition() end

--- Returns the ID of the last player who calibrated the mining unit.
---@return integer 
function self.getLastExtractingPlayerId() end

--- Returns the time in seconds since the last calibration of the mining unit.
---@return number 
function self.getLastExtractionTime() end

--- Returns the item ID of the ore extracted during the last calibration excavation.
---@return integer 
function self.getLastExtractedOre() end

--- Returns the volume of ore extracted during the last calibration excavation.
---@return number 
function self.getLastExtractedVolume() end

--- Emitted when the mining unit is calibrated.
---@param oreId integer The item ID of the ore extracted during the calibration process
---@param amount number Amount of ore extracted during the calibration process
---@param rate number The new calibration rate after calibration process
---@type Event
self.onCalibrated = Event:new()

---@type Event
self.calibrated = Event:new()

--- Emitted when the mining unit started a new extraction process.
---@param oreId number The item ID of the ore mined during the extraction process
---@type Event
self.onStarted = Event:new()

--- Emitted when the mining unit complete a batch.
---@param oreId number The item ID of the ore mined during the extraction process
---@param amount number Amount of ore mined
---@type Event
self.onCompleted = Event:new()

---@type Event
self.completed = Event:new()

--- Emitted when the mining unit status is changed.
---@param status integer The status of the mining unit can be (Stopped = 1, Running = 2, Jammed output full = 3, Jammed no output container = 4)
---@type Event
self.onStatusChanged = Event:new()

---@type Event
self.statusChanged = Event:new()

--- Emitted when the mining unit stopped the extraction process.
---@type Event
self.onStopped = Event:new()

return self
end

---@class PlasmaExtractor
function PlasmaExtractor()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the current status of the plasma extractor
---@return integer status The status of the plasma extractor can be (Stopped = 1, Running = 2, Jammed output full = 3, Jammed no output container = 4)
function self.getStatus() end

--- Returns the remaining time of the current batch extraction process.
---@return number 
function self.getRemainingTime() end

--- Returns the list of available plasma pools
---@return table pool A list of tables composed with {[int] oreId, [float] available, [float] maximum);
function self.getPlasmaPools() end

--- Emitted when the plasma extractor started a new extraction process
---@type Event
self.onStarted = Event:new()

--- Emitted when the plasma extractor complete a batch
---@type Event
self.onCompleted = Event:new()

--- Emitted when the plasma extractor status is changed
---@param status integer The status of the plasma extractor can be (Stopped = 1, Running = 2, Jammed output full = 3, Jammed no output container = 4)
---@type Event
self.onStatusChanged = Event:new()

--- Emitted when the plasma extractor stopped the extraction process
---@type Event
self.onStopped = Event:new()

return self
end

---@class Player
function Player()
local self = {}

--- Returns the player name
---@return string value The player name
function self.getName() end

--- Return the ID of the player
---@return integer value The ID of the player
function self.getId() end

--- Returns the player mass
---@return number value The mass of the player in kilograms
function self.getMass() end

--- Returns the player's nanopack content mass
---@return number value The player's nanopack content mass in kilograms
function self.getNanopackMass() end

--- Returns the player's nanopack content volume
---@return number value The player's nanopack content volume in liters
function self.getNanopackVolume() end

--- Returns the player's nanopack maximum volume
---@return number value The player's nanopack maximum volume in liters
function self.getNanopackMaxVolume() end

--- Returns the list of organization IDs of the player
---@return table value The list of organization IDs
function self.getOrgIds() end

--- Returns the position of the player, in construct local coordinates
---@return table value The position in construct local coordinates
function self.getPosition() end

--- Returns the position of the player, in world coordinates
---@return table value The position in world coordinates
function self.getWorldPosition() end

--- Returns the position of the head of the player's character, in construct local coordinates
---@return table value The position of the head in construct local coordinates
function self.getHeadPosition() end

--- Returns the position of the head of the player's character, in world coordinates
---@return table value The position of the head in world coordinates
function self.getWorldHeadPosition() end

--- Returns the velocity vector of the player, in construct local coordinates
---@return table value The velocity vector in construct local coordinates
function self.getVelocity() end

--- Returns the velocity vector of the player, in world coordinates
---@return table value The velocity vector in world coordinates
function self.getWorldVelocity() end

--- Returns the absolute velocity vector of the player, in world coordinates
---@return table value The velocity absolute vector in world coordinates
function self.getAbsoluteVelocity() end

--- Returns the forward direction vector of the player, in construct local coordinates
---@return table value The forward direction vector in construct local coordinates
function self.getForward() end

--- Returns the right direction vector of the player, in construct local coordinates
---@return table value The right direction vector in construct local coordinates
function self.getRight() end

--- Returns the up direction vector of the player, in construct local coordinates
---@return table value The up direction vector in construct local coordinates
function self.getUp() end

--- Returns the forward direction vector of the player, in world coordinates
---@return table value The forward direction vector in world coordinates
function self.getWorldForward() end

--- Returns the right direction vector of the player, in world coordinates
---@return table value The right direction vector in world coordinates
function self.getWorldRight() end

--- Returns the up direction vector of the player, in world coordinates
---@return table value The up direction vector in world coordinates
function self.getWorldUp() end

--- Returns the id of the planet the player is located on
---@return integer value The id of the planet, 0 if none
function self.getPlanet() end

--- Returns the identifier of the construct to which the player is parented
---@return integer value The id of the construct, 0 if none
function self.getParent() end

--- Checks if the player is seated
---@return integer value 1 if the player is seated
function self.isSeated() end

--- Returns the local id of the seat on which the player is sitting
---@return integer value The local id of the seat, or 0 is not seated
function self.getSeatId() end

--- Checks if the player is parented to the given construct
---@param id integer The construct id
---@return integer value 1 if the player is parented to the given construct
function self.isParentedTo(id) end

--- Checks if the player is currently sprinting
---@return integer value 1 if the player is sprinting
function self.isSprinting() end

--- Checks if the player's jetpack is on
---@return integer value 1 if the player's jetpack is on
function self.isJetpackOn() end

--- Returns the state of the headlight of the player
---@return integer 1 if the player has his headlight on
function self.isHeadlightOn() end

--- Set the state of the headlight of the player
---@param state boolean : True to turn on headlight
function self.setHeadlightOn(state) end

--- Freezes the player movements, liberating the associated movement keys to be used by the script.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal)
---@param state boolean 1 freeze the character, 0 unfreeze the character
function self.freeze(state) end

--- Checks if the player movements are frozen
---@return integer value 1 if the player is frozen, 0 otherwise
function self.isFrozen() end

--- Checks if the player has DRM autorization to the control unit
---@return integer value 1 if the player has DRM autorization on the control unit
function self.hasDRMAutorization() end

--- Emitted when the player parent change
---@param oldId integer The previous parent construct ID
---@param newId integer The new parent construct ID
---@type Event
self.onParentChanged = Event:new()

return self
end

---@class PressureTile
function PressureTile()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Checks if the pressure tile is down
---@return integer 
function self.isDown() end

---@deprecated PressureTile.getState() is deprecated, use PressureTile.isDown() instead.
function self.getState() end

--- Emitted when the pressure tile is pressed
---@type Event
self.onPressed = Event:new()

---@type Event
self.pressed = Event:new()

--- Emitter when the pressure tile is released
---@type Event
self.onReleased = Event:new()

---@type Event
self.released = Event:new()

return self
end

---@class Radar
function Radar()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns 1 if the radar is not broken, works in the current environment and is not used by another control unit
---@return integer state 1 if the radar is operational, otherwise: 0 = broken, -1 = bad environment, -2 = obstructed, -3 = already in use
function self.getOperationalState() end

---@deprecated Radar.isOperational() is deprecated, use Radar.getOperationalState() instead.
function self.isOperational() end

--- Returns the scan range of the radar
---@return number value The scan range
function self.getRange() end

--- Returns ranges to identify a target based on its core size
---@return table ranges The list of float values for ranges in meters as { xsRange, sRange, mRange, lRange }
function self.getIdentifyRanges() end

--- Returns the list of construct IDs in the scan range
---@return table 
function self.getConstructIds() end

--- Returns the list of identified construct IDs
---@return table 
function self.getIdentifiedConstructIds() end

--- Returns the ID of the target construct
---@return integer 
function self.getTargetId() end

--- Returns the distance to the given construct
---@return number 
function self.getConstructDistance() end

--- Returns 1 if the given construct is identified
---@return integer 
function self.isConstructIdentified() end

--- Returns 1 if the given construct was abandoned
---@return integer 
function self.isConstructAbandoned() end

--- Returns the core size of the given construct
---@return string size The core size name; can be 'XS', 'S', 'M', 'L', 'XL'
function self.getConstructCoreSize() end

--- Returns the threat rate your construct is for the given construct
---@return integer threat The threat rate index (None = 1, Identified = 2, Threatened and identified = 3, Threatened = 4, Attacked = 5), can be -1 if the radar is not operational
function self.getThreatRateTo() end

---@deprecated Radar.getThreatTo(id) is deprecated, use Radar.getThreatRateTo(id) instead.
function self.getThreatTo() end

--- Returns the threat rate the given construct is for your construct
---@return string threat The threat rate index (None = 1, Identified = 2, Threatened and identified = 3, Threatened = 4, Attacked = 5), can be -1 if the radar is not operational
function self.getThreatRateFrom() end

---@deprecated Radar.getThreatFrom(id) is deprecated, use Radar.getThreatRateFrom(id) instead.
function self.getThreatFrom() end

--- Returns whether the target has an active Transponder with matching tags
---@return integer 
function self.hasMatchingTransponder() end

--- Returns a table with id of the owner entity (player or organization) of the given construct, if in range and if active transponder tags match for owned dynamic constructs.
---@param id integer The ID of the construct
---@return table entity A table with fields {[int] id, [bool] isOrganization} describing the owner. Use system.getPlayerName(id) and system.getOrganization(id) to retrieve info about it
function self.getConstructOwnerEntity(id) end

---@deprecated Radar.getConstructOwner(id) is deprecated, use Radar.getConstructOwnerEntity(id) instead.
function self.getConstructOwner() end

--- Return the size of the bounding box of the given construct, if in range
---@param id integer The ID of the construct
---@return table 
function self.getConstructSize(id) end

--- Return the kind of the given construct
---@param id integer The ID of the construct
---@return integer kind The kind index of the construct (Universe = 1, Planet = 2,Asteroid = 3,Static = 4,Dynamic = 5,Space = 6,Alien = 7)
function self.getConstructKind(id) end

---@deprecated Radar.getConstructType(id) is deprecated, use Radar.getConstructKind(id) instead.
function self.getConstructType() end

--- Returns the position of the given construct in construct local coordinates, if active transponder tags match for owned dynamic constructs
---@param id integer The ID of the construct
---@return table 
function self.getConstructPos(id) end

--- Returns the position of the given construct in world coordinates, if in range and if active transponder tags match for owned dynamic constructs
---@param id integer The ID of the construct
---@return table 
function self.getConstructWorldPos(id) end

--- Returns the velocity vector of the given construct in construct local coordinates, if identified and if active transponder tags match for owned dynamic constructs
---@param id integer The ID of the construct
---@return table 
function self.getConstructVelocity(id) end

--- Returns the velocity vector of the given construct in world coordinates, if identified and if active transponder tags match for owned dynamic constructs
---@param id integer The ID of the construct
---@return table 
function self.getConstructWorldVelocity(id) end

--- Returns the mass of the given construct, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return number mass The mass of the construct in kilograms
function self.getConstructMass(id) end

--- Return the name of the given construct, if defined
---@param id integer The ID of the construct
---@return string 
function self.getConstructName(id) end

--- Returns a table of working elements on the given construction, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return table info A table with fields : {[float] weapons, [float] radars, [float] antiGravity, [float] atmoEngines, [float] spaceEngines, [float] rocketEngines} with values between 0.0 and 1.0. Exceptionally antiGravity and rocketEngines are always 1.0 if present, even if broken
function self.getConstructInfos(id) end

--- Returns the speed of the given construct, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return number speed The speed of the construct relative to the universe in meters per second
function self.getConstructSpeed(id) end

--- Returns the angular speed of the given construct to your construct, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return number speed The angular speed of the construct relative to our construct in radians per second
function self.getConstructAngularSpeed(id) end

--- Returns the radial speed of the given construct to your construct, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return number speed The radial speed of the construct relative to our construct in meters per second
function self.getConstructRadialSpeed(id) end

--- Emitted when a Construct enters the scan range of the radar
---@param id integer The ID of the construct
---@type Event
self.onEnter = Event:new()

---@type Event
self.enter = Event:new()

--- Emitted when a construct leaves the range of the radar
---@param id integer The ID of the construct
---@type Event
self.onLeave = Event:new()

---@type Event
self.leave = Event:new()

--- Emitted when a construct is identified
---@param id integer The ID of the construct
---@type Event
self.onIdentified = Event:new()

return self
end

---@class Receiver
function Receiver()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the receiver range
---@return number 
function self.getRange() end

--- Checks if the given channel exists in the receiver channels list
---@param channel string The channels list as Lua table
---@return integer 
function self.hasChannel(channel) end

--- Set the channels list
---@param channels table The channels list as Lua table
---@return integer 1 if the channels list has been successfully set
function self.setChannelList(channels) end

---@deprecated Receiver.setChannels(channels) is deprecated, use Receiver.setChannelList(channels) instead.
function self.setChannels() end

--- Returns the channels list
---@return table channels The channels list as Lua table
function self.getChannelList() end

---@deprecated Receiver.getChannels() is deprecated, use Receiver.getChannelList() instead.
function self.getChannels() end

--- Emitted when a message is received on any channel defined on the element
---@param channel string The channel; can be used as a filter
---@param message string The message received
---@type Event
self.onReceived = Event:new()

---@type Event
self.receive = Event:new()

return self
end

---@class RocketEngine
function RocketEngine()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function self.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function self.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function self.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function self.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function self.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function self.deactivate() end

--- Checks if the engine is active
---@return integer 
function self.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function self.getState() end

--- Toggle the state of the engine
function self.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function self.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number 
function self.getThrust() end

---@deprecated FueledEngine.getMaxThrust() is deprecated, use FueledEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function self.getMaxThrust() end

---@deprecated FueledEngine.getMaxThrustBase() is deprecated, use FueledEngine.getMaxThrust().
function self.getMaxThrustBase() end

--- Returns the minimal thrust the engine can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number 
function self.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function self.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number 
function self.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function self.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return integer 
function self.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function self.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table 
function self.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table 
function self.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table 
function self.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function self.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table 
function self.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function self.torqueAxis() end

--- Checks if the engine out of fuel
---@return integer 
function self.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer 
function self.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer 
function self.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return integer 
function self.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function self.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number 
function self.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number 
function self.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number 
function self.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number 
function self.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function self.getT50() end

---@deprecated RocketEngine.getDistance() is deprecated.
function self.getDistance() end

return self
end

---@class Screen
function Screen()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Switch on the screen
function self.activate() end

--- Switch off the screen
function self.deactivate() end

--- Checks if the screen is on
---@return integer 1 if the screen is on
function self.isActive() end

---@deprecated Screen.getState() is deprecated, use Screen.isActive() instead.
function self.getState() end

--- Toggle the state of the screen
function self.toggle() end

--- Displays the given text at the given coordinates in the screen, and returns an ID to move it later
---@param x number Horizontal position, as a percentage (between 0 and 100) of the screen width
---@param y number Vertical position, as a percentage (between 0 and 100) of the screen height
---@param fontSize number Text font size, as a percentage of the screen width
---@param text string The text to display
---@return integer 
function self.addText(x, y, fontSize, text) end

--- Displays the given text centered in the screen with a font to maximize its visibility
---@param text string The text to display
function self.setCenteredText(text) end

--- Set the whole screen HTML content (overrides anything already set)
---@param html string The HTML content to display
function self.setHTML(html) end

--- Set the screen render script, switching the screen to native rendering mode
---@param script string The Lua render script
function self.setRenderScript(script) end

--- Defines the input of the screen rendering script, which will be automatically defined during the execution of Lua
---@param input string A string that can be retrieved by calling getInput in a render script
function self.setScriptInput(input) end

--- Set the screen render script output to the empty string
function self.clearScriptOutput() end

--- Get the screen render script output
---@return string value The contents of the last render script setOutput call, or an empty string
function self.getScriptOutput() end

--- Displays the given HTML content at the given coordinates in the screen, and returns an ID to move it later
---@param x number Horizontal position, as a percentage (between 0 and 100) of the screen width
---@param y number Vertical position, as a percentage (between 0 and 100) of the screen height
---@param html string The HTML content to display, which can contain SVG html elements to make drawings
---@return integer 
function self.addContent(x, y, html) end

--- Displays SVG code (anything that fits within a <svg> section), which overrides any preexisting content
---@param svg string The SVG content to display, which fits inside a 1920x1080 canvas
function self.setSVG(svg) end

--- Update the html element with the given ID (returned by addContent) with a new HTML content
---@param id integer An integer ID that is used to identify the html element in the screen. Methods such as addContent return the ID that you can store to use later here
---@param html string The HTML content to display, which can contain SVG html elements to make drawings
function self.resetContent(id, html) end

--- Delete the html element with the given ID (returned by addContent)
---@param id integer An integer ID that is used to identify the html element in the screen. Methods such as addContent return the id that you can store to use later here
function self.deleteContent(id) end

--- Update the visibility of the html element with the given ID (returned by addContent)
---@param id integer An integer ID that is used to identify the html element in the screen. Methods such as addContent return the ID that you can store to use later here
---@param state boolean true to show the content, false to hide
function self.showContent(id, state) end

--- Move the html element with the given id (returned by addContent) to a new position in the screen
---@param id integer An integer id that is used to identify the html element in the screen. Methods such as addContent return the ID that you can store to use later here
---@param x number Horizontal position, as a percentage (between 0 and 100) of the screen width
---@param y number Vertical position, as a percentage (between 0 and 100) of the screen height
function self.moveContent(id, x, y) end

--- Returns the x-coordinate of the position point at in the screen
---@return number x The x-position as a percentage (between 0 and 1) of screen width; -1 if nothing is point at
function self.getMouseX() end

--- Returns the y-coordinate of the position point at in the screen
---@return number y The y-position as a percentage (between 0 and 1) of screen height; -1 if nothing is point at
function self.getMouseY() end

--- Returns the state of the mouse click
---@return integer 1 if the mouse is pressed, otherwise 0
function self.getMouseState() end

--- Clear the screen
function self.clear() end

--- Emitted when the player starts a click on the screen
---@param x number X-coordinate of the click in percentage (between 0 and 1) of the screen width
---@param y number Y-coordinate of the click in percentage (between 0 and 1) the screen height
---@type Event
self.onMouseDown = Event:new()

---@type Event
self.mouseDown = Event:new()

--- Emitted when the player releases a click on the screen
---@param x number X-coordinate of the click in percentage (between 0 and 1) of the screen width
---@param y number Y-coordinate of the click in percentage (between 0 and 1) the screen height
---@type Event
self.onMouseUp = Event:new()

---@type Event
self.mouseUp = Event:new()

--- Emitted when the output of the screen is changed
---@param output string The output string of the screen
---@type Event
self.onOutputChanged = Event:new()

return self
end

---@class SpaceBrake
function SpaceBrake()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function self.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function self.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function self.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function self.isIgnoringTags() end

--- Start the brake at full power (works only when run inside a cockpit or under remote control)
function self.activate() end

--- Stops the brake (works only when run inside a cockpit or under remote control)
function self.deactivate() end

--- Checks if the brake is active
---@return integer 
function self.isActive() end

---@deprecated BrakeEngine.getState() is deprecated, use BrakeEngine.isActive().
function self.getState() end

--- Toggle the state of the brake
function self.toggle() end

--- Set the thrust of the brake. Note that brakes can generate a force only in the movement opposite direction
---@param thrust number The brake thrust in newtons (limited by the maximum thrust)
function self.setThrust(thrust) end

--- Returns the current thrust of the brake
---@return number 
function self.getThrust() end

---@deprecated BrakeEngine.getMaxThrust() is deprecated, use BrakeEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function self.getMaxThrust() end

---@deprecated BrakeEngine.getMaxThrustBase() is deprecated, use BrakeEngine.getMaxThrust().
function self.getMaxThrustBase() end

--- Returns the minimal thrust the brake can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number 
function self.getCurrentMinThrust() end

---@deprecated BrakeEngine.getMinThrust() is deprecated, use BrakeEngine.getCurrentMinThrust().
function self.getMinThrust() end

--- Returns the maximal thrust the brake can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the brake
---@return number 
function self.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function self.getMaxThrustEfficiency() end

--- Returns the brake thrust direction in construct local coordinates
---@return table 
function self.getThrustAxis() end

--- Returns the brake thrust direction in world coordinates
---@return table 
function self.getWorldThrustAxis() end

---@deprecated BrakeEngine.thrustAxis() is deprecated, use BrakeEngine.getWorldThrustAxis().
function self.thrustAxis() end

---@deprecated BrakeEngine.isOutOfFuel() is deprecated.
function self.isOutOfFuel() end

---@deprecated BrakeEngine.hasFunctionalFuelTank() is deprecated.
function self.hasFunctionalFuelTank() end

---@deprecated BrakeEngine.getCurrentFuelRate() is deprecated.
function self.getCurrentFuelRate() end

---@deprecated BrakeEngine.getFuelRateEfficiency() is deprecated.
function self.getFuelRateEfficiency() end

---@deprecated BrakeEngine.getFuelConsumption() is deprecated.
function self.getFuelConsumption() end

---@deprecated BrakeEngine.getDistance() is deprecated.
function self.getDistance() end

---@deprecated BrakeEngine.getT50() is deprecated.
function self.getT50() end

---@deprecated BrakeEngine.torqueAxis() is deprecated.
function self.torqueAxis() end

return self
end

---@class SpaceEngine
function SpaceEngine()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function self.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function self.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function self.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function self.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function self.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function self.deactivate() end

--- Checks if the engine is active
---@return integer 
function self.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function self.getState() end

--- Toggle the state of the engine
function self.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function self.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number 
function self.getThrust() end

---@deprecated FueledEngine.getMaxThrust() is deprecated, use FueledEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function self.getMaxThrust() end

---@deprecated FueledEngine.getMaxThrustBase() is deprecated, use FueledEngine.getMaxThrust().
function self.getMaxThrustBase() end

--- Returns the minimal thrust the engine can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number 
function self.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function self.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number 
function self.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function self.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return integer 
function self.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function self.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table 
function self.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table 
function self.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table 
function self.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function self.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table 
function self.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function self.torqueAxis() end

--- Checks if the engine out of fuel
---@return integer 
function self.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer 
function self.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer 
function self.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return integer 
function self.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function self.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number 
function self.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number 
function self.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number 
function self.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number 
function self.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function self.getT50() end

---@deprecated SpaceEngine.getDistance() is deprecated.
function self.getDistance() end

return self
end

---@class SpaceMiningUnit
function SpaceMiningUnit()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the current state of the space mining unit
---@return integer state The status of the space mining unit can be (Stopped = 1, Running = 2, Jammed output full = 3, Jammed no output container = 4)
function self.getState() end

---@deprecated MiningUnit.getStatus() is deprecated, use MiningUnit.getState() instead.
function self.getStatus() end

--- Returns the remaining time of the current batch extraction process.
---@return number 
function self.getRemainingTime() end

--- Returns the item ID of the currently selected ore.
---@return integer 
function self.getActiveOre() end

--- Returns the list of available ore pools
---@return table pool A list of tables composed with {[int] oreId, [float] available, [float] maximum);
function self.getOrePools() end

--- Returns the base production rate of the space mining unit.
---@return number 
function self.getBaseRate() end

--- Returns the efficiency rate of the space mining unit.
---@return number 
function self.getEfficiency() end

--- Returns the calibration rate of the space mining unit.
---@return number 
function self.getCalibrationRate() end

--- Returns the optimal calibration rate of the space mining unit.
---@return number 
function self.getOptimalRate() end

--- Returns the current production rate of the space mining unit.
---@return number 
function self.getProductionRate() end

--- Emitted when the space mining unit started a new extraction process.
---@param oreId number The item ID of the ore mined during the extraction process
---@type Event
self.onStarted = Event:new()

--- Emitted when the space mining unit complete a batch.
---@param oreId number The item ID of the ore mined during the extraction process
---@param amount number Amount of ore mined
---@type Event
self.onCompleted = Event:new()

---@type Event
self.completed = Event:new()

--- Emitted when the space mining unit status is changed.
---@param status integer The status of the space mining unit can be
---@type Event
self.onStatusChanged = Event:new()

---@type Event
self.statusChanged = Event:new()

--- Emitted when the space mining unit stopped the extraction process.
---@type Event
self.onStopped = Event:new()

return self
end

---@class SurfaceEngine
function SurfaceEngine()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function self.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function self.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function self.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function self.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function self.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function self.deactivate() end

--- Checks if the engine is active
---@return integer 
function self.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function self.getState() end

--- Toggle the state of the engine
function self.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function self.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number 
function self.getThrust() end

---@deprecated FueledEngine.getMaxThrust() is deprecated, use FueledEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function self.getMaxThrust() end

---@deprecated FueledEngine.getMaxThrustBase() is deprecated, use FueledEngine.getMaxThrust().
function self.getMaxThrustBase() end

--- Returns the minimal thrust the engine can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number 
function self.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function self.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number 
function self.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function self.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return integer 
function self.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function self.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table 
function self.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table 
function self.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table 
function self.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function self.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table 
function self.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function self.torqueAxis() end

--- Checks if the engine out of fuel
---@return integer 
function self.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer 
function self.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer 
function self.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return integer 
function self.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function self.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number 
function self.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number 
function self.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number 
function self.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number 
function self.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function self.getT50() end

--- Returns the distance to the first object detected in the direction of the thrust
---@return number 
function self.getDistance() end

--- Returns the maximum functional distance from the ground
---@return number 
function self.getMaxDistance() end

return self
end

---@class System
function System()
local self = {}

--- Return the currently key bound to the given action. Useful to display tips.
---@param actionName string The action name, represented as a string taken among the set of predefined Lua-available actions (you can check the drop down list to see what is available)
---@return string value The key associated to the given action name
function self.getActionKeyName(actionName) end

--- Control the display of the Control Unit custom screen, where you can define customized display information in HTML.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param bool boolean True to show the screen, false to hide the screen
function self.showScreen(bool) end

--- Set the content of the Control Unit custom screen with some HTML code.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param content string The HTML content you want to display on the screen widget. You can also use SVG here to make drawings.
function self.setScreen(content) end

--- Create an empty panel.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param label string The title of the panel
---@return string value The panel ID, or "" on failure
function self.createWidgetPanel(label) end

--- Destroy the panel.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param panelId string The panel ID
---@return integer value 1 on success, 0 on failure.
function self.destroyWidgetPanel(panelId) end

--- Create an empty widget and add it to a panel.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param panelId string The panel ID
---@param type string Widget type, determining how it will display data attached to ID
---@return string value The widget ID, or "" on failure.
function self.createWidget(panelId, type) end

--- Destroy the widget.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param widgetId string The widget ID
---@return integer value 1 on success, 0 on failure.
function self.destroyWidget(widgetId) end

--- Create data.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataJson string The data fields as JSON
---@return string value The data ID, or "" on failure.
function self.createData(dataJson) end

--- Destroy the data.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataId string The data ID
---@return integer value 1 on success, 0 on failure.
function self.destroyData(dataId) end

--- Update JSON associated to data.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataId string The data ID
---@param dataJson string The data fields as JSON
---@return integer value 1 on success, 0 on failure.
function self.updateData(dataId, dataJson) end

--- Add data to widget.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataId string The data ID
---@param widgetId string The widget ID
---@return integer value 1 on success, 0 on failure.
function self.addDataToWidget(dataId, widgetId) end

--- Remove data from widget.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataId string The data ID
---@param widgetId string The widget ID
---@return integer value 1 on success, 0 on failure.
function self.removeDataFromWidget(dataId, widgetId) end

--- Return the current value of the mouse wheel
---@return number value The current value of the mouse wheel
function self.getMouseWheel() end

--- Return the current value of the mouse delta X
---@return number value The current value of the mouse delta X
function self.getMouseDeltaX() end

--- Return the current value of the mouse delta Y
---@return number value The current value of the mouse delta Y
function self.getMouseDeltaY() end

--- Return the current value of the mouse pos X
---@return number value The current value of the mouse pos X
function self.getMousePosX() end

--- Return the current value of the mouse pos Y
---@return number value The current value of the mouse pos Y
function self.getMousePosY() end

--- Return the value of mouse sensitivity game setting
---@return number value Sensitivity setting value
function self.getMouseSensitivity() end

--- Return the current value of the screen height
---@return integer value The current value of the screen height
function self.getScreenHeight() end

--- Return the current value of the screen width
---@return integer value The current value of the screen width
function self.getScreenWidth() end

--- Return the current value of the player's horizontal field of view
---@return number value The current value of the player's horizontal field of view
function self.getCameraHorizontalFov() end

---@deprecated System.getFov() is deprecated, use System.getCameraHorizontalFov().
function self.getFov() end

--- Return the current value of the player's vertical field of view
---@return number value The current value of the player's vertical field of view
function self.getCameraVerticalFov() end

--- Returns the active camera mode.
---@return integer mode 1: First Person View, 2: Look Around Construct View, 3: Follow Construct View
function self.getCameraMode() end

--- Checks if the active camera is in first person view.
---@return integer value 1 if the camera is in first person view.
function self.isFirstPerson() end

--- Returns the position of the camera, in construct local coordinates.
---@return table value Camera position in construct local coordinates.
function self.getCameraPos() end

--- Returns the position of the camera, in world coordinates.
---@return table value Camera position in world coordinates.
function self.getCameraWorldPos() end

--- Returns the forward direction vector of the active camera, in world coordinates.
---@return table value Camera forward direction vector in world coordinates.
function self.getCameraWorldForward() end

--- Returns the right direction vector of the active camera, in world coordinates.
---@return table value Camera right direction vector in world coordinates.
function self.getCameraWorldRight() end

--- Returns the up direction vector of the active camera, in world coordinates.
---@return table value Camera up direction vector in world coordinates.
function self.getCameraWorldUp() end

--- Returns the forward direction vector of the active camera, in construct local coordinates.
---@return table value Camera forward direction vector in construct local coordinates.
function self.getCameraForward() end

--- Returns the right direction vector of the active camera, in construct local coordinates.
---@return table value Camera right direction vector in construct local coordinates.
function self.getCameraRight() end

--- Returns the up direction vector of the active camera, in construct local coordinates.
---@return table value Camera up direction vector in construct local coordinates.
function self.getCameraUp() end

--- Return the current value of the mouse wheel (for the throttle speedUp/speedDown action)
--- This value will go through the control scheme, devices and sensitivity
---@return number value The current input
function self.getThrottleInputFromMouseWheel() end

--- Return the mouse input for the ship control action (forward/backward)
--- This value will go through the control scheme to know on which input the mouse is mapped and its current sensitivity
---@return number value The current input
function self.getControlDeviceForwardInput() end

--- Return the mouse input for the ship control action  (yaw right/left)
--- This value will go through the control scheme to know on which input the mouse is mapped and its current sensitivity
---@return number value The current input
function self.getControlDeviceYawInput() end

--- Return the mouse input for the ship control action  (right/left)
--- This value will go through the control scheme to know on which input the mouse is mapped and its current sensitivity
---@return number value The current value of the mouse delta Y
function self.getControlDeviceLeftRightInput() end

--- Lock or unlock the mouse free look.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param state boolean true to lock and false to unlock
function self.lockView(state) end

--- Return the lock state of the mouse free look
---@return integer value 1 when locked and 0 when unlocked
function self.isViewLocked() end

---@deprecated System.freeze() is deprecated, use Player.freeze().
function self.freeze() end

---@deprecated System.isFrozen() is deprecated, use Player.isFrozen().
function self.isFrozen() end

--- Return the current time since the arrival of the Arkship on September 30th, 2017
---@return number value Time in seconds
function self.getArkTime() end

---@deprecated System.getTime() is deprecated, use System.getArkTime().
function self.getTime() end

--- Return the current time since January 1st, 1970.
---@return number value Time in seconds
function self.getUtcTime() end

--- Return the time offset between local timezone and UTC
---@return number value Time in seconds
function self.getUtcOffset() end

--- Return the locale in which the game is currently running
---@return string value The locale, currently one of "en-US", "fr-FR", or "de-DE"
function self.getLocale() end

--- Return delta time of action updates (to use in ActionLoop)
---@return number value The delta time in seconds
function self.getActionUpdateDeltaTime() end

--- Return the name of the given player, if in range of visibility or broadcasted by a transponder
---@param id integer The ID of the player
---@return string value The name of the player
function self.getPlayerName(id) end

--- Return the world position of the given player, if in range of visibility
---@param id integer The ID of the player
---@return table value The coordinates of the player in world coordinates
function self.getPlayerWorldPos(id) end

--- Return the item table corresponding to the given item ID.
---@param id integer The ID of the item
---@return table value An item table with fields: {[int] id, [string] name, [string] displayName, [string] locDisplayName, [string] displayNameWithSize, [string] locDisplayNameWithSize, [string] description, [string] locDescription, [string] type, [number] unitMass, [number] unitVolume, [integer] tier, [string] scale, [string] iconPath, [table] schematics, [table] products}
function self.getItem(id) end

--- Returns a list of recipes producing the given item from its id.
---@param itemId integer The ID of the item
---@return table value A list of recipe table with field: {[int] id, [int] tier,[double] time, [bool] nanocraftable, [table] products:{{[int] id, [double] quantity},...}, [table] ingredients:{{[int] id, [double] quantity},...}}
function self.getRecipes(itemId) end

---@deprecated System.getSchematic(id) is deprecated, use System.getRecipes(itemId).tag.
function self.getSchematic() end

--- Returns the corresping organization to the given organization id, if known, e.g. broadcasted by a transponder
---@param id integer The ID of the organization
---@return table value A table containing information about the given organization {[string] name, [string] tag}
function self.getOrganization(id) end

---@deprecated System.getOrganizationName() is deprecated, use System.getOrganization(id).name .
function self.getOrganizationName() end

---@deprecated System.getOrganizationTag() is deprecated, use System.getOrganization(id).tag .
function self.getOrganizationTag() end

--- Return the player's world position as a waypoint string, starting with '::pos' (only in explicit runs)
---@return string value The waypoint as a string
function self.getWaypointFromPlayerPos() end

--- Set a waypoint at the destination described by the waypoint string, of the form '::pos{...}' (only in explicit runs)
---@param waypointStr string The waypoint as a string
---@param notify boolean (Optional) True to display a notification on waypoint change
function self.setWaypoint(waypointStr, notify) end

--- Clear the active destination waypoint. (only in explicit runs)'
---@param notify boolean (Optional) True to display a notification about the waypoint's clearing
function self.clearWaypoint(notify) end

--- Set the visibility of the helper top menu.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param show boolean True to show the top helper menu, false to hide the top helper menu
function self.showHelper(show) end

--- Play a sound file from your audio folder (located in "My documents/NQ/DualUniverse/audio"). Only one sound can be played at a time.
---@param filePath string Relative path to audio folder (.mp3, .wav)
function self.playSound(filePath) end

--- Checks if a sound is playing
---@return integer value 1 if a sound is playing
function self.isPlayingSound() end

--- Stop the current playing sound
function self.stopSound() end

--- Print the given string in the Lua chat channel
---@param msg string 
function self.print(msg) end

--- Emitted when an action starts
---@param action string The action name, represented as a string taken among the set of predefined Lua-available actions (you can check the drop down list to see what is available)
---@type Event
self.onActionStart = Event:new()

---@type Event
self.actionStart = Event:new()

--- Emitted when an action stops
---@param action string The action name, represented as a string taken among the set of predefined Lua-available actions (you can check the drop down list to see what is available)
---@type Event
self.onActionStop = Event:new()

---@type Event
self.actionStop = Event:new()

--- Emitted at each update as long as the action is maintained
---@param action string The action name, represented as a string taken among the set of predefined Lua-available actions (you can check the drop down list to see what is available)
---@type Event
self.onActionLoop = Event:new()

---@type Event
self.actionLoop = Event:new()

--- Game update event. This is equivalent to a timer set at 0 seconds, as updates will go as fast as the FPS can go
---@type Event
self.onUpdate = Event:new()

---@type Event
self.update = Event:new()

--- Physics update. Do not use to put anything else by a call to updateICC on your Control Unit, as many functions are
--- disabled when called from 'onFlush'. This is only to update the physics (engine control, etc), not to setup some gameplay code
---@type Event
self.onFlush = Event:new()

---@type Event
self.flush = Event:new()

--- A new message has been entered in the Lua tab of the chat, acting like a command line interface
---@param text string The message entered
---@type Event
self.onInputText = Event:new()

---@type Event
self.inputText = Event:new()

--- Emitted when the player changes the camera mode.
---@param mode integer The camera mode, represented by an integer (First Person View = 1, Look Around Construct View = 2, Follow Construct View = 3)
---@type Event
self.onCameraChanged = Event:new()

---@type Event
self.cameraChanged = Event:new()

return self
end

---@class Telemeter
function Telemeter()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

---@deprecated Telemeter.getDistance() is deprecated, use Telemeter.raycast().distance instead.
function self.getDistance() end

--- Emits a raycast from the telemeter, returns a raycastHit object
---@return table hit A table with fields : {[bool] hit, [float] distance, [vec3] point}
function self.raycast() end

--- Returns telemeter raycast origin in local construct coordinates
---@return table 
function self.getRayOrigin() end

--- Returns telemeter raycast origin in world coordinates
---@return table 
function self.getRayWorldOrigin() end

--- Returns telemeter raycast axis in local construct coordinates
---@return table 
function self.getRayAxis() end

--- Returns telemeter raycast axis in world coordinates
---@return table 
function self.getRayWorldAxis() end

--- Returns the max distance from which an obstacle can be detected (default is 100m)
---@return number 
function self.getMaxDistance() end

return self
end

---@class Transponder
function Transponder()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Activate the transponder
function self.activate() end

--- Deactivate the transponder
function self.deactivate() end

--- Toggle the state of the transponder
function self.toggle() end

--- Checks if the transponder is active
---@return integer 
function self.isActive() end

---@deprecated Transponder.getState() is deprecated, use Transponder.isActive().
function self.getState() end

--- Set the tags list with up to 8 entries. Returns 1 if the application was successful, 0 if the tag
--- format is invalid.
---@param tags table List of up to 8 transponder tag strings
---@return integer 
function self.setTags(tags) end

--- Returns the tag list
---@return table tags List of up to 8 transponder tag strings
function self.getTags() end

--- Emitted when the transponder is started or stopped
---@param active integer 1 if the element was activated, 0 otherwise
---@type Event
self.onToggled = Event:new()

---@type Event
self.toggled = Event:new()

return self
end

---@class VerticalBooster
function VerticalBooster()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function self.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function self.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function self.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function self.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function self.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function self.deactivate() end

--- Checks if the engine is active
---@return integer 
function self.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function self.getState() end

--- Toggle the state of the engine
function self.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function self.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number 
function self.getThrust() end

---@deprecated FueledEngine.getMaxThrust() is deprecated, use FueledEngine.getCurrentMaxThrust().
---@deprecated @diagnostic disable-next-line
function self.getMaxThrust() end

---@deprecated FueledEngine.getMaxThrustBase() is deprecated, use FueledEngine.getMaxThrust().
function self.getMaxThrustBase() end

--- Returns the minimal thrust the engine can deliver at the moment (can be more than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
--- Most of the time, this will be 0 but it can be greater than 0, particularly for Ailerons, in which case
--- the actual thrust will be at least equal to minThrust
---@return number 
function self.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function self.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number 
function self.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function self.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return integer 
function self.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function self.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table 
function self.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table 
function self.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table 
function self.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function self.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table 
function self.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function self.torqueAxis() end

--- Checks if the engine out of fuel
---@return integer 
function self.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer 
function self.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer 
function self.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return integer 
function self.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function self.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number 
function self.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number 
function self.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number 
function self.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number 
function self.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function self.getT50() end

--- Returns the distance to the first object detected in the direction of the thrust
---@return number 
function self.getDistance() end

--- Returns the maximum functional distance from the ground
---@return number 
function self.getMaxDistance() end

return self
end

---@class WarpDrive
function WarpDrive()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Initiate the warp jump process
function self.initiate() end

--- Returns the current status of the warp drive
---@return integer status The current status of the warp drive (NoWarpDrive = 1, Broken = 2, Warping = 3, ParentWarping = 4, NotAnchored = 5, WarpCooldown = 6, PvPCooldown = 7, MovingChild = 8, NoContainer = 9, PlanetTooClose = 10, DestinationNotSet = 11, DestinationTooClose = 12, DestinationTooFar = 13, NotEnoughWarpCells = 14, Ready = 15)
function self.getStatus() end

--- Returns the distance to the current warp destination
---@return number 
function self.getDistance() end

--- Returns the construct ID of the current warp destination
---@return integer 
function self.getDestination() end

--- Returns the name of the current warp destination construct
---@return string 
function self.getDestinationName() end

--- Returns the local id of the container linked to the warp drive
---@return integer 
function self.getContainerId() end

--- Returns the quantity of warp cells available in the linked container
---@return integer 
function self.getAvailableWarpCells() end

--- Returns the quantity of warp cells required to warp to the warp destination set
---@return integer 
function self.getRequiredWarpCells() end

return self
end

---@class Weapon
function Weapon()
local self = {}

--- Show the element widget in the in-game widget stack
function self.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function self.show() end

--- Hide the element widget in the in-game widget stack
function self.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function self.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function self.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function self.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function self.getData() end

--- Returns the element data ID
---@return string 
function self.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function self.getDataId() end

--- Returns the element name
---@return string 
function self.getName() end

--- Returns the class of the Element
---@return string 
function self.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function self.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function self.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function self.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function self.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function self.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function self.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function self.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function self.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function self.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function self.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function self.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function self.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function self.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function self.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function self.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function self.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function self.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function self.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function self.getWorldForward() end

--- Set the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@param state integer The plug signal state
function self.setSignalIn(plug, state) end

--- Returns the value of a signal in the specified IN plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function self.getSignalOut(plug) end

--- Returns the item id of the currently equipped ammo
---@return integer 
function self.getAmmo() end

--- Returns the current amount of remaining ammunition
---@return integer 
function self.getAmmoCount() end

--- Returns the maximum amount of ammunition the weapon can carry
---@return integer 
function self.getMaxAmmo() end

--- Checks if the weapon is out of ammo
---@return integer 
function self.isOutOfAmmo() end

--- Returns 1 if the weapon is not broken and compatible with the construct size
---@return integer state 1 if the weapon is operational, otherwise 0 = broken, -1 = incompatible size
function self.getOperationalState() end

---@deprecated Weapon.isOperational() is deprecated, use Weapon.getOperationalState() instead.
function self.isOperational() end

--- Returns the current weapon status
---@return integer status The current status of the weapon (Idle = 1, Firing = 2, Reloading = 3, Unloading = 4)
function self.getStatus() end

--- Returns the local id of the container linked to the weapon
---@return integer 
function self.getContainerId() end

--- Returns the current hit probability of the weapon for the current target
---@return number 
function self.getHitProbability() end

--- Returns the base weapon damage
---@return number 
function self.getBaseDamage() end

--- Returns the optimal aim cone
---@return number 
function self.getOptimalAimingCone() end

--- Returns the optimal distance to target
---@return number 
function self.getOptimalDistance() end

--- Returns the maximum distance to target
---@return number 
function self.getMaxDistance() end

--- Returns the optimal tracking rate
---@return number 
function self.getOptimalTracking() end

--- Returns the magazine volume
---@return number 
function self.getMagazineVolume() end

--- Returns the weapon cycle time
---@return number 
function self.getCycleTime() end

--- Returns the weapon reload time
---@return number 
function self.getReloadTime() end

--- Returns the weapon unload time
---@return number 
function self.getUnloadTime() end

--- Returns the id of the current target construct of the weapon
---@return integer 
function self.getTargetId() end

--- Emitted when the weapon start reloading
---@param ammoId integer The item id of the ammo
---@type Event
self.onReload = Event:new()

--- Emitted when the weapon has reloaded
---@param ammoId integer The item id of the ammo
---@type Event
self.onReloaded = Event:new()

--- Emitted when the weapon has missed its target
---@param targetId integer The construct id of the target
---@type Event
self.onMissed = Event:new()

--- Emitted when the weapon target has been destroyed
---@param targetId integer The construct id of the target
---@type Event
self.onDestroyed = Event:new()

--- Emitted when an element on the weapon target has been destroyed
---@param targetId integer The construct id of the target
---@param itemId integer The item id of the destroyed element
---@type Event
self.onElementDestroyed = Event:new()

--- Emitted when the weapon has hit
---@param targetId integer The construct id of the target
---@param damage number The damage amount dealt by the hit
---@type Event
self.onHit = Event:new()

return self
end

library = Library()

system = System()

unit = ControlUnit()

player = Player()

construct = Construct()

DULibrary = Library()

DUSystem = System()

DUPlayer = Player()

DUConstruct = Construct()