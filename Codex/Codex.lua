---@class Adjustor
Adjustor = {}
--- Show the element widget in the in-game widget stack
function Adjustor.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Adjustor.show() end

--- Hide the element widget in the in-game widget stack
function Adjustor.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Adjustor.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Adjustor.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Adjustor.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Adjustor.getData() end

--- Returns the element data ID
---@return string 
function Adjustor.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Adjustor.getDataId() end

--- Returns the element name
---@return string 
function Adjustor.getName() end

--- Returns the class of the Element
---@return string 
function Adjustor.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Adjustor.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Adjustor.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Adjustor.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Adjustor.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Adjustor.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Adjustor.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Adjustor.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Adjustor.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Adjustor.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Adjustor.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Adjustor.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Adjustor.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Adjustor.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Adjustor.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Adjustor.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Adjustor.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Adjustor.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Adjustor.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Adjustor.getWorldForward() end

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
---@return integer value The plug signal state
function Adjustor.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Adjustor.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function Adjustor.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function Adjustor.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function Adjustor.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function Adjustor.isIgnoringTags() end

--- Start the adjustor at full power (works only when run inside a cockpit or under remote control)
function Adjustor.activate() end

--- Stops the adjustor (works only when run inside a cockpit or under remote control)
function Adjustor.deactivate() end

--- Checks if the adjustor is active
---@return integer 
function Adjustor.isActive() end

---@deprecated Adjustor.getState() is deprecated, use Adjustor.isActive().
function Adjustor.getState() end

--- Toggle the state of the adjustor
function Adjustor.toggle() end

--- Set the exhaust thrust of the adjustor
---@param thrust number The adjustor thrust in newtons (limited by the maximum thrust)
function Adjustor.setThrust(thrust) end

--- Returns the current exhaust thrust of the adjustor
---@return number 
function Adjustor.getThrust() end

--- Returns the maximal exhaust thrust the adjustor can deliver
---@return number 
function Adjustor.getMaxThrust() end

---@deprecated Adjustor.getMaxThrustBase() is deprecated, use Adjustor.getMaxThrust().
function Adjustor.getMaxThrustBase() end

--- Returns the adjustor exhaust thrust direction in construct local coordinates
---@return table 
function Adjustor.getThrustAxis() end

--- Returns the adjustor torque axis in construct local coordinates
---@return table 
function Adjustor.getTorqueAxis() end

--- Returns the adjustor exhaust thrust direction in world coordinates
---@return table 
function Adjustor.getWorldThrustAxis() end

---@deprecated Adjustor.thrustAxis() is deprecated, use Adjustor.getWorldThrustAxis().
function Adjustor.thrustAxis() end

--- Returns the adjustor torque axis in world coordinates
---@return table 
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
Airbrake = {}
--- Show the element widget in the in-game widget stack
function Airbrake.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Airbrake.show() end

--- Hide the element widget in the in-game widget stack
function Airbrake.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Airbrake.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Airbrake.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Airbrake.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Airbrake.getData() end

--- Returns the element data ID
---@return string 
function Airbrake.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Airbrake.getDataId() end

--- Returns the element name
---@return string 
function Airbrake.getName() end

--- Returns the class of the Element
---@return string 
function Airbrake.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Airbrake.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Airbrake.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Airbrake.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Airbrake.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Airbrake.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Airbrake.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Airbrake.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Airbrake.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Airbrake.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Airbrake.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Airbrake.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Airbrake.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Airbrake.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Airbrake.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Airbrake.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Airbrake.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Airbrake.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Airbrake.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Airbrake.getWorldForward() end

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
---@return integer value The plug signal state
function Airbrake.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Airbrake.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function Airbrake.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function Airbrake.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function Airbrake.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function Airbrake.isIgnoringTags() end

--- Start the brake at full power (works only when run inside a cockpit or under remote control)
function Airbrake.activate() end

--- Stops the brake (works only when run inside a cockpit or under remote control)
function Airbrake.deactivate() end

--- Checks if the brake is active
---@return integer 
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
Airfoil = {}
--- Show the element widget in the in-game widget stack
function Airfoil.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Airfoil.show() end

--- Hide the element widget in the in-game widget stack
function Airfoil.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Airfoil.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Airfoil.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Airfoil.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Airfoil.getData() end

--- Returns the element data ID
---@return string 
function Airfoil.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Airfoil.getDataId() end

--- Returns the element name
---@return string 
function Airfoil.getName() end

--- Returns the class of the Element
---@return string 
function Airfoil.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Airfoil.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Airfoil.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Airfoil.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Airfoil.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Airfoil.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Airfoil.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Airfoil.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Airfoil.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Airfoil.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Airfoil.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Airfoil.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Airfoil.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Airfoil.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Airfoil.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Airfoil.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Airfoil.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Airfoil.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Airfoil.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Airfoil.getWorldForward() end

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
---@return integer value The plug signal state
function Airfoil.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Airfoil.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function Airfoil.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function Airfoil.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function Airfoil.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function Airfoil.isIgnoringTags() end

--- Returns the current lift of the airfoil
---@return number 
function Airfoil.getLift() end

---@deprecated Airfoil.getThrust() is deprecated, use Airfoil.getLift().
function Airfoil.getThrust() end

--- Gives the maximum lift that the airfoil can generate, under optimal conditions.
--- Note that the actual maximum lift will most of the time be less than this value
---@return number 
function Airfoil.getMaxLift() end

---@deprecated Airfoil.getMaxThrustBase() is deprecated, use Airfoil.getMaxLift().
function Airfoil.getMaxThrustBase() end

--- Returns the current drag of the airfoil
---@return number 
function Airfoil.getDrag() end

--- The ratio between lift and drag, depending of the aerodynamic profile of the airfoil
---@return number 
function Airfoil.getDragRatio() end

--- Returns the minimal lift the airfoil can deliver at the moment (can be higher than zero),
--- which will depend on various conditions like atmospheric density, obstruction, orientation, etc
---@return number 
function Airfoil.getCurrentMinLift() end

---@deprecated Airfoil.getMinThrust() is deprecated, use Airfoil.getCurrentMinLift().
function Airfoil.getMinThrust() end

--- Returns the maximal lift the aifoil can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual lift will be
--- anything below this maximum lift, which defines the current max capability of the airfoil
---@return number 
function Airfoil.getCurrentMaxLift() end

---@deprecated Airfoil.getMaxThrust() is deprecated, use Airfoil.getCurrentMaxLift().
function Airfoil.getMaxThrust() end

--- Returns the ratio between the current maximum lift and the optimal maximum lift
---@return number 
function Airfoil.getMaxLiftEfficiency() end

---@deprecated Airfoil.getMaxThrustEfficiency() is deprecated, use Airfoil.getMaxLiftEfficiency().
function Airfoil.getMaxThrustEfficiency() end

--- Returns the airfoil lift direction in construct local coordinates
---@return table 
function Airfoil.getLiftAxis() end

--- Returns the airfoil torque axis in construct local coordinates
---@return table 
function Airfoil.getTorqueAxis() end

--- Returns the airfoil lift direction in world coordinates
---@return table 
function Airfoil.getWorldLiftAxis() end

---@deprecated Airfoil.thrustAxis() is deprecated, use Airfoil.getWorldLiftAxis().
function Airfoil.thrustAxis() end

--- Returns the adjustor torque axis in world coordinates
---@return table 
function Airfoil.getWorldTorqueAxis() end

---@deprecated Airfoil.torqueAxis() is deprecated, use Airfoil.getWorldTorqueAxis().
function Airfoil.torqueAxis() end

--- Checks if the airfoil is stalled
---@return integer 
function Airfoil.isStalled() end

--- Returns the airfoil stall angle
---@return number 
function Airfoil.getStallAngle() end

--- Returns the minimum angle to produce the maximum lift of the airfoil
--- Note that the airfoil will produce lift at a lower angle but not optimally
---@return number 
function Airfoil.getMinAngle() end

--- Returns the maximum angle to produce the maximum lift of the airfoil
--- Note that the airfoil will produce lift at a higher angle but not optimally
---@return number 
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
AntiGravityGenerator = {}
--- Show the element widget in the in-game widget stack
function AntiGravityGenerator.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function AntiGravityGenerator.show() end

--- Hide the element widget in the in-game widget stack
function AntiGravityGenerator.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function AntiGravityGenerator.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function AntiGravityGenerator.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function AntiGravityGenerator.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function AntiGravityGenerator.getData() end

--- Returns the element data ID
---@return string 
function AntiGravityGenerator.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function AntiGravityGenerator.getDataId() end

--- Returns the element name
---@return string 
function AntiGravityGenerator.getName() end

--- Returns the class of the Element
---@return string 
function AntiGravityGenerator.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function AntiGravityGenerator.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function AntiGravityGenerator.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function AntiGravityGenerator.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function AntiGravityGenerator.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function AntiGravityGenerator.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function AntiGravityGenerator.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function AntiGravityGenerator.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function AntiGravityGenerator.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function AntiGravityGenerator.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function AntiGravityGenerator.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function AntiGravityGenerator.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function AntiGravityGenerator.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function AntiGravityGenerator.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function AntiGravityGenerator.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function AntiGravityGenerator.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function AntiGravityGenerator.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function AntiGravityGenerator.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function AntiGravityGenerator.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function AntiGravityGenerator.getWorldForward() end

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
---@return integer value The plug signal state
function AntiGravityGenerator.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function AntiGravityGenerator.getSignalOut(plug) end

--- Activate the anti-gravity generator
function AntiGravityGenerator.activate() end

--- Deactivate the anti-gravity generator
function AntiGravityGenerator.deactivate() end

--- Returns the state of activation of the anti-gravity generator
---@return integer 
function AntiGravityGenerator.isActive() end

---@deprecated AntiGravityGenerator.getState() is deprecated, use AntiGravityGenerator.isActive() instead.
function AntiGravityGenerator.getState() end

--- Toggle the anti-gravity generator
function AntiGravityGenerator.toggle() end

--- Returns the strength of the anti-gravitational field
---@return number 
function AntiGravityGenerator.getFieldStrength() end

--- Returns the current rate of compensation of the gravitational field
---@return number 
function AntiGravityGenerator.getCompensationRate() end

--- Returns the current power of the gravitational field
---@return number 
function AntiGravityGenerator.getFieldPower() end

--- Returns the number of pulsors linked to the anti-gravity generator
---@return integer 
function AntiGravityGenerator.getPulsorCount() end

--- Set the target altitude for the anti-gravity field. Cannot be called from onFlush
---@param altitude number The target altitude in meters. It will be reached with a slow acceleration (not instantaneous)
function AntiGravityGenerator.setTargetAltitude(altitude) end

---@deprecated AntiGravityGenerator.setBaseAltitude(altitude) is deprecated, use AntiGravityGenerator.setTargetAltitude(altitude) instead.
function AntiGravityGenerator.setBaseAltitude() end

--- Returns the target altitude defined for the anti-gravitational field
---@return number 
function AntiGravityGenerator.getTargetAltitude() end

--- Returns the current base altitude of the anti-gravitational field
---@return number 
function AntiGravityGenerator.getBaseAltitude() end


---@class AtmosphericEngine
AtmosphericEngine = {}
--- Show the element widget in the in-game widget stack
function AtmosphericEngine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function AtmosphericEngine.show() end

--- Hide the element widget in the in-game widget stack
function AtmosphericEngine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function AtmosphericEngine.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function AtmosphericEngine.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function AtmosphericEngine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function AtmosphericEngine.getData() end

--- Returns the element data ID
---@return string 
function AtmosphericEngine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function AtmosphericEngine.getDataId() end

--- Returns the element name
---@return string 
function AtmosphericEngine.getName() end

--- Returns the class of the Element
---@return string 
function AtmosphericEngine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function AtmosphericEngine.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function AtmosphericEngine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function AtmosphericEngine.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function AtmosphericEngine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function AtmosphericEngine.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function AtmosphericEngine.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function AtmosphericEngine.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function AtmosphericEngine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function AtmosphericEngine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function AtmosphericEngine.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function AtmosphericEngine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function AtmosphericEngine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function AtmosphericEngine.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function AtmosphericEngine.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function AtmosphericEngine.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function AtmosphericEngine.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function AtmosphericEngine.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function AtmosphericEngine.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function AtmosphericEngine.getWorldForward() end

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
---@return integer value The plug signal state
function AtmosphericEngine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function AtmosphericEngine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function AtmosphericEngine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function AtmosphericEngine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function AtmosphericEngine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function AtmosphericEngine.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function AtmosphericEngine.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function AtmosphericEngine.deactivate() end

--- Checks if the engine is active
---@return integer 
function AtmosphericEngine.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function AtmosphericEngine.getState() end

--- Toggle the state of the engine
function AtmosphericEngine.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function AtmosphericEngine.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number 
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
---@return number 
function AtmosphericEngine.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function AtmosphericEngine.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number 
function AtmosphericEngine.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function AtmosphericEngine.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return integer 
function AtmosphericEngine.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function AtmosphericEngine.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table 
function AtmosphericEngine.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table 
function AtmosphericEngine.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table 
function AtmosphericEngine.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function AtmosphericEngine.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table 
function AtmosphericEngine.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function AtmosphericEngine.torqueAxis() end

--- Checks if the engine out of fuel
---@return integer 
function AtmosphericEngine.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer 
function AtmosphericEngine.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer 
function AtmosphericEngine.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return integer 
function AtmosphericEngine.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function AtmosphericEngine.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number 
function AtmosphericEngine.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number 
function AtmosphericEngine.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number 
function AtmosphericEngine.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number 
function AtmosphericEngine.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function AtmosphericEngine.getT50() end

---@deprecated AtmosphericEngine.getDistance() is deprecated.
function AtmosphericEngine.getDistance() end


---@class BaseShieldGenerator
BaseShieldGenerator = {}
--- Show the element widget in the in-game widget stack
function BaseShieldGenerator.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function BaseShieldGenerator.show() end

--- Hide the element widget in the in-game widget stack
function BaseShieldGenerator.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function BaseShieldGenerator.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function BaseShieldGenerator.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function BaseShieldGenerator.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function BaseShieldGenerator.getData() end

--- Returns the element data ID
---@return string 
function BaseShieldGenerator.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function BaseShieldGenerator.getDataId() end

--- Returns the element name
---@return string 
function BaseShieldGenerator.getName() end

--- Returns the class of the Element
---@return string 
function BaseShieldGenerator.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function BaseShieldGenerator.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function BaseShieldGenerator.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function BaseShieldGenerator.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function BaseShieldGenerator.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function BaseShieldGenerator.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function BaseShieldGenerator.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function BaseShieldGenerator.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function BaseShieldGenerator.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function BaseShieldGenerator.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function BaseShieldGenerator.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function BaseShieldGenerator.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function BaseShieldGenerator.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function BaseShieldGenerator.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function BaseShieldGenerator.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function BaseShieldGenerator.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function BaseShieldGenerator.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function BaseShieldGenerator.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function BaseShieldGenerator.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function BaseShieldGenerator.getWorldForward() end

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
---@return integer value The plug signal state
function BaseShieldGenerator.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function BaseShieldGenerator.getSignalOut(plug) end

--- Activate the shield
function BaseShieldGenerator.activate() end

--- Deactivate the shield
function BaseShieldGenerator.deactivate() end

--- Toggle the state of the shield
function BaseShieldGenerator.toggle() end

--- Returns the activation state of the shield
---@return integer 
function BaseShieldGenerator.isActive() end

---@deprecated BaseShieldGenerator.getState() is deprecated, use BaseShieldGenerator.isActive() instead.
function BaseShieldGenerator.getState() end

--- Returns the current hit points of the shield
---@return number 
function BaseShieldGenerator.getShieldHitpoints() end

--- Returns the maximal hit points of the shield
---@return number 
function BaseShieldGenerator.getMaxShieldHitpoints() end

--- Returns distribution of resistance pool over resistance types
---@return table resistances Resistance to damage type {antimatter, electromagnetic, kinetic, thermic}
function BaseShieldGenerator.getResistances() end

--- Distribute the resistance pool according to damage type
---@param antimatter number Antimatter damage resistance
---@param electromagnetic number Electromagnetic damage resistance
---@param kinetic number Kinetic damage resistance
---@param thermic number Thermic damage resistance
---@return integer 
function BaseShieldGenerator.setResistances(antimatter, electromagnetic, kinetic, thermic) end

