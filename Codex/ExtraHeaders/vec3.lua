--[[ Those are headers for DU's vec3 library ]]

--- A vec3 represents a 3-dimensional vector and includes methods to manipulate it
---@class vec3
vec3 = {
  --- A vector representing the origin point (0, 0, 0) - Only available OUTSIDE instances
  ---@type vec3
  zero = {},

  --- A vector representing the X axis (1, 0, 0) - Only available OUTSIDE instances
  ---@type vec3
  unit_x = {},

  --- A vector representing the Y axis (0, 1, 0) - Only available OUTSIDE instances
  ---@type vec3
  unit_y = {},

  --- A vector representing the Z axis (0, 0, 1) - Only available OUTSIDE instances
  ---@type vec3
  unit_z = {},

  --- The X component of the vector - Only available INSIDE instances
  ---@type number
  x = 0,

  --- The Y component of the vector - Only available INSIDE instances
  ---@type number
  y = 0,

  --- The Z component of the vector - Only available INSIDE instances
  ---@type number
  z = 0,
}

--- Calculates the distance between two points
---@param a vec3 The first point
---@param b vec3 The second point
---@return number
function vec3.dist(a, b) end

--- Calculates the squared distance between two points
---@param a vec3 The first point
---@param b vec3 The second point
---@return number
function vec3.dist2(a, b) end

--- Calculates the dot product of two vectors
---@param a vec3 The first vector to dot with
---@param b vec3 The second vector to dot with
---@return number
function vec3.dot(a, b) end

--- Returns true when a valid vec3 is provided
---@param vector any The value to test against
---@return boolean
function vec3.isvector(vector) end

--- Calculates the linear interpolation between two points
--- https://web.archive.org/web/20220115105703/https://keithmaggio.wordpress.com/2011/02/15/math-magician-lerp-slerp-and-nlerp/
---@param a vec3 The first point
---@param b vec3 The second point
---@param delta number A value between 0 and 1 indicating how much to interpolate towards the second point
---@return vec3
function vec3.lerp(a, b, delta) end

--- Calculates the angle between two different vectors
---@param vector vec3 The second vector we are getting the angle between
---@return number
function vec3:angle_between(vector) end

--- TODO: Write documentation about this method, but only seems to work on 2D vectors (why is this here?)
---@param vector vec3
---@return number
function vec3:angle_to(vector) end

--- Creates a new instance containing the same data
---@return vec3
function vec3:clone() end

--- Crosses the current vector with another vector
---@param vector vec3 The vector to cross with
---@return vec3
function vec3:cross(vector) end

--- Calculates the vector's length
---@return number
function vec3:len() end

--- Calculates the vector's squared length
---@return number
function vec3:len2() end

--- TODO: Write documentation about this method
---@param vector vec3
---@return vec3
function vec3:mirror_on(vector) end

--- Normalizes the vector so that its length is 1 and returns a new copy
---@return vec3
function vec3:normalize() end

--- Normalizes the vector in-place so that its length is 1
---@return vec3
function vec3:normalize_inplace() end

--- TODO: Write documentation about this method
---@param orientation vec3
---@return vec3
function vec3:orientation_to_direction(orientation) end

--- Returns the vector perpendicular to the current
---@return vec3
function vec3:perpendicular() end

--- TODO: Write documentation about this method
---@param vector vec3
---@return vec3
function vec3:project_from(vector) end

--- Projects the current vector into another vector
---@param vector vec3 The vector on which we are projecting the current vector
---@return vec3
function vec3:project_on(vector) end

--- Projects the current vector into a plane
---@param plane_normal vec3 The normal of the plane on which we are projecting the current vector
---@return vec3
function vec3:project_on_plane(plane_normal) end

--- Rotates the vector by an axis
---@param phi number Amount to be rotated, in radians
---@param axis vec3 Axis by which the vector will be rotated
---@return vec3
function vec3:rotate(phi, axis) end

--- Truncates (scales down) the vector if its length is larger than maxLen
--- https://web.archive.org/web/20130512171728/http://blog.signalsondisplay.com/?p=336
---@param maxLen number The maximum length of the vector
---@return vec3
function vec3:trim(vector) end

--- Truncates (scales down) the vector in-place if its length is larger than maxLen
--- https://web.archive.org/web/20130512171728/http://blog.signalsondisplay.com/?p=336
---@param maxLen number The maximum length of the vector
---@return vec3
function vec3:trim_inplace(vector) end

--- Unpacks the vector into its components
---@return number, number, number
function vec3:unpack() end

--- Initializes a new 3D vector with its components in a table
---@param components table A table in the { x, y, z } format
function vec3(components) return setmetatable({}, { _index = vec3 }) end

--- Initializes a new 3D vector with its individual components
---@param x number The value of X component
---@param y number The value of Y component
---@param z number The value of Z component
function vec3(x, y, z) return setmetatable({}, { _index = vec3 }) end