--- Returns time after which adjusting resistances is possible again
---@return number 
function BaseShieldGenerator.getResistancesCooldown() end

--- Returns maximal cooldown between adjusting resistances
---@return number 
function BaseShieldGenerator.getResistancesMaxCooldown() end

--- Returns total resistance pool that may be distributed
---@return number 
function BaseShieldGenerator.getResistancesPool() end

--- Returns the remaining amount of the resistance pool that can be distributed
---@return number 
function BaseShieldGenerator.getResistancesRemaining() end

--- Returns ratio per damage type of recent weapon impacts after applying resistance
---@return table stress Stress ratio due to damage type {antimatter, electromagnetic, kinetic, thermic}
function BaseShieldGenerator.getStressRatio() end

--- Returns ratio per damage type of recent weapon impacts without resistance
---@return table stress Stress ratio due to damage type {antimatter, electromagnetic, kinetic, thermic}
function BaseShieldGenerator.getStressRatioRaw() end

--- Returns stress, that is the total hit points of recent weapon impacts after applying resistance
---@return number 
function BaseShieldGenerator.getStressHitpoints() end

--- Returns stress, that is the total hit points of recent weapon impacts without resistance
---@return number 
function BaseShieldGenerator.getStressHitpointsRaw() end

--- Returns whether the base shield is currently in lockdown
---@return integer 
function BaseShieldGenerator.inLockdown() end

--- Returns the remaining time of the base shield lockdown
---@return number 
function BaseShieldGenerator.getLockdownRemaining() end

--- Returns the hour since midnight of the preferred lockdown exit
---@return integer 
function BaseShieldGenerator.getLockdownExitTime() end

--- Set hour since midnight for the preferred lockdown exit
---@param hour integer Preferred lockdown exit hour UTC
---@return integer 
function BaseShieldGenerator.setLockdownExitTime(hour) end

--- Emitted when we started or stopped the shield generator
---@param active integer 1 if the element was activated, 0 otherwise
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
BrakeEngine = {}
--- Show the element widget in the in-game widget stack
function BrakeEngine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function BrakeEngine.show() end

--- Hide the element widget in the in-game widget stack
function BrakeEngine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function BrakeEngine.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function BrakeEngine.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function BrakeEngine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function BrakeEngine.getData() end

--- Returns the element data ID
---@return string 
function BrakeEngine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function BrakeEngine.getDataId() end

--- Returns the element name
---@return string 
function BrakeEngine.getName() end

--- Returns the class of the Element
---@return string 
function BrakeEngine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function BrakeEngine.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function BrakeEngine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function BrakeEngine.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function BrakeEngine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function BrakeEngine.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function BrakeEngine.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function BrakeEngine.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function BrakeEngine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function BrakeEngine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function BrakeEngine.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function BrakeEngine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function BrakeEngine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function BrakeEngine.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function BrakeEngine.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function BrakeEngine.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function BrakeEngine.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function BrakeEngine.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function BrakeEngine.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function BrakeEngine.getWorldForward() end

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
---@return integer value The plug signal state
function BrakeEngine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function BrakeEngine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function BrakeEngine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function BrakeEngine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function BrakeEngine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function BrakeEngine.isIgnoringTags() end

--- Start the brake at full power (works only when run inside a cockpit or under remote control)
function BrakeEngine.activate() end

--- Stops the brake (works only when run inside a cockpit or under remote control)
function BrakeEngine.deactivate() end

--- Checks if the brake is active
---@return integer 
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
Construct = {}
--- Returns the name of the construct
---@return string 
function Construct.getName() end

--- Returns the construct unique ID
---@return integer 
function Construct.getId() end

--- Returns the owner entity
---@return table entity The owner entity table with fields {[int] id, [bool] isOrganization} describing the owner. Use system.getPlayerName(id) and system.getOrganization(id) to retrieve info about it
function Construct.getOwner() end

--- Returns the creator entity
---@return integer entity The owner entity table with fields {[int] id, [bool] isOrganization} describing the owner. Use system.getPlayerName(id) and system.getOrganization(id) to retrieve info about it
function Construct.getCreator() end

--- Checks if the construct is currently warping
---@return integer 
function Construct.isWarping() end

--- Returns the current warp state
---@return integer state The current warp state index (Idle = 1, Engage = 2, Align = 3, Spool = 4, Accelerate = 5, Cruise = 6, Decelerate = 7, Stopping = 8, Disengage = 9)
function Construct.getWarpState() end

--- Checks if the construct is in PvP zone
---@return integer 
function Construct.isInPvPZone() end

--- Returns the distance between the construct and the nearest safe zone
---@return number distance The distance to the nearest safe zone border in meters. Positive value if the construct is outside of any safe zone
function Construct.getDistanceToSafeZone() end

--- Returns the current construct PvP timer state
---@return number time The remaining time of the PvP timer, or 0.0 if elapsed
function Construct.getPvPTimer() end

--- Returns the mass of the construct
---@return number 
function Construct.getMass() end

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
---@return number value The construct's surface exposed in the current direction of movement in meters square
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
---@return number value The max speed along current moving direction in m/s
function Construct.getMaxSpeed() end

--- Returns the max angular speed
---@return number value The max angular speed in rad/s
function Construct.getMaxAngularSpeed() end

--- Returns the max speed per axis
---@return table value The max speed along axes {x, -x, y, -y, z, -z} in m/s
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
---@return table value The kinematics parameters in Newtons in the order: atmoRange.FMaxPlus, atmoRange.FMaxMinus, spaceRange.FMaxPlus, spaceRange.FMaxMinus
function Construct.getMaxThrustAlongAxis(taglist, CRefAxis) end

--- Returns the current braking force generated by construct brakes
---@return number value The current braking force in Newtons
function Construct.getCurrentBrake() end

--- Returns the maximum braking force that can currently be generated by the construct brakes
---@return number value The maximum braking force in Newtons
function Construct.getMaxBrake() end

--- Returns the world position of the construct
---@return table value The xyz world coordinates of the construct center position in meters
function Construct.getWorldPosition() end

--- The construct's linear velocity, relative to its parent, in construct local coordinates
---@return table value Relative linear velocity vector, in construct local coordinates in m/s
function Construct.getVelocity() end

--- The construct's linear velocity, relative to its parent, in world coordinates
---@return table value Relative linear velocity vector, in world coordinates in m/s
function Construct.getWorldVelocity() end

--- The construct's absolute linear velocity, in construct local coordinates
---@return table value Absolute linear velocity vector, in construct local coordinates in m/s
function Construct.getAbsoluteVelocity() end

--- The construct's absolute linear velocity, in world coordinates
---@return table value Absolute linear velocity vector, in world coordinates in m/s
function Construct.getWorldAbsoluteVelocity() end

--- The construct's linear acceleration, in construct local coordinates
---@return table value Linear acceleration vector, in construct local coordinates in m/s2
function Construct.getAcceleration() end

--- The construct's linear acceleration, in world coordinates
---@return table value Linear acceleration vector, in world coordinates in m/s2
function Construct.getWorldAcceleration() end

--- The construct's angular velocity, in construct local coordinates
---@return table value Angular velocity vector, in construct local coordinates in rad/s
function Construct.getAngularVelocity() end

--- The construct's angular velocity, in world coordinates
---@return table value Angular velocity vector, in world coordinates in rad/s
function Construct.getWorldAngularVelocity() end

--- The construct's angular acceleration, in construct local coordinates
---@return table value Angular acceleration vector, in construct local coordinates in rad/s2
function Construct.getAngularAcceleration() end

--- The construct's angular acceleration, in world coordinates
---@return table value Angular acceleration vector, in world coordinates in rad/s2
function Construct.getWorldAngularAcceleration() end

--- Returns the acceleration generated by air resistance
---@return table value The xyz world acceleration generated by air resistance
function Construct.getWorldAirFrictionAcceleration() end

--- Returns the acceleration torque generated by air resistance
---@return table value The xyz world acceleration torque generated by air resistance
function Construct.getWorldAirFrictionAngularAcceleration() end

--- Returns the speed at which your construct will suffer damage due to friction with the air
---@return number value The construct speed to get damages due to friction in m/s
function Construct.getFrictionBurnSpeed() end

--- Returns the forward vector of the construct coordinates system
---@return table value The forward vector of the construct coordinates system. It's a static value equal to (0,1,0)
function Construct.getForward() end

--- Returns the right vector of the construct coordinates system
---@return table value The right vector of the construct coordinates system. It's a static value equal to (1,0,0)
function Construct.getRight() end

--- Returns the up direction vector of the construct coordinates system
---@return table value The up vector of the construct coordinates system.. It's a static value equal to (0,0,1)
function Construct.getUp() end

--- Returns the forward direction vector of the construct, in world coordinates
---@return table value The forward direction vector of the construct, in world coordinates
function Construct.getWorldForward() end

--- Returns the right direction vector of the construct, in world coordinates
---@return table value The right direction vector of the construct, in world coordinates
function Construct.getWorldRight() end

--- Returns the up direction vector of the construct, in world coordinates
---@return table value The up direction vector of the construct, in world coordinates
function Construct.getWorldUp() end

--- Returns the local id of the current active orientation unit (core unit or gyro unit)
---@return integer value local id of the current active orientation unit (core unit or gyro unit)
function Construct.getOrientationUnitId() end

--- Returns the forward direction vector of the active orientation unit, in construct local coordinates
---@return table value Forward direction vector of the active orientation unit, in construct local coordinates
function Construct.getOrientationForward() end

--- Returns the right direction vector of the active orientation unit, in construct local coordinates
---@return table value Right direction vector of the active orientation unit, in construct local coordinates
function Construct.getOrientationRight() end

--- Returns the up direction vector of the active orientation unit, in construct local coordinates
---@return table value Up direction vector of the active orientation unit, in construct local coordinates
function Construct.getOrientationUp() end

--- Returns the forward direction vector of the active orientation unit, in world coordinates
---@return table value Forward direction vector of the active orientation unit, in world coordinates
function Construct.getWorldOrientationForward() end

--- Returns the right direction vector of the active orientation unit, in world coordinates
---@return table value Right direction vector of the active orientation unit, in world coordinates
function Construct.getWorldOrientationRight() end

--- Returns the up direction vector of the active orientation unit, in world coordinates
---@return table value Up direction vector of the active orientation unit, in world coordinates
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
---@return table value The position of the construct's parent in local coordinates
function Construct.getParentPosition() end

--- Returns the position of the construct's parent when docked in world coordinates
---@return table value The position of the construct's parent in world coordinates
function Construct.getParentWorldPosition() end

--- Returns the construct's parent forward direction vector, in local coordinates
---@return table value The construct's parent forward direction vector, in local coordinates
function Construct.getParentForward() end

--- Returns the construct's parent right direction vector, in construct local coordinates
---@return table value The construct's parent right direction vector, in construct local coordinates
function Construct.getParentRight() end

--- Returns the construct's parent up direction vector, in construct local coordinates
---@return table value The construct's parent up direction vector, in construct local coordinates
function Construct.getParentUp() end

--- Returns the construct's parent forward direction vector, in world coordinates
---@return table value The construct's parent forward direction vector, in world coordinates
function Construct.getParentWorldForward() end

--- Returns the construct's parent right direction vector, in world coordinates
---@return table value The construct's parent right direction vector, in world coordinates
function Construct.getParentWorldRight() end

--- Returns the construct's parent up direction vector, in world coordinates
---@return table value The construct's parent up direction vector, in world coordinates
function Construct.getParentWorldUp() end

--- Returns the list of player IDs on board the construct
---@return table 
function Construct.getPlayersOnBoard() end

--- Returns the list of player ids on board the construct inside a VR Station
---@return table 
function Construct.getPlayersOnBoardInVRStation() end

--- Checks if the given player is on board in the construct
---@param id integer The player id
---@return integer 
function Construct.isPlayerBoarded(id) end

--- Returns 1 if the given player is boarded to the construct inside a VR Station
---@param id integer The player id
---@return integer 
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
---@return integer 
function Construct.isConstructDocked(id) end

--- Returns the mass of the given construct if it is docked to the construct
---@param id integer The construct id
---@return number 
function Construct.getDockedConstructMass(id) end

--- Sets the docking mode
---@param mode integer The docking mode (Manual = 0, Automatic = 1, Semi-automatic = 2)
---@return integer 
function Construct.setDockingMode(mode) end

--- Returns the current docking mode
---@return integer mode The docking mode (Manual = 0, Automatic = 1, Semi-automatic = 2)
function Construct.getDockingMode() end

--- Sends a request to dock to the given construct. Limited to piloting controllers
---@param id integer The parent construct id
---@return integer 
function Construct.dock(id) end

--- Sends a request to undock the construct. Limited to piloting controllers
---@return integer 
function Construct.undock() end

--- Sends a request to deboard a player or surrogate with the given id
---@param id integer The player id
---@return integer 
function Construct.forceDeboard(id) end

--- Sends a request to undock a construct with the given id
---@param id integer The construct id
---@return integer 
function Construct.forceUndock(id) end

--- Sends a request to interrupt the surrogate session of a player with the given id
---@param id integer The player id
---@return integer 
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
---@param active boolean 1 if the timer started, false when the timer elapsed
---@type Event
Construct.onPvPTimer = Event:new()


---@class Container
Container = {}
--- Show the element widget in the in-game widget stack
function Container.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Container.show() end

--- Hide the element widget in the in-game widget stack
function Container.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Container.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Container.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Container.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Container.getData() end

--- Returns the element data ID
---@return string 
function Container.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Container.getDataId() end

--- Returns the element name
---@return string 
function Container.getName() end

--- Returns the class of the Element
---@return string 
function Container.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Container.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Container.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Container.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Container.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Container.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Container.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Container.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Container.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Container.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Container.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Container.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Container.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Container.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Container.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Container.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Container.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Container.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Container.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Container.getWorldForward() end

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
---@return integer value The plug signal state
function Container.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Container.getSignalOut(plug) end

--- Returns the mass of the container element(as if it were empty).
---@return number 
function Container.getSelfMass() end

--- Returns the container content mass(the sum of the mass of all items it contains).
---@return number 
function Container.getItemsMass() end

--- Returns the container content volume(the sum of the volume of all items it contains).
---@return number 
function Container.getItemsVolume() end

--- Returns the maximum volume of the container.
---@return number 
function Container.getMaxVolume() end

--- Returns a table describing the contents of the container, as a pair itemId and quantity per slot.
---@return table content The content of the container as a table with fields {[int] id, [float] quantity} per slot
function Container.getContent() end

---@deprecated Container.getItemsList() is deprecated, use Container.getContent() instead.
function Container.getItemsList() end

--- Send a request to get an update of the content of the container, limited to one call allowed per 30 seconds.
--- The onContentUpdate event is emitted by the container when the content is updated.
---@return number time If the request is not yet possible, returns the remaining time to wait for.
function Container.updateContent() end

---@deprecated Container.acquireStorage() is deprecated, use Container.updateContent() instead.
function Container.acquireStorage() end

--- Emitted when the container content is updated(storage update or after a manual request made with updateContent())
---@type Event
Container.onContentUpdate = Event:new()

---@type Event
Container.storageAcquired = Event:new()


---@class ControlUnit
ControlUnit = {}
--- Show the element widget in the in-game widget stack
function ControlUnit.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function ControlUnit.show() end

--- Hide the element widget in the in-game widget stack
function ControlUnit.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function ControlUnit.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function ControlUnit.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function ControlUnit.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function ControlUnit.getData() end

--- Returns the element data ID
---@return string 
function ControlUnit.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function ControlUnit.getDataId() end

--- Returns the element name
---@return string 
function ControlUnit.getName() end

--- Returns the class of the Element
---@return string 
function ControlUnit.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function ControlUnit.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function ControlUnit.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function ControlUnit.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function ControlUnit.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function ControlUnit.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function ControlUnit.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function ControlUnit.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function ControlUnit.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function ControlUnit.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function ControlUnit.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function ControlUnit.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function ControlUnit.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function ControlUnit.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function ControlUnit.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function ControlUnit.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function ControlUnit.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function ControlUnit.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function ControlUnit.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function ControlUnit.getWorldForward() end

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
---@return integer value The plug signal state
function ControlUnit.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
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
---@return number density The atmospheric density(between 0 and 1)
function ControlUnit.getAtmosphereDensity() end

--- Returns the influence rate of the nearest planet
---@return number rate The planet influence rate(between 0 and 1)
function ControlUnit.getClosestPlanetInfluence() end

--- Checks if the control unit is protected by DRM
---@return integer 
function ControlUnit.hasDRM() end

--- Check if the construct is remote controlled
---@return integer 
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
---@param keepForceCollinearity boolean Forces the resulting acceleration vector to be collinear to the acceleration parameter
---@param keepTorqueCollinearity boolean Forces the resulting angular acceleration vector to be collinear to the angular acceleration parameter
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
---@return table The total thrust in newtons
function ControlUnit.getEngineThrust(taglist) end

--- Set the value of throttle in the cockpit, which will be displayed in the cockpit widget when flying
--- This function must be used on a piloting controller
---@param axis integer Longitudinal = 0, lateral = 1, vertical = 2
---@param commandValue number In 'by throttle', the value of the throttle position: -1 = full reverse, 1 = full forward. Or In 'By Target Speed', the value of the target speed in km/h
function ControlUnit.setAxisCommandValue(axis, commandValue) end

--- Get the value of throttle in the cockpit
--- This function must be used on a piloting controller
---@param axis integer Longitudinal = 0, lateral = 1, vertical = 2
---@return number value In travel mode, return the value of the throttle position: -1 = full reverse, 1 = full forward or in cruise mode, return the value of the target speed
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
---@return integer 
function ControlUnit.isMouseControlActivated() end

--- Check if the mouse control direct scheme is selected
--- This function must be used on a piloting controller
---@return integer 
function ControlUnit.isMouseDirectControlActivated() end

--- Check if the mouse control virtual joystick scheme is selected
--- This function must be used on a piloting controller
---@return integer 
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
---@return table range Stabilization altitude capabilities for the least powerful engine and the most powerful engine
function ControlUnit.computeGroundEngineAltitudeStabilizationCapabilities() end

--- Return the current throttle value
--- This function must be used on a piloting controller
---@return number value Throttle value between -100 and 100
function ControlUnit.getThrottle() end

--- Set the label of a control mode buttons shown in the control unit widget
--- This function must be used on a piloting controller
---@param modeId integer The control mode: 0=Travel Mode, 1=Cruise Control by default
---@param label string The display name of the control mode, displayed on the widget button
function ControlUnit.setWidgetControlModeLabel(modeId, label) end

---@deprecated ControlUnit.setupControlMasterModeProperties() is deprecated, use ControlUnit.setWidgetControlModeLabel() instead.
function ControlUnit.setupControlMasterModeProperties() end

--- Checks if any landing gear is deployed
---@return 0 or 1 1 if any landing gear is deployed
function ControlUnit.isAnyLandingGearDeployed() end

---@deprecated ControlUnit.isAnyLandingGearDeployed() is deprecated, use ControlUnit.isAnyLandingGearExtended() instead.
function ControlUnit.isAnyLandingGearExtended() end

--- Deploy a end
function ControlUnit.deployLandingGears() end

---@deprecated ControlUnit.extendLandingGears() is deprecated, use ControlUnit.deployLandingGears() instead.
function ControlUnit.extendLandingGears() end

--- Retract all landing gears
function ControlUnit.retractLandingGears() end

--- Check construct lights status
---@return integer 
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
CoreUnit = {}
--- Show the element widget in the in-game widget stack
function CoreUnit.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function CoreUnit.show() end

--- Hide the element widget in the in-game widget stack
function CoreUnit.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function CoreUnit.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function CoreUnit.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function CoreUnit.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function CoreUnit.getData() end

--- Returns the element data ID
---@return string 
function CoreUnit.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function CoreUnit.getDataId() end

--- Returns the element name
---@return string 
function CoreUnit.getName() end

--- Returns the class of the Element
---@return string 
function CoreUnit.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function CoreUnit.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function CoreUnit.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function CoreUnit.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function CoreUnit.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function CoreUnit.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function CoreUnit.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function CoreUnit.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function CoreUnit.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function CoreUnit.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function CoreUnit.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function CoreUnit.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function CoreUnit.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function CoreUnit.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function CoreUnit.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function CoreUnit.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function CoreUnit.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function CoreUnit.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function CoreUnit.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function CoreUnit.getWorldForward() end

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
---@return integer value The plug signal state
function CoreUnit.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
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

---@deprecated CoreUnit.getSchematicInfo(schematicId) is deprecated, use construct.getSchematic(id) instead.
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
---@return table 
function CoreUnit.getElementIdList() end

--- Returns the name of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return string 
function CoreUnit.getElementNameById(localId) end

--- Returns the class of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return string 
function CoreUnit.getElementClassById(localId) end

--- Returns the display name of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return string 
function CoreUnit.getElementDisplayNameById(localId) end

---@deprecated CoreUnit.getElementTypeById(localId) is deprecated, use CoreUnit.getElementDisplayNameById(localId) instead.
function CoreUnit.getElementTypeById() end

--- Returns the item ID of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return integer 
function CoreUnit.getElementItemIdById(localId) end

--- Returns the current level of hit points of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return number 
function CoreUnit.getElementHitPointsById(localId) end

--- Returns the maximum level of hit points of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return number 
function CoreUnit.getElementMaxHitPointsById(localId) end

--- Returns the mass of the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return number 
function CoreUnit.getElementMassById(localId) end

--- Returns the position of the Element, identified by its local ID, in construct local coordinates.
---@param localId integer The local ID of the Element
---@return table 
function CoreUnit.getElementPositionById(localId) end

--- Returns the up direction vector of the Element, identified by its local ID, in construct local coordinates
---@param localId integer The local ID of the Element
---@return table 
function CoreUnit.getElementUpById(localId) end

--- Returns the right direction vector of the Element, identified by its local ID, in construct local coordinates
---@param localId integer The local ID of the Element
---@return table 
function CoreUnit.getElementRightById(localId) end

--- Returns the forward direction vector of the Element, identified by its local ID, in construct local coordinates
---@param localId integer The local ID of the Element
---@return table 
function CoreUnit.getElementForwardById(localId) end

--- Returns the status of the Industry Unit Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return table info If the Element is an Industry Unit, a table with fields {[int] state, [bool] stopRequested, [int] schematicId (deprecated = 0), [int] schematicsRemaining, [int] unitsProduced, [int] remainingTime, [int] batchesRequested, [int] batchesRemaining, [float] maintainProductAmount, [int] currentProductAmount, [table] currentProducts:{{[int] id, [double] quantity},...}}
function CoreUnit.getElementIndustryInfoById(localId) end

---@deprecated CoreUnit.getElementIndustryStatusById(localId) is deprecated, use CoreUnit.getElementIndustryInfoById(localId) instead.
function CoreUnit.getElementIndustryStatusById() end

--- Returns the list of tags associated to the Element, identified by its local ID
---@param localId integer The local ID of the Element
---@return string 
function CoreUnit.getElementTagsById(localId) end

--- Returns the altitude above sea level, with respect to the closest planet (0 in space)
---@return number 
function CoreUnit.getAltitude() end

--- Returns the local gravity intensity
---@return number 
function CoreUnit.getGravityIntensity() end

---@deprecated CoreUnit.g() is deprecated, use CoreUnit.getGravityIntensity() instead.
function CoreUnit.g() end

--- Returns the local gravity vector in world coordinates
---@return table 
function CoreUnit.getWorldGravity() end

--- Returns the vertical unit vector along gravity, in world coordinates (0 in space)
---@return table 
function CoreUnit.getWorldVertical() end

--- Returns the id of the current close stellar body
---@return integer 
function CoreUnit.getCurrentPlanetId() end

--- Returns the core's current stress, destroyed when reaching max stress
---@return number 
function CoreUnit.getCoreStress() end

--- Returns the maximal stress the core can bear before it gets destroyed
---@return number 
function CoreUnit.getMaxCoreStress() end

--- Returns the core's current stress to max stress ratio
---@return number 
function CoreUnit.getCoreStressRatio() end

--- Spawns a number sticker in the 3D world, with coordinates relative to the construct
---@param nb integer The number to display 0 to 9
---@param x number The x-coordinate in the construct in meters. 0 = center
---@param y number The y-coordinate in the construct in meters. 0 = center
---@param z number The z-coordinate in the construct in meters. 0 = center
---@param orientation string Orientation of the number. Possible values are "front", "side"
---@return integer 
function CoreUnit.spawnNumberSticker(nb, x, y, z, orientation) end

--- Spawns an arrow sticker in the 3D world, with coordinates relative to the construct
---@param x number The x-coordinate in the construct in meters. 0 = center
---@param y number the y-coordinate in the construct in meters. 0 = center
---@param z number The z-coordinate in the construct in meters. 0 = center
---@param orientation string Orientation of the arrow. Possible values are "up", "down", "north", "south", "east", "west"
---@return integer 
function CoreUnit.spawnArrowSticker(x, y, z, orientation) end

--- Delete the referenced sticker
---@param index integer Index of the sticker to delete
---@return integer 
function CoreUnit.deleteSticker(index) end

--- Move the referenced sticker
---@param index integer Index of the sticker to move
---@param x number The x-coordinate in the construct in meters. 0 = center
---@param y number The y-coordinate in the construct in meters. 0 = center
---@param z number The z-coordinate in the construct in meters. 0 = center
---@return integer 
function CoreUnit.moveSticker(index, x, y, z) end

--- Rotate the referenced sticker.
---@param index integer Index of the sticker to rotate
---@param angle_x number Rotation along the x-axis in degrees
---@param angle_y number Rotation along the y-axis in degrees
---@param angle_z number Rotation along the z-axis in degrees
---@return integer 
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


---@class Counter
Counter = {}
--- Show the element widget in the in-game widget stack
function Counter.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Counter.show() end

--- Hide the element widget in the in-game widget stack
function Counter.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Counter.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Counter.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Counter.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Counter.getData() end

--- Returns the element data ID
---@return string 
function Counter.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Counter.getDataId() end

--- Returns the element name
---@return string 
function Counter.getName() end

--- Returns the class of the Element
---@return string 
function Counter.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Counter.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Counter.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Counter.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Counter.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Counter.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Counter.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Counter.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Counter.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Counter.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Counter.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Counter.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Counter.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Counter.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Counter.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Counter.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Counter.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Counter.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Counter.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Counter.getWorldForward() end

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
---@return integer value The plug signal state
function Counter.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Counter.getSignalOut(plug) end

--- Returns the index of the current active output plug
---@return integer 
function Counter.getIndex() end

---@deprecated Counter.getCounterState() is deprecated, use Counter.getIndex() instead.
function Counter.getCounterState() end

--- Returns the maximum index of the counter
---@return integer 
function Counter.getMaxIndex() end

--- Moves the next counter index
function Counter.nextIndex() end

---@deprecated Counter.next() is deprecated, use Counter.nextIndex() instead.
function Counter.next() end

--- Sets the counter index
---@param index integer The index of the plug to activate
function Counter.setIndex(index) end


---@class Databank
Databank = {}
--- Show the element widget in the in-game widget stack
function Databank.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Databank.show() end

--- Hide the element widget in the in-game widget stack
function Databank.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Databank.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Databank.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Databank.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Databank.getData() end

--- Returns the element data ID
---@return string 
function Databank.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Databank.getDataId() end

--- Returns the element name
---@return string 
function Databank.getName() end

--- Returns the class of the Element
---@return string 
function Databank.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Databank.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Databank.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Databank.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Databank.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Databank.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Databank.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Databank.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Databank.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Databank.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Databank.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Databank.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Databank.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Databank.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Databank.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Databank.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Databank.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Databank.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Databank.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Databank.getWorldForward() end

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
---@return integer value The plug signal state
function Databank.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Databank.getSignalOut(plug) end

--- Clear the Databank
function Databank.clear() end

--- Returns the number of keys that are stored inside the Databank
---@return integer 
function Databank.getNbKeys() end

--- Returns all the keys in the Databank
---@return table value The key list, as a list of string
function Databank.getKeyList() end

---@deprecated Databank.getKeys() is deprecated, use Databank.getKeyList().
function Databank.getKeys() end

--- Returns 1 if the key is present in the Databank, 0 otherwise
---@param key string The key used to store a value
---@return integer value 1 if the key exists and 0 otherwise
function Databank.hasKey(key) end

--- Remove the given key if the key is present in the Databank
---@param key string The key used to store a value
---@return integer value 1 if the key has been successfully removed, 0 otherwise
function Databank.clearValue(key) end

--- Stores a string value at the given key
---@param key string The key used to store the value
---@param val string The value, as a string
function Databank.setStringValue(key, val) end

--- Returns value stored in the given key as a string
---@param key string The key used to retrieve the value
---@return string value The value as a string
function Databank.getStringValue(key) end

--- Stores an integer value at the given key
---@param key string The key used to store the value
---@param val integer The value, as an integer
function Databank.setIntValue(key, val) end

--- Returns value stored in the given key as an integer
---@param key string The key used to retrieve the value
---@return integer value The value as an integer
function Databank.getIntValue(key) end

--- Stores a floating number value at the given key
---@param key string The key used to store the value
---@param val number The value, as a floating number
function Databank.setFloatValue(key, val) end

--- Returns value stored in the given key as a floating number
---@param key string The key used to retrieve the value
---@return number value The value as a floating number
function Databank.getFloatValue(key) end


---@class DetectionZone
DetectionZone = {}
--- Show the element widget in the in-game widget stack
function DetectionZone.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function DetectionZone.show() end

--- Hide the element widget in the in-game widget stack
function DetectionZone.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function DetectionZone.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function DetectionZone.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function DetectionZone.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function DetectionZone.getData() end

--- Returns the element data ID
---@return string 
function DetectionZone.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function DetectionZone.getDataId() end

--- Returns the element name
---@return string 
function DetectionZone.getName() end

--- Returns the class of the Element
---@return string 
function DetectionZone.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function DetectionZone.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function DetectionZone.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function DetectionZone.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function DetectionZone.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function DetectionZone.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function DetectionZone.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function DetectionZone.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function DetectionZone.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function DetectionZone.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function DetectionZone.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function DetectionZone.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function DetectionZone.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function DetectionZone.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function DetectionZone.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function DetectionZone.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function DetectionZone.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function DetectionZone.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function DetectionZone.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function DetectionZone.getWorldForward() end

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
---@return integer value The plug signal state
function DetectionZone.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function DetectionZone.getSignalOut(plug) end

--- Returns the detection zone radius
---@return number 
function DetectionZone.getRadius() end

--- Returns the list of ids of the players in the detection zone
---@return table 
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
Door = {}
--- Show the element widget in the in-game widget stack
function Door.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Door.show() end

--- Hide the element widget in the in-game widget stack
function Door.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Door.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Door.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Door.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Door.getData() end

--- Returns the element data ID
---@return string 
function Door.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Door.getDataId() end

--- Returns the element name
---@return string 
function Door.getName() end

--- Returns the class of the Element
---@return string 
function Door.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Door.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Door.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Door.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Door.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Door.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Door.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Door.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Door.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Door.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Door.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Door.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Door.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Door.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Door.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Door.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Door.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Door.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Door.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Door.getWorldForward() end

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
---@return integer value The plug signal state
function Door.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
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
---@return integer 
function Door.isOpen() end

---@deprecated Door.getState() is deprecated, use Door.isOpen() instead.
function Door.getState() end

--- Toggle the door
function Door.toggle() end


---@class Element
Element = {}
--- Show the element widget in the in-game widget stack
function Element.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Element.show() end

--- Hide the element widget in the in-game widget stack
function Element.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Element.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Element.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Element.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Element.getData() end

--- Returns the element data ID
---@return string 
function Element.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Element.getDataId() end

--- Returns the element name
---@return string 
function Element.getName() end

--- Returns the class of the Element
---@return string 
function Element.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Element.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Element.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Element.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Element.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Element.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Element.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Element.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Element.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Element.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Element.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Element.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Element.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Element.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Element.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Element.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Element.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Element.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Element.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Element.getWorldForward() end

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
---@return integer value The plug signal state
function Element.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Element.getSignalOut(plug) end


---@class Emitter
Emitter = {}
--- Show the element widget in the in-game widget stack
function Emitter.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Emitter.show() end

--- Hide the element widget in the in-game widget stack
function Emitter.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Emitter.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Emitter.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Emitter.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Emitter.getData() end

--- Returns the element data ID
---@return string 
function Emitter.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Emitter.getDataId() end

--- Returns the element name
---@return string 
function Emitter.getName() end

--- Returns the class of the Element
---@return string 
function Emitter.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Emitter.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Emitter.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Emitter.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Emitter.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Emitter.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Emitter.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Emitter.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Emitter.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Emitter.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Emitter.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Emitter.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Emitter.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Emitter.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Emitter.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Emitter.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Emitter.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Emitter.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Emitter.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Emitter.getWorldForward() end

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
---@return integer value The plug signal state
function Emitter.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Emitter.getSignalOut(plug) end

--- Send a message on the given channel, limited to one transmission per frame and per channel
---@param channel string The channel name, limited to 64 characters. The message will not be sent if it exceeds this
---@param message string The message to be transmitted, truncated to 512 characters in case of overflow
function Emitter.send(channel, message) end

--- Returns the emitter range
---@return number 
function Emitter.getRange() end

--- Emitted when the emitter successfully sent a message
---@param channel string The channel name
---@param message string The transmitted message
---@type Event
Emitter.onSent = Event:new()


---@class Engine
Engine = {}
--- Show the element widget in the in-game widget stack
function Engine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Engine.show() end

--- Hide the element widget in the in-game widget stack
function Engine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Engine.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Engine.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Engine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Engine.getData() end

--- Returns the element data ID
---@return string 
function Engine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Engine.getDataId() end

--- Returns the element name
---@return string 
function Engine.getName() end

--- Returns the class of the Element
---@return string 
function Engine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Engine.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Engine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Engine.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Engine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Engine.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Engine.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Engine.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Engine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Engine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Engine.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Engine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Engine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Engine.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Engine.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Engine.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Engine.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Engine.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Engine.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Engine.getWorldForward() end

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
---@return integer value The plug signal state
function Engine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Engine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function Engine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function Engine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function Engine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function Engine.isIgnoringTags() end


---@class Firework
Firework = {}
--- Show the element widget in the in-game widget stack
function Firework.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Firework.show() end

--- Hide the element widget in the in-game widget stack
function Firework.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Firework.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Firework.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Firework.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Firework.getData() end

--- Returns the element data ID
---@return string 
function Firework.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Firework.getDataId() end

--- Returns the element name
---@return string 
function Firework.getName() end

--- Returns the class of the Element
---@return string 
function Firework.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Firework.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Firework.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Firework.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Firework.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Firework.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Firework.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Firework.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Firework.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Firework.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Firework.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Firework.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Firework.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Firework.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Firework.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Firework.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Firework.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Firework.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Firework.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Firework.getWorldForward() end

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
---@return integer value The plug signal state
function Firework.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Firework.getSignalOut(plug) end

--- Fire the firework
function Firework.fire() end

---@deprecated Firework.activate() is deprecated, use Firework.open() instead.
function Firework.activate() end

--- Set the delay before the launched Fireworks explodes
---@param delay number The delay before explosion in seconds (maximum 5s)
function Firework.setExplosionDelay(delay) end

--- Returns the delay before the launched Fireworks explodes
---@return number 
function Firework.getExplosionDelay() end

--- Set the speed at which the firework will be launched (impacts its altitude, depending on the local gravity).
---@param speed number The launch speed in m/s (maximum 200m/s)
function Firework.setLaunchSpeed(speed) end

--- Returns the speed at which the firework will be launched
---@return number 
function Firework.getLaunchSpeed() end

--- Set the type of launched firework (will affect which firework is picked in the attached Container)
---@param type integer The type index of the firework (Ball = 1, Ring = 2, Palmtree = 3, Shower = 4)
function Firework.setType(type) end

--- Returns the type of launched firework
---@return integer 
function Firework.getType() end

--- Set the color of the launched firework (will affect which firework is picked in the attached Container)
---@param color integer The color index of the firework (Blue = 1, Gold = 2, Green = 3, Purple = 4, Red = 5, Silver = 6)
function Firework.setColor(color) end

--- Returns the color of the launched firework
---@return integer 
function Firework.getColor() end

--- Emitted when a firework has just been fired
---@type Event
Firework.onFired = Event:new()


---@class ForceField
ForceField = {}
--- Show the element widget in the in-game widget stack
function ForceField.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function ForceField.show() end

--- Hide the element widget in the in-game widget stack
function ForceField.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function ForceField.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function ForceField.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function ForceField.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function ForceField.getData() end

--- Returns the element data ID
---@return string 
function ForceField.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function ForceField.getDataId() end

--- Returns the element name
---@return string 
function ForceField.getName() end

--- Returns the class of the Element
---@return string 
function ForceField.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function ForceField.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function ForceField.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function ForceField.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function ForceField.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function ForceField.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function ForceField.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function ForceField.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function ForceField.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function ForceField.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function ForceField.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function ForceField.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function ForceField.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function ForceField.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function ForceField.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function ForceField.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function ForceField.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function ForceField.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function ForceField.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function ForceField.getWorldForward() end

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
---@return integer value The plug signal state
function ForceField.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
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
---@return integer 
function ForceField.isDeployed() end

---@deprecated ForceField.getState() is deprecated, use ForceField.isDeployed() instead.
function ForceField.getState() end

--- Toggle the forcefield
function ForceField.toggle() end


---@class FueledEngine
FueledEngine = {}
--- Show the element widget in the in-game widget stack
function FueledEngine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function FueledEngine.show() end

--- Hide the element widget in the in-game widget stack
function FueledEngine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function FueledEngine.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function FueledEngine.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function FueledEngine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function FueledEngine.getData() end

--- Returns the element data ID
---@return string 
function FueledEngine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function FueledEngine.getDataId() end

--- Returns the element name
---@return string 
function FueledEngine.getName() end

--- Returns the class of the Element
---@return string 
function FueledEngine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function FueledEngine.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function FueledEngine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function FueledEngine.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function FueledEngine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function FueledEngine.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function FueledEngine.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function FueledEngine.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function FueledEngine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function FueledEngine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function FueledEngine.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function FueledEngine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function FueledEngine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function FueledEngine.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function FueledEngine.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function FueledEngine.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function FueledEngine.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function FueledEngine.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function FueledEngine.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function FueledEngine.getWorldForward() end

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
---@return integer value The plug signal state
function FueledEngine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function FueledEngine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function FueledEngine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function FueledEngine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function FueledEngine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function FueledEngine.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function FueledEngine.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function FueledEngine.deactivate() end

--- Checks if the engine is active
---@return integer 
function FueledEngine.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function FueledEngine.getState() end

--- Toggle the state of the engine
function FueledEngine.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function FueledEngine.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number 
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
---@return number 
function FueledEngine.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function FueledEngine.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number 
function FueledEngine.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function FueledEngine.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return integer 
function FueledEngine.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function FueledEngine.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table 
function FueledEngine.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table 
function FueledEngine.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table 
function FueledEngine.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function FueledEngine.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table 
function FueledEngine.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function FueledEngine.torqueAxis() end

--- Checks if the engine out of fuel
---@return integer 
function FueledEngine.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer 
function FueledEngine.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer 
function FueledEngine.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return integer 
function FueledEngine.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function FueledEngine.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number 
function FueledEngine.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number 
function FueledEngine.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number 
function FueledEngine.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number 
function FueledEngine.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function FueledEngine.getT50() end


---@class Gyro
Gyro = {}
--- Show the element widget in the in-game widget stack
function Gyro.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Gyro.show() end

--- Hide the element widget in the in-game widget stack
function Gyro.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Gyro.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Gyro.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Gyro.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Gyro.getData() end

--- Returns the element data ID
---@return string 
function Gyro.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Gyro.getDataId() end

--- Returns the element name
---@return string 
function Gyro.getName() end

--- Returns the class of the Element
---@return string 
function Gyro.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Gyro.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Gyro.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Gyro.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Gyro.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Gyro.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Gyro.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Gyro.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Gyro.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Gyro.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Gyro.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Gyro.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Gyro.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Gyro.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Gyro.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Gyro.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Gyro.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Gyro.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Gyro.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Gyro.getWorldForward() end

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
---@return integer value The plug signal state
function Gyro.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Gyro.getSignalOut(plug) end

--- Selects this gyro as the main gyro used for ship orientation
function Gyro.activate() end

--- Deselects this gyro as the main gyro used for ship orientation, using the Core Unit instead
function Gyro.deactivate() end

--- Toggle the activation state of the gyro
function Gyro.toggle() end

--- Returns the activation state of the gyro
---@return integer 
function Gyro.isActive() end

---@deprecated Gyro.getState() is deprecated, use Gyro.isActive() instead.
function Gyro.getState() end

--- The pitch value relative to the gyro orientation and the local gravity
---@return number pitch The pitch angle in degrees, relative to the gyro orientation and the local gravity
function Gyro.getPitch() end

--- The roll value relative to the gyro orientation and the local gravity
---@return number roll The roll angle in degrees, relative to the gyro orientation and the local gravity
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
HoverEngine = {}
--- Show the element widget in the in-game widget stack
function HoverEngine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function HoverEngine.show() end

--- Hide the element widget in the in-game widget stack
function HoverEngine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function HoverEngine.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function HoverEngine.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function HoverEngine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function HoverEngine.getData() end

--- Returns the element data ID
---@return string 
function HoverEngine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function HoverEngine.getDataId() end

--- Returns the element name
---@return string 
function HoverEngine.getName() end

--- Returns the class of the Element
---@return string 
function HoverEngine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function HoverEngine.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function HoverEngine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function HoverEngine.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function HoverEngine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function HoverEngine.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function HoverEngine.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function HoverEngine.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function HoverEngine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function HoverEngine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function HoverEngine.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function HoverEngine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function HoverEngine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function HoverEngine.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function HoverEngine.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function HoverEngine.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function HoverEngine.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function HoverEngine.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function HoverEngine.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function HoverEngine.getWorldForward() end

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
---@return integer value The plug signal state
function HoverEngine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function HoverEngine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function HoverEngine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function HoverEngine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function HoverEngine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function HoverEngine.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function HoverEngine.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function HoverEngine.deactivate() end

--- Checks if the engine is active
---@return integer 
function HoverEngine.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function HoverEngine.getState() end

--- Toggle the state of the engine
function HoverEngine.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function HoverEngine.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number 
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
---@return number 
function HoverEngine.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function HoverEngine.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number 
function HoverEngine.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function HoverEngine.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return integer 
function HoverEngine.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function HoverEngine.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table 
function HoverEngine.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table 
function HoverEngine.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table 
function HoverEngine.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function HoverEngine.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table 
function HoverEngine.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function HoverEngine.torqueAxis() end

--- Checks if the engine out of fuel
---@return integer 
function HoverEngine.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer 
function HoverEngine.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer 
function HoverEngine.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return integer 
function HoverEngine.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function HoverEngine.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number 
function HoverEngine.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number 
function HoverEngine.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number 
function HoverEngine.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number 
function HoverEngine.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function HoverEngine.getT50() end

--- Returns the distance to the first object detected in the direction of the thrust
---@return number 
function HoverEngine.getDistance() end

--- Returns the maximum functional distance from the ground
---@return number 
function HoverEngine.getMaxDistance() end


---@class Industry
Industry = {}
--- Show the element widget in the in-game widget stack
function Industry.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Industry.show() end

--- Hide the element widget in the in-game widget stack
function Industry.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Industry.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Industry.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Industry.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Industry.getData() end

--- Returns the element data ID
---@return string 
function Industry.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Industry.getDataId() end

--- Returns the element name
---@return string 
function Industry.getName() end

--- Returns the class of the Element
---@return string 
function Industry.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Industry.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Industry.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Industry.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Industry.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Industry.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Industry.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Industry.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Industry.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Industry.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Industry.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Industry.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Industry.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Industry.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Industry.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Industry.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Industry.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Industry.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Industry.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Industry.getWorldForward() end

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
---@return integer value The plug signal state
function Industry.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
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
---@return integer value (Stopped = 1, Running = 2, Jammed missing ingredient = 3, Jammed output full = 4, Jammed no output container = 5, Pending = 6, Jammed missing schematics = 7)
function Industry.getState() end

function Industry.getStatus() end

--- Returns the complete information of the industry
---@return integer value The complete state of the industry, a table with fields {[int] state, [bool] stopRequested, [int] schematicId (deprecated = 0), [int] schematicsRemaining, [int] unitsProduced, [int] remainingTime, [int] batchesRequested, [int] batchesRemaining, [float] maintainProductAmount, [int] currentProductAmount, [table] currentProducts:{{[int] id, [double] quantity},...}}
function Industry.getInfo() end

--- Get the count of completed cycles since the player started the unit
---@return integer 
function Industry.getCyclesCompleted() end

---@deprecated Industry.getCycleCountSinceStartup() is deprecated, use Industry.getCyclesCompleted() instead.
function Industry.getCycleCountSinceStartup() end

--- Returns the efficiency of the industry
---@return number 
function Industry.getEfficiency() end

--- Returns the time elapsed in seconds since the player started the unit for the latest time
---@return number 
function Industry.getUptime() end

--- Returns the list of items required to run the selected output product.
---@return table outputs Returns the list of products
function Industry.getInputs() end

--- Returns the list of id of the items currently produced.
---@return table outputs The first entry in the table is always the main product produced
function Industry.getOutputs() end

---@deprecated Industry.getCurrentSchematic() is deprecated.
function Industry.getCurrentSchematic() end

--- Set the item to produce from its id
---@param itemId integer The item id of the item to produce
---@return integer success The result of the operation 0 for a sucess, -1 if the industry is running
function Industry.setOutput(itemId) end

---@deprecated Industry.setCurrentSchematic(id) is deprecated, use Industry.setOutput(itemId) instead.
function Industry.setCurrentSchematic() end

--- Send a request to get an update of the content of the schematic bank, limited to one call allowed per 30 seconds
---@return number time If the request is not yet possible, returns the remaining time to wait for
function Industry.updateBank() end

--- Returns a table describing the contents of the schematic bank, as a pair itemId and quantity per slot
---@return table content The content of the schematic bank as a table with fields {[int] id, [float] quantity} per slot
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
LandingGear = {}
--- Show the element widget in the in-game widget stack
function LandingGear.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function LandingGear.show() end

--- Hide the element widget in the in-game widget stack
function LandingGear.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function LandingGear.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function LandingGear.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function LandingGear.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function LandingGear.getData() end

--- Returns the element data ID
---@return string 
function LandingGear.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function LandingGear.getDataId() end

--- Returns the element name
---@return string 
function LandingGear.getName() end

--- Returns the class of the Element
---@return string 
function LandingGear.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function LandingGear.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function LandingGear.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function LandingGear.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function LandingGear.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function LandingGear.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function LandingGear.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function LandingGear.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function LandingGear.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function LandingGear.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function LandingGear.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function LandingGear.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function LandingGear.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function LandingGear.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function LandingGear.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function LandingGear.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function LandingGear.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function LandingGear.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function LandingGear.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function LandingGear.getWorldForward() end

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
---@return integer value The plug signal state
function LandingGear.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function LandingGear.getSignalOut(plug) end

--- Deploys the landing gear
function LandingGear.deploy() end

---@deprecated LandingGear.activate() is deprecated, use LandingGear.deploy() instead.
function LandingGear.activate() end

--- Retracts the landing gear
function LandingGear.retract() end

---@deprecated ForceField.deactivate() is deprecated, use ForceField.retract() instead.
function LandingGear.deactivate() end

--- Checks if the landing gear is deployed
---@return integer 
function LandingGear.isDeployed() end

---@deprecated ForceField.getState() is deprecated, use ForceField.isDeployed() instead.
function LandingGear.getState() end

--- Toggle the landing gear
function LandingGear.toggle() end


---@class LaserDetector
LaserDetector = {}
--- Show the element widget in the in-game widget stack
function LaserDetector.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function LaserDetector.show() end

--- Hide the element widget in the in-game widget stack
function LaserDetector.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function LaserDetector.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function LaserDetector.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function LaserDetector.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function LaserDetector.getData() end

--- Returns the element data ID
---@return string 
function LaserDetector.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function LaserDetector.getDataId() end

--- Returns the element name
---@return string 
function LaserDetector.getName() end

--- Returns the class of the Element
---@return string 
function LaserDetector.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function LaserDetector.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function LaserDetector.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function LaserDetector.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function LaserDetector.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function LaserDetector.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function LaserDetector.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function LaserDetector.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function LaserDetector.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function LaserDetector.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function LaserDetector.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function LaserDetector.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function LaserDetector.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function LaserDetector.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function LaserDetector.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function LaserDetector.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function LaserDetector.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function LaserDetector.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function LaserDetector.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function LaserDetector.getWorldForward() end

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
---@return integer value The plug signal state
function LaserDetector.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function LaserDetector.getSignalOut(plug) end

--- Checks if any laser is hitting the detector
---@return integer 
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
LaserEmitter = {}
--- Show the element widget in the in-game widget stack
function LaserEmitter.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function LaserEmitter.show() end

--- Hide the element widget in the in-game widget stack
function LaserEmitter.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function LaserEmitter.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function LaserEmitter.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function LaserEmitter.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function LaserEmitter.getData() end

--- Returns the element data ID
---@return string 
function LaserEmitter.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function LaserEmitter.getDataId() end

--- Returns the element name
---@return string 
function LaserEmitter.getName() end

--- Returns the class of the Element
---@return string 
function LaserEmitter.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function LaserEmitter.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function LaserEmitter.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function LaserEmitter.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function LaserEmitter.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function LaserEmitter.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function LaserEmitter.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function LaserEmitter.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function LaserEmitter.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function LaserEmitter.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function LaserEmitter.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function LaserEmitter.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function LaserEmitter.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function LaserEmitter.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function LaserEmitter.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function LaserEmitter.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function LaserEmitter.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function LaserEmitter.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function LaserEmitter.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function LaserEmitter.getWorldForward() end

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
---@return integer value The plug signal state
function LaserEmitter.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function LaserEmitter.getSignalOut(plug) end

--- Activates the laser emitter
function LaserEmitter.activate() end

--- Deactivates the laser emitter
function LaserEmitter.deactivate() end

--- Toggle the laser emitter
function LaserEmitter.toggle() end

--- Checks if the laser emitter is active
---@return integer 
function LaserEmitter.isActive() end

---@deprecated LaserEmitter.getState() is deprecated, use LaserEmitter.isActive() instead.
function LaserEmitter.getState() end


---@class Library
Library = {}
--- Solve the 3D linear system M*x=c0 where M is defined by its column vectors c1,c2,c3
---@param c1 table The first column of the matrix M
---@param c2 table The second column of the matrix M
---@param c3 table The third column of the matrix M
---@param c0 table The target column vector of the system
---@return table value The vec3 solution of the above system
function Library.systemResolution3(c1, c2, c3, c0) end

--- Solve the 2D linear system M*x=c0 where M is defined by its column vectors c1,c2
---@param c1 table The first column of the matrix M
---@param c2 table The second column of the matrix M
---@param c0 table The target column vector of the system
---@return table value The vec2 solution of the above system
function Library.systemResolution2(c1, c2, c0) end

--- Returns the position of the given point in world coordinates system, on the game screen
---@param worldPos table: The world position of the point
---@return table value The position in percentage (between 0 and 1) of the screen resolution as vec3 with {x, y, depth}
function Library.getPointOnScreen(worldPos) end


---@class Light
Light = {}
--- Show the element widget in the in-game widget stack
function Light.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Light.show() end

--- Hide the element widget in the in-game widget stack
function Light.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Light.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Light.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Light.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Light.getData() end

--- Returns the element data ID
---@return string 
function Light.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Light.getDataId() end

--- Returns the element name
---@return string 
function Light.getName() end

--- Returns the class of the Element
---@return string 
function Light.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Light.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Light.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Light.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Light.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Light.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Light.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Light.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Light.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Light.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Light.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Light.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Light.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Light.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Light.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Light.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Light.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Light.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Light.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Light.getWorldForward() end

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
---@return integer value The plug signal state
function Light.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Light.getSignalOut(plug) end

--- Switches the light on
function Light.activate() end

--- Switches the light off
function Light.deactivate() end

--- Checks if the light is on
---@return integer 
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
---@return table color  A vec3 for the red, blue and green components of the light, with values between 0.0 and 1.0, up to 5.0.
function Light.getColor() end

---@deprecated Light.getRGBColor() is deprecated, use Light.getColor() instead.
function Light.getRGBColor() end

--- Returns the blinking state of the light
---@param state boolean True to enable light blinking
function Light.setBlinkingState(state) end

--- Checks if the light blinking is enabled
---@return integer 
function Light.isBlinking() end

--- Returns the light 'on' blinking duration
---@return number 
function Light.getOnBlinkingDuration() end

--- Set the light 'on' blinking duration
---@param time number The duration of the 'on' blinking in seconds
function Light.setOnBlinkingDuration(time) end

--- Returns the light 'off' blinking duration
---@return number 
function Light.getOffBlinkingDuration() end

--- Set the light 'off' blinking duration
---@param time number The duration of the 'off' blinking in seconds
function Light.setOffBlinkingDuration(time) end

--- Returns the light blinking time shift
---@return number 
function Light.getBlinkingTimeShift() end

--- Set the light blinking time shift
---@param shift number The time shift of the blinking
function Light.setBlinkingTimeShift(shift) end


---@class ManualButton
ManualButton = {}
--- Show the element widget in the in-game widget stack
function ManualButton.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function ManualButton.show() end

--- Hide the element widget in the in-game widget stack
function ManualButton.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function ManualButton.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function ManualButton.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function ManualButton.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function ManualButton.getData() end

--- Returns the element data ID
---@return string 
function ManualButton.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function ManualButton.getDataId() end

--- Returns the element name
---@return string 
function ManualButton.getName() end

--- Returns the class of the Element
---@return string 
function ManualButton.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function ManualButton.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function ManualButton.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function ManualButton.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function ManualButton.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function ManualButton.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function ManualButton.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function ManualButton.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function ManualButton.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function ManualButton.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function ManualButton.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function ManualButton.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function ManualButton.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function ManualButton.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function ManualButton.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function ManualButton.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function ManualButton.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function ManualButton.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function ManualButton.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function ManualButton.getWorldForward() end

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
---@return integer value The plug signal state
function ManualButton.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function ManualButton.getSignalOut(plug) end

--- Checks if the manual button is down
---@return integer 
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
ManualSwitch = {}
--- Show the element widget in the in-game widget stack
function ManualSwitch.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function ManualSwitch.show() end

--- Hide the element widget in the in-game widget stack
function ManualSwitch.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function ManualSwitch.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function ManualSwitch.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function ManualSwitch.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function ManualSwitch.getData() end

--- Returns the element data ID
---@return string 
function ManualSwitch.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function ManualSwitch.getDataId() end

--- Returns the element name
---@return string 
function ManualSwitch.getName() end

--- Returns the class of the Element
---@return string 
function ManualSwitch.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function ManualSwitch.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function ManualSwitch.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function ManualSwitch.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function ManualSwitch.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function ManualSwitch.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function ManualSwitch.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function ManualSwitch.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function ManualSwitch.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function ManualSwitch.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function ManualSwitch.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function ManualSwitch.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function ManualSwitch.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function ManualSwitch.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function ManualSwitch.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function ManualSwitch.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function ManualSwitch.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function ManualSwitch.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function ManualSwitch.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function ManualSwitch.getWorldForward() end

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
---@return integer value The plug signal state
function ManualSwitch.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function ManualSwitch.getSignalOut(plug) end

--- Switches the switch on
function ManualSwitch.activate() end

--- Switches the switch off
function ManualSwitch.deactivate() end

--- Toggle the switch
function ManualSwitch.toggle() end

--- Checks if the switch is active
---@return integer 
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
MiningUnit = {}
--- Show the element widget in the in-game widget stack
function MiningUnit.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function MiningUnit.show() end

--- Hide the element widget in the in-game widget stack
function MiningUnit.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function MiningUnit.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function MiningUnit.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function MiningUnit.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function MiningUnit.getData() end

--- Returns the element data ID
---@return string 
function MiningUnit.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function MiningUnit.getDataId() end

--- Returns the element name
---@return string 
function MiningUnit.getName() end

--- Returns the class of the Element
---@return string 
function MiningUnit.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function MiningUnit.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function MiningUnit.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function MiningUnit.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function MiningUnit.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function MiningUnit.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function MiningUnit.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function MiningUnit.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function MiningUnit.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function MiningUnit.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function MiningUnit.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function MiningUnit.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function MiningUnit.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function MiningUnit.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function MiningUnit.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function MiningUnit.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function MiningUnit.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function MiningUnit.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function MiningUnit.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function MiningUnit.getWorldForward() end

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
---@return integer value The plug signal state
function MiningUnit.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function MiningUnit.getSignalOut(plug) end

--- Returns the current state of the mining unit
---@return integer state The status of the mining unit can be (Stopped = 1, Running = 2, Jammed output full = 3, Jammed no output container = 4)
function MiningUnit.getState() end

---@deprecated MiningUnit.getStatus() is deprecated, use MiningUnit.getState() instead.
function MiningUnit.getStatus() end

--- Returns the remaining time of the current batch extraction process.
---@return number 
function MiningUnit.getRemainingTime() end

--- Returns the item ID of the currently selected ore.
---@return integer 
function MiningUnit.getActiveOre() end

--- Returns the list of available ore pools
---@return table pool A list of tables composed with {[int] oreId, [float] available, [float] maximum);
function MiningUnit.getOrePools() end

--- Returns the base production rate of the mining unit.
---@return number 
function MiningUnit.getBaseRate() end

--- Returns the efficiency rate of the mining unit.
---@return number 
function MiningUnit.getEfficiency() end

--- Returns the calibration rate of the mining unit.
---@return number 
function MiningUnit.getCalibrationRate() end

--- Returns the optimal calibration rate of the mining unit.
---@return number 
function MiningUnit.getOptimalRate() end

--- Returns the current production rate of the mining unit.
---@return number 
function MiningUnit.getProductionRate() end

--- Returns the territory's adjacency bonus to the territory of the mining unit. Note: This value is updated only when a new batch is started.
---@return number 
function MiningUnit.getAdjacencyBonus() end

--- Returns the position of the last calibration excavation, in world coordinates.
---@return table 
function MiningUnit.getLastExtractionPosition() end

--- Returns the ID of the last player who calibrated the mining unit.
---@return integer 
function MiningUnit.getLastExtractingPlayerId() end

--- Returns the time in seconds since the last calibration of the mining unit.
---@return number 
function MiningUnit.getLastExtractionTime() end

--- Returns the item ID of the ore extracted during the last calibration excavation.
---@return integer 
function MiningUnit.getLastExtractedOre() end

--- Returns the volume of ore extracted during the last calibration excavation.
---@return number 
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
PlasmaExtractor = {}
--- Show the element widget in the in-game widget stack
function PlasmaExtractor.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function PlasmaExtractor.show() end

--- Hide the element widget in the in-game widget stack
function PlasmaExtractor.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function PlasmaExtractor.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function PlasmaExtractor.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function PlasmaExtractor.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function PlasmaExtractor.getData() end

--- Returns the element data ID
---@return string 
function PlasmaExtractor.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function PlasmaExtractor.getDataId() end

--- Returns the element name
---@return string 
function PlasmaExtractor.getName() end

--- Returns the class of the Element
---@return string 
function PlasmaExtractor.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function PlasmaExtractor.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function PlasmaExtractor.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function PlasmaExtractor.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function PlasmaExtractor.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function PlasmaExtractor.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function PlasmaExtractor.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function PlasmaExtractor.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function PlasmaExtractor.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function PlasmaExtractor.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function PlasmaExtractor.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function PlasmaExtractor.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function PlasmaExtractor.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function PlasmaExtractor.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function PlasmaExtractor.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function PlasmaExtractor.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function PlasmaExtractor.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function PlasmaExtractor.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function PlasmaExtractor.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function PlasmaExtractor.getWorldForward() end

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
---@return integer value The plug signal state
function PlasmaExtractor.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function PlasmaExtractor.getSignalOut(plug) end

--- Returns the current status of the plasma extractor
---@return integer status The status of the plasma extractor can be (Stopped = 1, Running = 2, Jammed output full = 3, Jammed no output container = 4)
function PlasmaExtractor.getStatus() end

--- Returns the remaining time of the current batch extraction process.
---@return number 
function PlasmaExtractor.getRemainingTime() end

--- Returns the list of available plasma pools
---@return table pool A list of tables composed with {[int] oreId, [float] available, [float] maximum);
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
Player = {}
--- Returns the player name
---@return string value The player name
function Player.getName() end

--- Return the ID of the player
---@return integer value The ID of the player
function Player.getId() end

--- Returns the player mass
---@return number value The mass of the player in kilograms
function Player.getMass() end

--- Returns the player's nanopack content mass
---@return number value The player's nanopack content mass in kilograms
function Player.getNanopackMass() end

--- Returns the player's nanopack content volume
---@return number value The player's nanopack content volume in liters
function Player.getNanopackVolume() end

--- Returns the player's nanopack maximum volume
---@return number value The player's nanopack maximum volume in liters
function Player.getNanopackMaxVolume() end

--- Returns the list of organization IDs of the player
---@return table value The list of organization IDs
function Player.getOrgIds() end

--- Returns the position of the player, in construct local coordinates
---@return table value The position in construct local coordinates
function Player.getPosition() end

--- Returns the position of the player, in world coordinates
---@return table value The position in world coordinates
function Player.getWorldPosition() end

--- Returns the position of the head of the player's character, in construct local coordinates
---@return table value The position of the head in construct local coordinates
function Player.getHeadPosition() end

--- Returns the position of the head of the player's character, in world coordinates
---@return table value The position of the head in world coordinates
function Player.getWorldHeadPosition() end

--- Returns the velocity vector of the player, in construct local coordinates
---@return table value The velocity vector in construct local coordinates
function Player.getVelocity() end

--- Returns the velocity vector of the player, in world coordinates
---@return table value The velocity vector in world coordinates
function Player.getWorldVelocity() end

--- Returns the absolute velocity vector of the player, in world coordinates
---@return table value The velocity absolute vector in world coordinates
function Player.getAbsoluteVelocity() end

--- Returns the forward direction vector of the player, in construct local coordinates
---@return table value The forward direction vector in construct local coordinates
function Player.getForward() end

--- Returns the right direction vector of the player, in construct local coordinates
---@return table value The right direction vector in construct local coordinates
function Player.getRight() end

--- Returns the up direction vector of the player, in construct local coordinates
---@return table value The up direction vector in construct local coordinates
function Player.getUp() end

--- Returns the forward direction vector of the player, in world coordinates
---@return table value The forward direction vector in world coordinates
function Player.getWorldForward() end

--- Returns the right direction vector of the player, in world coordinates
---@return table value The right direction vector in world coordinates
function Player.getWorldRight() end

--- Returns the up direction vector of the player, in world coordinates
---@return table value The up direction vector in world coordinates
function Player.getWorldUp() end

--- Returns the id of the planet the player is located on
---@return integer value The id of the planet, 0 if none
function Player.getPlanet() end

--- Returns the identifier of the construct to which the player is parented
---@return integer value The id of the construct, 0 if none
function Player.getParent() end

--- Checks if the player is seated
---@return integer value 1 if the player is seated
function Player.isSeated() end

--- Returns the local id of the seat on which the player is sitting
---@return integer value The local id of the seat, or 0 is not seated
function Player.getSeatId() end

--- Checks if the player is parented to the given construct
---@param id integer The construct id
---@return integer value 1 if the player is parented to the given construct
function Player.isParentedTo(id) end

--- Checks if the player is currently sprinting
---@return integer value 1 if the player is sprinting
function Player.isSprinting() end

--- Checks if the player's jetpack is on
---@return integer value 1 if the player's jetpack is on
function Player.isJetpackOn() end

--- Returns the state of the headlight of the player
---@return integer 1 if the player has his headlight on
function Player.isHeadlightOn() end

--- Set the state of the headlight of the player
---@param state boolean : True to turn on headlight
function Player.setHeadlightOn(state) end

--- Freezes the player movements, liberating the associated movement keys to be used by the script.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal)
---@param state boolean 1 freeze the character, 0 unfreeze the character
function Player.freeze(state) end

--- Checks if the player movements are frozen
---@return integer value 1 if the player is frozen, 0 otherwise
function Player.isFrozen() end

--- Checks if the player has DRM autorization to the control unit
---@return integer value 1 if the player has DRM autorization on the control unit
function Player.hasDRMAutorization() end

--- Emitted when the player parent change
---@param oldId integer The previous parent construct ID
---@param newId integer The new parent construct ID
---@type Event
Player.onParentChanged = Event:new()


---@class PressureTile
PressureTile = {}
--- Show the element widget in the in-game widget stack
function PressureTile.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function PressureTile.show() end

--- Hide the element widget in the in-game widget stack
function PressureTile.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function PressureTile.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function PressureTile.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function PressureTile.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function PressureTile.getData() end

--- Returns the element data ID
---@return string 
function PressureTile.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function PressureTile.getDataId() end

--- Returns the element name
---@return string 
function PressureTile.getName() end

--- Returns the class of the Element
---@return string 
function PressureTile.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function PressureTile.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function PressureTile.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function PressureTile.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function PressureTile.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function PressureTile.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function PressureTile.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function PressureTile.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function PressureTile.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function PressureTile.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function PressureTile.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function PressureTile.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function PressureTile.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function PressureTile.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function PressureTile.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function PressureTile.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function PressureTile.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function PressureTile.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function PressureTile.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function PressureTile.getWorldForward() end

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
---@return integer value The plug signal state
function PressureTile.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function PressureTile.getSignalOut(plug) end

--- Checks if the pressure tile is down
---@return integer 
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
Radar = {}
--- Show the element widget in the in-game widget stack
function Radar.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Radar.show() end

--- Hide the element widget in the in-game widget stack
function Radar.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Radar.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Radar.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Radar.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Radar.getData() end

--- Returns the element data ID
---@return string 
function Radar.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Radar.getDataId() end

--- Returns the element name
---@return string 
function Radar.getName() end

--- Returns the class of the Element
---@return string 
function Radar.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Radar.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Radar.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Radar.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Radar.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Radar.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Radar.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Radar.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Radar.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Radar.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Radar.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Radar.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Radar.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Radar.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Radar.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Radar.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Radar.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Radar.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Radar.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Radar.getWorldForward() end

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
---@return integer value The plug signal state
function Radar.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Radar.getSignalOut(plug) end

--- Returns 1 if the radar is not broken, works in the current environment and is not used by another control unit
---@return integer state 1 if the radar is operational, otherwise: 0 = broken, -1 = bad environment, -2 = obstructed, -3 = already in use
function Radar.getOperationalState() end

---@deprecated Radar.isOperational() is deprecated, use Radar.getOperationalState() instead.
function Radar.isOperational() end

--- Returns the scan range of the radar
---@return number value The scan range
function Radar.getRange() end

--- Returns ranges to identify a target based on its core size
---@return table ranges The list of float values for ranges in meters as { xsRange, sRange, mRange, lRange }
function Radar.getIdentifyRanges() end

--- Returns the list of construct IDs in the scan range
---@return table 
function Radar.getConstructIds() end

--- Returns the list of identified construct IDs
---@return table 
function Radar.getIdentifiedConstructIds() end

--- Returns the ID of the target construct
---@return integer 
function Radar.getTargetId() end

--- Returns the distance to the given construct
---@return number 
function Radar.getConstructDistance() end

--- Returns 1 if the given construct is identified
---@return integer 
function Radar.isConstructIdentified() end

--- Returns 1 if the given construct was abandoned
---@return integer 
function Radar.isConstructAbandoned() end

--- Returns the core size of the given construct
---@return string size The core size name; can be 'XS', 'S', 'M', 'L', 'XL'
function Radar.getConstructCoreSize() end

--- Returns the threat rate your construct is for the given construct
---@return integer threat The threat rate index (None = 1, Identified = 2, Threatened and identified = 3, Threatened = 4, Attacked = 5), can be -1 if the radar is not operational
function Radar.getThreatRateTo() end

---@deprecated Radar.getThreatTo(id) is deprecated, use Radar.getThreatRateTo(id) instead.
function Radar.getThreatTo() end

--- Returns the threat rate the given construct is for your construct
---@return string threat The threat rate index (None = 1, Identified = 2, Threatened and identified = 3, Threatened = 4, Attacked = 5), can be -1 if the radar is not operational
function Radar.getThreatRateFrom() end

---@deprecated Radar.getThreatFrom(id) is deprecated, use Radar.getThreatRateFrom(id) instead.
function Radar.getThreatFrom() end

--- Returns whether the target has an active Transponder with matching tags
---@return integer 
function Radar.hasMatchingTransponder() end

--- Returns a table with id of the owner entity (player or organization) of the given construct, if in range and if active transponder tags match for owned dynamic constructs.
---@param id integer The ID of the construct
---@return table entity A table with fields {[int] id, [bool] isOrganization} describing the owner. Use system.getPlayerName(id) and system.getOrganization(id) to retrieve info about it
function Radar.getConstructOwnerEntity(id) end

---@deprecated Radar.getConstructOwner(id) is deprecated, use Radar.getConstructOwnerEntity(id) instead.
function Radar.getConstructOwner() end

--- Return the size of the bounding box of the given construct, if in range
---@param id integer The ID of the construct
---@return table 
function Radar.getConstructSize(id) end

--- Return the kind of the given construct
---@param id integer The ID of the construct
---@return integer kind The kind index of the construct (Universe = 1, Planet = 2,Asteroid = 3,Static = 4,Dynamic = 5,Space = 6,Alien = 7)
function Radar.getConstructKind(id) end

---@deprecated Radar.getConstructType(id) is deprecated, use Radar.getConstructKind(id) instead.
function Radar.getConstructType() end

--- Returns the position of the given construct in construct local coordinates, if active transponder tags match for owned dynamic constructs
---@param id integer The ID of the construct
---@return table 
function Radar.getConstructPos(id) end

--- Returns the position of the given construct in world coordinates, if in range and if active transponder tags match for owned dynamic constructs
---@param id integer The ID of the construct
---@return table 
function Radar.getConstructWorldPos(id) end

--- Returns the velocity vector of the given construct in construct local coordinates, if identified and if active transponder tags match for owned dynamic constructs
---@param id integer The ID of the construct
---@return table 
function Radar.getConstructVelocity(id) end

--- Returns the velocity vector of the given construct in world coordinates, if identified and if active transponder tags match for owned dynamic constructs
---@param id integer The ID of the construct
---@return table 
function Radar.getConstructWorldVelocity(id) end

--- Returns the mass of the given construct, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return number mass The mass of the construct in kilograms
function Radar.getConstructMass(id) end

--- Return the name of the given construct, if defined
---@param id integer The ID of the construct
---@return string 
function Radar.getConstructName(id) end

--- Returns a table of working elements on the given construction, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return table info A table with fields : {[float] weapons, [float] radars, [float] antiGravity, [float] atmoEngines, [float] spaceEngines, [float] rocketEngines} with values between 0.0 and 1.0. Exceptionally antiGravity and rocketEngines are always 1.0 if present, even if broken
function Radar.getConstructInfos(id) end

--- Returns the speed of the given construct, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return number speed The speed of the construct relative to the universe in meters per second
function Radar.getConstructSpeed(id) end

--- Returns the angular speed of the given construct to your construct, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return number speed The angular speed of the construct relative to our construct in radians per second
function Radar.getConstructAngularSpeed(id) end

--- Returns the radial speed of the given construct to your construct, if identified for owned dynamic constructs
---@param id integer The ID of the construct
---@return number speed The radial speed of the construct relative to our construct in meters per second
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
Receiver = {}
--- Show the element widget in the in-game widget stack
function Receiver.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Receiver.show() end

--- Hide the element widget in the in-game widget stack
function Receiver.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Receiver.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Receiver.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Receiver.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Receiver.getData() end

--- Returns the element data ID
---@return string 
function Receiver.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Receiver.getDataId() end

--- Returns the element name
---@return string 
function Receiver.getName() end

--- Returns the class of the Element
---@return string 
function Receiver.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Receiver.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Receiver.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Receiver.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Receiver.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Receiver.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Receiver.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Receiver.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Receiver.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Receiver.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Receiver.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Receiver.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Receiver.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Receiver.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Receiver.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Receiver.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Receiver.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Receiver.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Receiver.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Receiver.getWorldForward() end

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
---@return integer value The plug signal state
function Receiver.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Receiver.getSignalOut(plug) end

--- Returns the receiver range
---@return number 
function Receiver.getRange() end

--- Checks if the given channel exists in the receiver channels list
---@param channel string The channels list as Lua table
---@return integer 
function Receiver.hasChannel(channel) end

--- Set the channels list
---@param channels table The channels list as Lua table
---@return integer 1 if the channels list has been successfully set
function Receiver.setChannelList(channels) end

---@deprecated Receiver.setChannels(channels) is deprecated, use Receiver.setChannelList(channels) instead.
function Receiver.setChannels() end

--- Returns the channels list
---@return table channels The channels list as Lua table
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


---@class RocketEngine
RocketEngine = {}
--- Show the element widget in the in-game widget stack
function RocketEngine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function RocketEngine.show() end

--- Hide the element widget in the in-game widget stack
function RocketEngine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function RocketEngine.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function RocketEngine.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function RocketEngine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function RocketEngine.getData() end

--- Returns the element data ID
---@return string 
function RocketEngine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function RocketEngine.getDataId() end

--- Returns the element name
---@return string 
function RocketEngine.getName() end

--- Returns the class of the Element
---@return string 
function RocketEngine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function RocketEngine.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function RocketEngine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function RocketEngine.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function RocketEngine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function RocketEngine.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function RocketEngine.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function RocketEngine.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function RocketEngine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function RocketEngine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function RocketEngine.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function RocketEngine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function RocketEngine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function RocketEngine.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function RocketEngine.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function RocketEngine.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function RocketEngine.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function RocketEngine.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function RocketEngine.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function RocketEngine.getWorldForward() end

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
---@return integer value The plug signal state
function RocketEngine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function RocketEngine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function RocketEngine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function RocketEngine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function RocketEngine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function RocketEngine.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function RocketEngine.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function RocketEngine.deactivate() end

--- Checks if the engine is active
---@return integer 
function RocketEngine.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function RocketEngine.getState() end

--- Toggle the state of the engine
function RocketEngine.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function RocketEngine.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number 
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
---@return number 
function RocketEngine.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function RocketEngine.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number 
function RocketEngine.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function RocketEngine.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return integer 
function RocketEngine.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function RocketEngine.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table 
function RocketEngine.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table 
function RocketEngine.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table 
function RocketEngine.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function RocketEngine.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table 
function RocketEngine.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function RocketEngine.torqueAxis() end

--- Checks if the engine out of fuel
---@return integer 
function RocketEngine.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer 
function RocketEngine.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer 
function RocketEngine.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return integer 
function RocketEngine.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function RocketEngine.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number 
function RocketEngine.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number 
function RocketEngine.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number 
function RocketEngine.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number 
function RocketEngine.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function RocketEngine.getT50() end

---@deprecated RocketEngine.getDistance() is deprecated.
function RocketEngine.getDistance() end


---@class Screen
Screen = {}
--- Show the element widget in the in-game widget stack
function Screen.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Screen.show() end

--- Hide the element widget in the in-game widget stack
function Screen.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Screen.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Screen.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Screen.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Screen.getData() end

--- Returns the element data ID
---@return string 
function Screen.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Screen.getDataId() end

--- Returns the element name
---@return string 
function Screen.getName() end

--- Returns the class of the Element
---@return string 
function Screen.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Screen.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Screen.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Screen.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Screen.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Screen.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Screen.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Screen.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Screen.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Screen.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Screen.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Screen.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Screen.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Screen.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Screen.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Screen.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Screen.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Screen.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Screen.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Screen.getWorldForward() end

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
---@return integer value The plug signal state
function Screen.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Screen.getSignalOut(plug) end

--- Switch on the screen
function Screen.activate() end

--- Switch off the screen
function Screen.deactivate() end

--- Checks if the screen is on
---@return integer 1 if the screen is on
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
---@return integer 
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
---@return string value The contents of the last render script setOutput call, or an empty string
function Screen.getScriptOutput() end

--- Displays the given HTML content at the given coordinates in the screen, and returns an ID to move it later
---@param x number Horizontal position, as a percentage (between 0 and 100) of the screen width
---@param y number Vertical position, as a percentage (between 0 and 100) of the screen height
---@param html string The HTML content to display, which can contain SVG html elements to make drawings
---@return integer 
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
---@return number x The x-position as a percentage (between 0 and 1) of screen width; -1 if nothing is point at
function Screen.getMouseX() end

--- Returns the y-coordinate of the position point at in the screen
---@return number y The y-position as a percentage (between 0 and 1) of screen height; -1 if nothing is point at
function Screen.getMouseY() end

--- Returns the state of the mouse click
---@return integer 1 if the mouse is pressed, otherwise 0
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


---@class SpaceBrake
SpaceBrake = {}
--- Show the element widget in the in-game widget stack
function SpaceBrake.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function SpaceBrake.show() end

--- Hide the element widget in the in-game widget stack
function SpaceBrake.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function SpaceBrake.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function SpaceBrake.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function SpaceBrake.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function SpaceBrake.getData() end

--- Returns the element data ID
---@return string 
function SpaceBrake.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function SpaceBrake.getDataId() end

--- Returns the element name
---@return string 
function SpaceBrake.getName() end

--- Returns the class of the Element
---@return string 
function SpaceBrake.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function SpaceBrake.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function SpaceBrake.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function SpaceBrake.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function SpaceBrake.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function SpaceBrake.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function SpaceBrake.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function SpaceBrake.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function SpaceBrake.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function SpaceBrake.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function SpaceBrake.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function SpaceBrake.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function SpaceBrake.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function SpaceBrake.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function SpaceBrake.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function SpaceBrake.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function SpaceBrake.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function SpaceBrake.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function SpaceBrake.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function SpaceBrake.getWorldForward() end

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
---@return integer value The plug signal state
function SpaceBrake.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function SpaceBrake.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function SpaceBrake.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function SpaceBrake.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function SpaceBrake.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function SpaceBrake.isIgnoringTags() end

--- Start the brake at full power (works only when run inside a cockpit or under remote control)
function SpaceBrake.activate() end

--- Stops the brake (works only when run inside a cockpit or under remote control)
function SpaceBrake.deactivate() end

--- Checks if the brake is active
---@return integer 
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
SpaceEngine = {}
--- Show the element widget in the in-game widget stack
function SpaceEngine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function SpaceEngine.show() end

--- Hide the element widget in the in-game widget stack
function SpaceEngine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function SpaceEngine.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function SpaceEngine.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function SpaceEngine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function SpaceEngine.getData() end

--- Returns the element data ID
---@return string 
function SpaceEngine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function SpaceEngine.getDataId() end

--- Returns the element name
---@return string 
function SpaceEngine.getName() end

--- Returns the class of the Element
---@return string 
function SpaceEngine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function SpaceEngine.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function SpaceEngine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function SpaceEngine.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function SpaceEngine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function SpaceEngine.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function SpaceEngine.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function SpaceEngine.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function SpaceEngine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function SpaceEngine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function SpaceEngine.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function SpaceEngine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function SpaceEngine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function SpaceEngine.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function SpaceEngine.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function SpaceEngine.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function SpaceEngine.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function SpaceEngine.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function SpaceEngine.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function SpaceEngine.getWorldForward() end

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
---@return integer value The plug signal state
function SpaceEngine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function SpaceEngine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function SpaceEngine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function SpaceEngine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function SpaceEngine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function SpaceEngine.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function SpaceEngine.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function SpaceEngine.deactivate() end

--- Checks if the engine is active
---@return integer 
function SpaceEngine.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function SpaceEngine.getState() end

--- Toggle the state of the engine
function SpaceEngine.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function SpaceEngine.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number 
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
---@return number 
function SpaceEngine.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function SpaceEngine.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number 
function SpaceEngine.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function SpaceEngine.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return integer 
function SpaceEngine.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function SpaceEngine.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table 
function SpaceEngine.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table 
function SpaceEngine.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table 
function SpaceEngine.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function SpaceEngine.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table 
function SpaceEngine.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function SpaceEngine.torqueAxis() end

--- Checks if the engine out of fuel
---@return integer 
function SpaceEngine.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer 
function SpaceEngine.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer 
function SpaceEngine.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return integer 
function SpaceEngine.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function SpaceEngine.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number 
function SpaceEngine.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number 
function SpaceEngine.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number 
function SpaceEngine.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number 
function SpaceEngine.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function SpaceEngine.getT50() end

---@deprecated SpaceEngine.getDistance() is deprecated.
function SpaceEngine.getDistance() end


---@class SpaceMiningUnit
SpaceMiningUnit = {}
--- Show the element widget in the in-game widget stack
function SpaceMiningUnit.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function SpaceMiningUnit.show() end

--- Hide the element widget in the in-game widget stack
function SpaceMiningUnit.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function SpaceMiningUnit.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function SpaceMiningUnit.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function SpaceMiningUnit.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function SpaceMiningUnit.getData() end

--- Returns the element data ID
---@return string 
function SpaceMiningUnit.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function SpaceMiningUnit.getDataId() end

--- Returns the element name
---@return string 
function SpaceMiningUnit.getName() end

--- Returns the class of the Element
---@return string 
function SpaceMiningUnit.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function SpaceMiningUnit.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function SpaceMiningUnit.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function SpaceMiningUnit.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function SpaceMiningUnit.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function SpaceMiningUnit.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function SpaceMiningUnit.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function SpaceMiningUnit.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function SpaceMiningUnit.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function SpaceMiningUnit.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function SpaceMiningUnit.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function SpaceMiningUnit.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function SpaceMiningUnit.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function SpaceMiningUnit.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function SpaceMiningUnit.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function SpaceMiningUnit.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function SpaceMiningUnit.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function SpaceMiningUnit.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function SpaceMiningUnit.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function SpaceMiningUnit.getWorldForward() end

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
---@return integer value The plug signal state
function SpaceMiningUnit.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function SpaceMiningUnit.getSignalOut(plug) end

--- Returns the current state of the space mining unit
---@return integer state The status of the space mining unit can be (Stopped = 1, Running = 2, Jammed output full = 3, Jammed no output container = 4)
function SpaceMiningUnit.getState() end

---@deprecated MiningUnit.getStatus() is deprecated, use MiningUnit.getState() instead.
function SpaceMiningUnit.getStatus() end

--- Returns the remaining time of the current batch extraction process.
---@return number 
function SpaceMiningUnit.getRemainingTime() end

--- Returns the item ID of the currently selected ore.
---@return integer 
function SpaceMiningUnit.getActiveOre() end

--- Returns the list of available ore pools
---@return table pool A list of tables composed with {[int] oreId, [float] available, [float] maximum);
function SpaceMiningUnit.getOrePools() end

--- Returns the base production rate of the space mining unit.
---@return number 
function SpaceMiningUnit.getBaseRate() end

--- Returns the efficiency rate of the space mining unit.
---@return number 
function SpaceMiningUnit.getEfficiency() end

--- Returns the calibration rate of the space mining unit.
---@return number 
function SpaceMiningUnit.getCalibrationRate() end

--- Returns the optimal calibration rate of the space mining unit.
---@return number 
function SpaceMiningUnit.getOptimalRate() end

--- Returns the current production rate of the space mining unit.
---@return number 
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
SurfaceEngine = {}
--- Show the element widget in the in-game widget stack
function SurfaceEngine.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function SurfaceEngine.show() end

--- Hide the element widget in the in-game widget stack
function SurfaceEngine.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function SurfaceEngine.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function SurfaceEngine.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function SurfaceEngine.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function SurfaceEngine.getData() end

--- Returns the element data ID
---@return string 
function SurfaceEngine.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function SurfaceEngine.getDataId() end

--- Returns the element name
---@return string 
function SurfaceEngine.getName() end

--- Returns the class of the Element
---@return string 
function SurfaceEngine.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function SurfaceEngine.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function SurfaceEngine.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function SurfaceEngine.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function SurfaceEngine.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function SurfaceEngine.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function SurfaceEngine.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function SurfaceEngine.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function SurfaceEngine.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function SurfaceEngine.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function SurfaceEngine.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function SurfaceEngine.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function SurfaceEngine.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function SurfaceEngine.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function SurfaceEngine.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function SurfaceEngine.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function SurfaceEngine.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function SurfaceEngine.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function SurfaceEngine.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function SurfaceEngine.getWorldForward() end

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
---@return integer value The plug signal state
function SurfaceEngine.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function SurfaceEngine.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function SurfaceEngine.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function SurfaceEngine.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function SurfaceEngine.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function SurfaceEngine.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function SurfaceEngine.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function SurfaceEngine.deactivate() end

--- Checks if the engine is active
---@return integer 
function SurfaceEngine.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function SurfaceEngine.getState() end

--- Toggle the state of the engine
function SurfaceEngine.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function SurfaceEngine.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number 
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
---@return number 
function SurfaceEngine.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function SurfaceEngine.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number 
function SurfaceEngine.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function SurfaceEngine.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return integer 
function SurfaceEngine.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function SurfaceEngine.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table 
function SurfaceEngine.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table 
function SurfaceEngine.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table 
function SurfaceEngine.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function SurfaceEngine.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table 
function SurfaceEngine.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function SurfaceEngine.torqueAxis() end

--- Checks if the engine out of fuel
---@return integer 
function SurfaceEngine.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer 
function SurfaceEngine.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer 
function SurfaceEngine.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return integer 
function SurfaceEngine.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function SurfaceEngine.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number 
function SurfaceEngine.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number 
function SurfaceEngine.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number 
function SurfaceEngine.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number 
function SurfaceEngine.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function SurfaceEngine.getT50() end

--- Returns the distance to the first object detected in the direction of the thrust
---@return number 
function SurfaceEngine.getDistance() end

--- Returns the maximum functional distance from the ground
---@return number 
function SurfaceEngine.getMaxDistance() end


---@class System
System = {}
--- Return the currently key bound to the given action. Useful to display tips.
---@param actionName string The action name, represented as a string taken among the set of predefined Lua-available actions (you can check the drop down list to see what is available)
---@return string value The key associated to the given action name
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
---@return string value The panel ID, or "" on failure
function System.createWidgetPanel(label) end

--- Destroy the panel.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param panelId string The panel ID
---@return integer value 1 on success, 0 on failure.
function System.destroyWidgetPanel(panelId) end

--- Create an empty widget and add it to a panel.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param panelId string The panel ID
---@param type string Widget type, determining how it will display data attached to ID
---@return string value The widget ID, or "" on failure.
function System.createWidget(panelId, type) end

--- Destroy the widget.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param widgetId string The widget ID
---@return integer value 1 on success, 0 on failure.
function System.destroyWidget(widgetId) end

--- Create data.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataJson string The data fields as JSON
---@return string value The data ID, or "" on failure.
function System.createData(dataJson) end

--- Destroy the data.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataId string The data ID
---@return integer value 1 on success, 0 on failure.
function System.destroyData(dataId) end

--- Update JSON associated to data.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataId string The data ID
---@param dataJson string The data fields as JSON
---@return integer value 1 on success, 0 on failure.
function System.updateData(dataId, dataJson) end

--- Add data to widget.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataId string The data ID
---@param widgetId string The widget ID
---@return integer value 1 on success, 0 on failure.
function System.addDataToWidget(dataId, widgetId) end

--- Remove data from widget.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param dataId string The data ID
---@param widgetId string The widget ID
---@return integer value 1 on success, 0 on failure.
function System.removeDataFromWidget(dataId, widgetId) end

--- Return the current value of the mouse wheel
---@return number value The current value of the mouse wheel
function System.getMouseWheel() end

--- Return the current value of the mouse delta X
---@return number value The current value of the mouse delta X
function System.getMouseDeltaX() end

--- Return the current value of the mouse delta Y
---@return number value The current value of the mouse delta Y
function System.getMouseDeltaY() end

--- Return the current value of the mouse pos X
---@return number value The current value of the mouse pos X
function System.getMousePosX() end

--- Return the current value of the mouse pos Y
---@return number value The current value of the mouse pos Y
function System.getMousePosY() end

--- Return the value of mouse sensitivity game setting
---@return number value Sensitivity setting value
function System.getMouseSensitivity() end

--- Return the current value of the screen height
---@return integer value The current value of the screen height
function System.getScreenHeight() end

--- Return the current value of the screen width
---@return integer value The current value of the screen width
function System.getScreenWidth() end

--- Return the current value of the player's horizontal field of view
---@return number value The current value of the player's horizontal field of view
function System.getCameraHorizontalFov() end

---@deprecated System.getFov() is deprecated, use System.getCameraHorizontalFov().
function System.getFov() end

--- Return the current value of the player's vertical field of view
---@return number value The current value of the player's vertical field of view
function System.getCameraVerticalFov() end

--- Returns the active camera mode.
---@return integer mode 1: First Person View, 2: Look Around Construct View, 3: Follow Construct View
function System.getCameraMode() end

--- Checks if the active camera is in first person view.
---@return integer value 1 if the camera is in first person view.
function System.isFirstPerson() end

--- Returns the position of the camera, in construct local coordinates.
---@return table value Camera position in construct local coordinates.
function System.getCameraPos() end

--- Returns the position of the camera, in world coordinates.
---@return table value Camera position in world coordinates.
function System.getCameraWorldPos() end

--- Returns the forward direction vector of the active camera, in world coordinates.
---@return table value Camera forward direction vector in world coordinates.
function System.getCameraWorldForward() end

--- Returns the right direction vector of the active camera, in world coordinates.
---@return table value Camera right direction vector in world coordinates.
function System.getCameraWorldRight() end

--- Returns the up direction vector of the active camera, in world coordinates.
---@return table value Camera up direction vector in world coordinates.
function System.getCameraWorldUp() end

--- Returns the forward direction vector of the active camera, in construct local coordinates.
---@return table value Camera forward direction vector in construct local coordinates.
function System.getCameraForward() end

--- Returns the right direction vector of the active camera, in construct local coordinates.
---@return table value Camera right direction vector in construct local coordinates.
function System.getCameraRight() end

--- Returns the up direction vector of the active camera, in construct local coordinates.
---@return table value Camera up direction vector in construct local coordinates.
function System.getCameraUp() end

--- Return the current value of the mouse wheel (for the throttle speedUp/speedDown action)
--- This value will go through the control scheme, devices and sensitivity
---@return number value The current input
function System.getThrottleInputFromMouseWheel() end

--- Return the mouse input for the ship control action (forward/backward)
--- This value will go through the control scheme to know on which input the mouse is mapped and its current sensitivity
---@return number value The current input
function System.getControlDeviceForwardInput() end

--- Return the mouse input for the ship control action  (yaw right/left)
--- This value will go through the control scheme to know on which input the mouse is mapped and its current sensitivity
---@return number value The current input
function System.getControlDeviceYawInput() end

--- Return the mouse input for the ship control action  (right/left)
--- This value will go through the control scheme to know on which input the mouse is mapped and its current sensitivity
---@return number value The current value of the mouse delta Y
function System.getControlDeviceLeftRightInput() end

--- Lock or unlock the mouse free look.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param state boolean true to lock and false to unlock
function System.lockView(state) end

--- Return the lock state of the mouse free look
---@return integer value 1 when locked and 0 when unlocked
function System.isViewLocked() end

---@deprecated System.freeze() is deprecated, use Player.freeze().
function System.freeze() end

---@deprecated System.isFrozen() is deprecated, use Player.isFrozen().
function System.isFrozen() end

--- Return the current time since the arrival of the Arkship on September 30th, 2017
---@return number value Time in seconds
function System.getArkTime() end

---@deprecated System.getTime() is deprecated, use System.getArkTime().
function System.getTime() end

--- Return the current time since January 1st, 1970.
---@return number value Time in seconds
function System.getUtcTime() end

--- Return the time offset between local timezone and UTC
---@return number value Time in seconds
function System.getUtcOffset() end

--- Return the locale in which the game is currently running
---@return string value The locale, currently one of "en-US", "fr-FR", or "de-DE"
function System.getLocale() end

--- Return delta time of action updates (to use in ActionLoop)
---@return number value The delta time in seconds
function System.getActionUpdateDeltaTime() end

--- Return the name of the given player, if in range of visibility or broadcasted by a transponder
---@param id integer The ID of the player
---@return string value The name of the player
function System.getPlayerName(id) end

--- Return the world position of the given player, if in range of visibility
---@param id integer The ID of the player
---@return table value The coordinates of the player in world coordinates
function System.getPlayerWorldPos(id) end

--- Return the item table corresponding to the given item ID.
---@param id integer The ID of the item
---@return table value An item table with fields: {[int] id, [string] name, [string] displayName, [string] locDisplayName, [string] displayNameWithSize, [string] locDisplayNameWithSize, [string] description, [string] locDescription, [string] type, [number] unitMass, [number] unitVolume, [integer] tier, [string] scale, [string] iconPath, [table] schematics, [table] products}
function System.getItem(id) end

--- Returns a list of recipes producing the given item from its id.
---@param itemId integer The ID of the item
---@return table value A list of recipe table with field: {[int] id, [int] tier,[double] time, [bool] nanocraftable, [table] products:{{[int] id, [double] quantity},...}, [table] ingredients:{{[int] id, [double] quantity},...}}
function System.getRecipes(itemId) end

---@deprecated System.getSchematic(id) is deprecated, use System.getRecipes(itemId).tag.
function System.getSchematic() end

--- Returns the corresping organization to the given organization id, if known, e.g. broadcasted by a transponder
---@param id integer The ID of the organization
---@return table value A table containing information about the given organization {[string] name, [string] tag}
function System.getOrganization(id) end

---@deprecated System.getOrganizationName() is deprecated, use System.getOrganization(id).name .
function System.getOrganizationName() end

---@deprecated System.getOrganizationTag() is deprecated, use System.getOrganization(id).tag .
function System.getOrganizationTag() end

--- Return the player's world position as a waypoint string, starting with '::pos' (only in explicit runs)
---@return string value The waypoint as a string
function System.getWaypointFromPlayerPos() end

--- Set a waypoint at the destination described by the waypoint string, of the form '::pos{...}' (only in explicit runs)
---@param waypointStr string The waypoint as a string
---@param notify boolean (Optional) True to display a notification on waypoint change
function System.setWaypoint(waypointStr, notify) end

--- Clear the active destination waypoint. (only in explicit runs)'
---@param notify boolean (Optional) True to display a notification about the waypoint's clearing
function System.clearWaypoint(notify) end

--- Set the visibility of the helper top menu.
--- Note that this function is disabled if the player is not running the script explicitly (pressing F on the Control Unit, vs. via a plug signal).
---@param show boolean True to show the top helper menu, false to hide the top helper menu
function System.showHelper(show) end

--- Play a sound file from your audio folder (located in "My documents/NQ/DualUniverse/audio"). Only one sound can be played at a time.
---@param filePath string Relative path to audio folder (.mp3, .wav)
function System.playSound(filePath) end

--- Checks if a sound is playing
---@return integer value 1 if a sound is playing
function System.isPlayingSound() end

--- Stop the current playing sound
function System.stopSound() end

--- Print the given string in the Lua chat channel
---@param msg string 
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
Telemeter = {}
--- Show the element widget in the in-game widget stack
function Telemeter.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Telemeter.show() end

--- Hide the element widget in the in-game widget stack
function Telemeter.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Telemeter.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Telemeter.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Telemeter.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Telemeter.getData() end

--- Returns the element data ID
---@return string 
function Telemeter.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Telemeter.getDataId() end

--- Returns the element name
---@return string 
function Telemeter.getName() end

--- Returns the class of the Element
---@return string 
function Telemeter.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Telemeter.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Telemeter.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Telemeter.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Telemeter.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Telemeter.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Telemeter.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Telemeter.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Telemeter.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Telemeter.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Telemeter.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Telemeter.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Telemeter.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Telemeter.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Telemeter.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Telemeter.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Telemeter.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Telemeter.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Telemeter.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Telemeter.getWorldForward() end

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
---@return integer value The plug signal state
function Telemeter.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Telemeter.getSignalOut(plug) end

---@deprecated Telemeter.getDistance() is deprecated, use Telemeter.raycast().distance instead.
function Telemeter.getDistance() end

--- Emits a raycast from the telemeter, returns a raycastHit object
---@return table hit A table with fields : {[bool] hit, [float] distance, [vec3] point}
function Telemeter.raycast() end

--- Returns telemeter raycast origin in local construct coordinates
---@return table 
function Telemeter.getRayOrigin() end

--- Returns telemeter raycast origin in world coordinates
---@return table 
function Telemeter.getRayWorldOrigin() end

--- Returns telemeter raycast axis in local construct coordinates
---@return table 
function Telemeter.getRayAxis() end

--- Returns telemeter raycast axis in world coordinates
---@return table 
function Telemeter.getRayWorldAxis() end

--- Returns the max distance from which an obstacle can be detected (default is 100m)
---@return number 
function Telemeter.getMaxDistance() end


---@class Transponder
Transponder = {}
--- Show the element widget in the in-game widget stack
function Transponder.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Transponder.show() end

--- Hide the element widget in the in-game widget stack
function Transponder.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Transponder.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Transponder.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Transponder.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Transponder.getData() end

--- Returns the element data ID
---@return string 
function Transponder.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Transponder.getDataId() end

--- Returns the element name
---@return string 
function Transponder.getName() end

--- Returns the class of the Element
---@return string 
function Transponder.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Transponder.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Transponder.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Transponder.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Transponder.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Transponder.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Transponder.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Transponder.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Transponder.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Transponder.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Transponder.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Transponder.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Transponder.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Transponder.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Transponder.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Transponder.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Transponder.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Transponder.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Transponder.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Transponder.getWorldForward() end

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
---@return integer value The plug signal state
function Transponder.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Transponder.getSignalOut(plug) end

--- Activate the transponder
function Transponder.activate() end

--- Deactivate the transponder
function Transponder.deactivate() end

--- Toggle the state of the transponder
function Transponder.toggle() end

--- Checks if the transponder is active
---@return integer 
function Transponder.isActive() end

---@deprecated Transponder.getState() is deprecated, use Transponder.isActive().
function Transponder.getState() end

--- Set the tags list with up to 8 entries. Returns 1 if the application was successful, 0 if the tag
--- format is invalid.
---@param tags table List of up to 8 transponder tag strings
---@return integer 
function Transponder.setTags(tags) end

--- Returns the tag list
---@return table tags List of up to 8 transponder tag strings
function Transponder.getTags() end

--- Emitted when the transponder is started or stopped
---@param active integer 1 if the element was activated, 0 otherwise
---@type Event
Transponder.onToggled = Event:new()

---@type Event
Transponder.toggled = Event:new()


---@class VerticalBooster
VerticalBooster = {}
--- Show the element widget in the in-game widget stack
function VerticalBooster.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function VerticalBooster.show() end

--- Hide the element widget in the in-game widget stack
function VerticalBooster.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function VerticalBooster.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function VerticalBooster.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function VerticalBooster.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function VerticalBooster.getData() end

--- Returns the element data ID
---@return string 
function VerticalBooster.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function VerticalBooster.getDataId() end

--- Returns the element name
---@return string 
function VerticalBooster.getName() end

--- Returns the class of the Element
---@return string 
function VerticalBooster.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function VerticalBooster.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function VerticalBooster.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function VerticalBooster.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function VerticalBooster.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function VerticalBooster.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function VerticalBooster.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function VerticalBooster.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function VerticalBooster.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function VerticalBooster.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function VerticalBooster.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function VerticalBooster.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function VerticalBooster.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function VerticalBooster.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function VerticalBooster.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function VerticalBooster.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function VerticalBooster.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function VerticalBooster.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function VerticalBooster.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function VerticalBooster.getWorldForward() end

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
---@return integer value The plug signal state
function VerticalBooster.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function VerticalBooster.getSignalOut(plug) end

--- Returns the obstruction ratio of the engine exhaust by Elements and Voxels.
--- The more obstructed the engine is, the less properly it will work. Try to fix your design if this is the case
---@return number 
function VerticalBooster.getObstructionFactor() end

--- Returns the tags of the engine
---@return string 
function VerticalBooster.getTags() end

--- Set the tags of the engine
---@param tags string The CSV string of the tags
---@param ignore boolean: True to ignore the default engine tags
function VerticalBooster.setTags(tags, ignore) end

--- Checks if the engine is ignoring default tags
---@return integer 1 if the engine ignores default engine tags
function VerticalBooster.isIgnoringTags() end

--- Start the engine at full power (works only when run inside a cockpit or under remote control)
function VerticalBooster.activate() end

--- Stops the engine (works only when run inside a cockpit or under remote control)
function VerticalBooster.deactivate() end

--- Checks if the engine is active
---@return integer 
function VerticalBooster.isActive() end

---@deprecated FueledEngine.getState() is deprecated, use FueledEngine.isActive().
function VerticalBooster.getState() end

--- Toggle the state of the engine
function VerticalBooster.toggle() end

--- Set the thrust of the engine
---@param thrust number The engine thrust in newtons (limited by the maximum thrust)
function VerticalBooster.setThrust(thrust) end

--- Returns the current thrust of the engine
---@return number 
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
---@return number 
function VerticalBooster.getCurrentMinThrust() end

---@deprecated FueledEngine.getMinThrust() is deprecated, use FueledEngine.getCurrentMinThrust().
function VerticalBooster.getMinThrust() end

--- Returns the maximal thrust the engine can deliver at the moment, which might depend on
--- various conditions like atmospheric density, obstruction, orientation, etc. The actual thrust will be
--- anything below this maxThrust, which defines the current max capability of the engine
---@return number 
function VerticalBooster.getCurrentMaxThrust() end

--- Returns the ratio between the current maximum thrust and the optimal maximum thrust
---@return number 
function VerticalBooster.getMaxThrustEfficiency() end

--- Checks if the torque generation is enabled on the engine
---@return integer 
function VerticalBooster.isTorqueEnabled() end

--- Sets the torque generation state on the engine
---@param state boolean 
function VerticalBooster.enableTorque(state) end

--- Returns the engine thrust direction in construct local coordinates
---@return table 
function VerticalBooster.getThrustAxis() end

--- Returns the engine torque axis in construct local coordinates
---@return table 
function VerticalBooster.getTorqueAxis() end

--- Returns the engine exhaust thrust direction in world coordinates
---@return table 
function VerticalBooster.getWorldThrustAxis() end

---@deprecated FueledEngine.thrustAxis() is deprecated, use FueledEngine.getWorldThrustAxis().
function VerticalBooster.thrustAxis() end

--- Returns the engine torque axis in world coordinates
---@return table 
function VerticalBooster.getWorldTorqueAxis() end

---@deprecated FueledEngine.torqueAxis() is deprecated, use FueledEngine.getWorldTorqueAxis().
function VerticalBooster.torqueAxis() end

--- Checks if the engine out of fuel
---@return integer 
function VerticalBooster.isOutOfFuel() end

--- Returns the item ID of the fuel currently used by the engine
---@return integer 
function VerticalBooster.getFuelId() end

--- Returns the local ID of the fueltank linked to the engine
---@return integer 
function VerticalBooster.getFuelTankId() end

--- Checks if the engine linked to a functional Fuel Tank (not broken or colliding)?
---@return integer 
function VerticalBooster.hasFunctionalFuelTank() end

---@deprecated FueledEngine.hasBrokenFuelTank() is deprecated, use FueledEngine.hasFunctionalFuelTank().
function VerticalBooster.hasBrokenFuelTank() end

--- Returns the engine fuel consumption rate per newton of thrust delivered per second
---@return number 
function VerticalBooster.getCurrentFuelRate() end

--- Returns the ratio between the current fuel rate and the theoretical nominal fuel rate
---@return number 
function VerticalBooster.getFuelRateEfficiency() end

--- Returns the current fuel consumption rate
---@return number 
function VerticalBooster.getFuelConsumption() end

--- Returns the T50; the time needed for the engine to reach 50% of its maximal thrust (all engines
--- do not instantly reach the thrust that is set for them, but they can take time to "warm up" to
--- the final value)
---@return number 
function VerticalBooster.getWarmupTime() end

---@deprecated FueledEngine.getT50() is deprecated, use FueledEngine.getWarmupTime().
function VerticalBooster.getT50() end

--- Returns the distance to the first object detected in the direction of the thrust
---@return number 
function VerticalBooster.getDistance() end

--- Returns the maximum functional distance from the ground
---@return number 
function VerticalBooster.getMaxDistance() end


---@class WarpDrive
WarpDrive = {}
--- Show the element widget in the in-game widget stack
function WarpDrive.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function WarpDrive.show() end

--- Hide the element widget in the in-game widget stack
function WarpDrive.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function WarpDrive.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function WarpDrive.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function WarpDrive.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function WarpDrive.getData() end

--- Returns the element data ID
---@return string 
function WarpDrive.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function WarpDrive.getDataId() end

--- Returns the element name
---@return string 
function WarpDrive.getName() end

--- Returns the class of the Element
---@return string 
function WarpDrive.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function WarpDrive.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function WarpDrive.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function WarpDrive.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function WarpDrive.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function WarpDrive.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function WarpDrive.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function WarpDrive.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function WarpDrive.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function WarpDrive.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function WarpDrive.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function WarpDrive.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function WarpDrive.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function WarpDrive.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function WarpDrive.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function WarpDrive.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function WarpDrive.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function WarpDrive.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function WarpDrive.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function WarpDrive.getWorldForward() end

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
---@return integer value The plug signal state
function WarpDrive.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function WarpDrive.getSignalOut(plug) end

--- Initiate the warp jump process
function WarpDrive.initiate() end

--- Returns the current status of the warp drive
---@return integer status The current status of the warp drive (NoWarpDrive = 1, Broken = 2, Warping = 3, ParentWarping = 4, NotAnchored = 5, WarpCooldown = 6, PvPCooldown = 7, MovingChild = 8, NoContainer = 9, PlanetTooClose = 10, DestinationNotSet = 11, DestinationTooClose = 12, DestinationTooFar = 13, NotEnoughWarpCells = 14, Ready = 15)
function WarpDrive.getStatus() end

--- Returns the distance to the current warp destination
---@return number 
function WarpDrive.getDistance() end

--- Returns the construct ID of the current warp destination
---@return integer 
function WarpDrive.getDestination() end

--- Returns the name of the current warp destination construct
---@return string 
function WarpDrive.getDestinationName() end

--- Returns the local id of the container linked to the warp drive
---@return integer 
function WarpDrive.getContainerId() end

--- Returns the quantity of warp cells available in the linked container
---@return integer 
function WarpDrive.getAvailableWarpCells() end

--- Returns the quantity of warp cells required to warp to the warp destination set
---@return integer 
function WarpDrive.getRequiredWarpCells() end


---@class Weapon
Weapon = {}
--- Show the element widget in the in-game widget stack
function Weapon.showWidget() end

---@deprecated Element.show() is deprecated, use Element.showWidget() instead.
function Weapon.show() end

--- Hide the element widget in the in-game widget stack
function Weapon.hideWidget() end

---@deprecated Element.hide() is deprecated, use Element.hideWidget() instead.
function Weapon.hide() end

--- Returns the widget type compatible with the element data
---@return string 
function Weapon.getWidgetType() end

--- Returns the element data as JSON
---@return string 
function Weapon.getWidgetData() end

---@deprecated Element.getData() is deprecated, use Element.getWidgetData() instead.
function Weapon.getData() end

--- Returns the element data ID
---@return string 
function Weapon.getWidgetDataId() end

---@deprecated Element.getDataId() is deprecated, use Element.getWidgetDataId() instead.
function Weapon.getDataId() end

--- Returns the element name
---@return string 
function Weapon.getName() end

--- Returns the class of the Element
---@return string 
function Weapon.getClass() end

---@deprecated Element.getElementClass() is deprecated, use Element.getClass() instead.
function Weapon.getElementClass() end

--- Returns the mass of the element (includes the included items' mass when the Element is a Container)
---@return number 
function Weapon.getMass() end

--- Returns the element item ID (to be used with system.getItem() function to get information about the element).
---@return integer 
function Weapon.getItemId() end

--- Returns the unique local ID of the element
---@return integer 
function Weapon.getLocalId() end

---@deprecated Element.getId() is deprecated, use Element.getLocalId() instead.
function Weapon.getId() end

--- Returns the element integrity between 0 and 100
---@return number 
function Weapon.getIntegrity() end

--- Returns the element's current hit points (0 = destroyed)
---@return number 
function Weapon.getHitPoints() end

--- Returns the element's maximal hit points
---@return number 
function Weapon.getMaxHitPoints() end

--- Returns the element's remaining number of restorations
---@return integer 
function Weapon.getRemainingRestorations() end

--- Returns the element's maximal number of restorations
---@return integer 
function Weapon.getMaxRestorations() end

--- Returns the position of the Element in construct local coordinates.
---@return table 
function Weapon.getPosition() end

--- Returns the bounding box dimensions of the element.
---@return table 
function Weapon.getBoundingBoxSize() end

--- Returns the position of the center of bounding box of the element in local construct coordinates.
---@return table 
function Weapon.getBoundingBoxCenter() end

--- Returns the up direction vector of the Element in construct local coordinates
---@return table 
function Weapon.getUp() end

--- Returns the right direction vector of the Element in construct local coordinates
---@return table 
function Weapon.getRight() end

--- Returns the forward direction vector of the Element in construct local coordinates
---@return table 
function Weapon.getForward() end

--- Returns the up direction vector of the Element in world coordinates
---@return table 
function Weapon.getWorldUp() end

--- Returns the right direction vector of the Element in world coordinates
---@return table 
function Weapon.getWorldRight() end

--- Returns the forward direction vector of the Element in world coordinates
---@return table 
function Weapon.getWorldForward() end

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
---@return integer value The plug signal state
function Weapon.getSignalIn(plug) end

--- Returns the value of a signal in the specified OUT plug of the Element.
--- Standard plug names are built with the following syntax: direction-type-index. 'Direction' can be IN or OUT.
--- 'type' is one of the following: ITEM, FUEL, ELECTRICITY, SIGNAL, HEAT, FLUID, CONTROL, and 'index' is a number between 0 and
--- the total number of plugs of the given type in the given direction. Some plugs have special names like 'on' or 'off' for the
--- Manual Switch Unit. Just check in-game for the plug names if you have a doubt.
---@param plug string The plug name, in the form of IN-SIGNAL-index
---@return integer value The plug signal state
function Weapon.getSignalOut(plug) end

--- Returns the item id of the currently equipped ammo
---@return integer 
function Weapon.getAmmo() end

--- Returns the current amount of remaining ammunition
---@return integer 
function Weapon.getAmmoCount() end

--- Returns the maximum amount of ammunition the weapon can carry
---@return integer 
function Weapon.getMaxAmmo() end

--- Checks if the weapon is out of ammo
---@return integer 
function Weapon.isOutOfAmmo() end

--- Returns 1 if the weapon is not broken and compatible with the construct size
---@return integer state 1 if the weapon is operational, otherwise 0 = broken, -1 = incompatible size
function Weapon.getOperationalState() end

---@deprecated Weapon.isOperational() is deprecated, use Weapon.getOperationalState() instead.
function Weapon.isOperational() end

--- Returns the current weapon status
---@return integer status The current status of the weapon (Idle = 1, Firing = 2, Reloading = 3, Unloading = 4)
function Weapon.getStatus() end

--- Returns the local id of the container linked to the weapon
---@return integer 
function Weapon.getContainerId() end

--- Returns the current hit probability of the weapon for the current target
---@return number 
function Weapon.getHitProbability() end

--- Returns the base weapon damage
---@return number 
function Weapon.getBaseDamage() end

--- Returns the optimal aim cone
---@return number 
function Weapon.getOptimalAimingCone() end

--- Returns the optimal distance to target
---@return number 
function Weapon.getOptimalDistance() end

--- Returns the maximum distance to target
---@return number 
function Weapon.getMaxDistance() end

--- Returns the optimal tracking rate
---@return number 
function Weapon.getOptimalTracking() end

--- Returns the magazine volume
---@return number 
function Weapon.getMagazineVolume() end

--- Returns the weapon cycle time
---@return number 
function Weapon.getCycleTime() end

--- Returns the weapon reload time
---@return number 
function Weapon.getReloadTime() end

--- Returns the weapon unload time
---@return number 
function Weapon.getUnloadTime() end

--- Returns the id of the current target construct of the weapon
---@return integer 
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


library = Library

system = System

unit = ControlUnit

player = Player

construct = Construct

DULibrary = Library

DUSystem = System

DUPlayer = Player

DUConstruct = Construct