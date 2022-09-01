--[[ Those are headers for DU's vec2 library ]]

--- A vec2 represents a 2-dimensional vector and includes methods to manipulate it
---@class vec2
vec2 = {
  --- A vector representing the origin point (0, 0) - Only available OUTSIDE instances
  ---@type vec2
  zero = {},

  --- A vector representing the X axis (1, 0) - Only available OUTSIDE instances
  ---@type vec2
  unit_x = {},

  --- A vector representing the Y axis (0, 1) - Only available OUTSIDE instances
  ---@type vec2
  unit_y = {},

  --- The X component of the vector - Only available INSIDE instances
  ---@type number
  x = 0,

  --- The Y component of the vector - Only available INSIDE instances
  ---@type number
  y = 0,
}

--- Calculates the distance between two points
---@param a vec2 The first point
---@param b vec2 The second point
---@return number
function vec2.dist(a, b) end

--- Calculates the squared distance between two points
---@param a vec2 The first point
---@param b vec2 The second point
---@return number
function vec2.dist2(a, b) end

--- Calculates the dot product of two vectors
---@param a vec2 The first vector to dot with
---@param b vec2 The second vector to dot with
---@return number
function vec2.dot(a, b) end

--- Returns true when a valid vec3 is provided
---@param vector any The value to test against
---@return boolean
function vec3.isvector(vector) end

--- Calculates the linear interpolation between two points
--- https://web.archive.org/web/20220115105703/https://keithmaggio.wordpress.com/2011/02/15/math-magician-lerp-slerp-and-nlerp/
---@param a vec2 The first point
---@param b vec2 The second point
---@param delta number A value between 0 and 1 indicating how much to interpolate towards the second point
---@return vec2
function vec2.lerp(a, b, delta) end

--- TODO: Write documentation about this method
---@param vector vec2
---@return number
function vec2:angle_to(vector) end

--- Creates a new instance containing the same data
---@return vec2
function vec2:clone() end

--- Crosses the current vector with another vector
---@param vector vec2 The vector to cross with
---@return vec2
function vec2:cross(vector) end

--- Calculates the vector's length
---@return number
function vec2:len() end

--- Calculates the vector's squared length
---@return number
function vec2:len2() end

--- TODO: Write documentation about this method
---@param vector vec2
---@return vec2
function vec2:mirror_on(vector) end

--- Normalizes the vector so that its length is 1 and returns a new copy
---@return vec2
function vec2:normalize() end

--- Normalizes the vector in-place so that its length is 1
---@return vec2
function vec2:normalize_inplace() end

--- Returns the vector perpendicular to the current
---@return vec2
function vec2:perpendicular() end

--- Projects the current vector into another vector
---@param vector vec2 The vector on which we are projecting the current vector
---@return vec2
function vec2:project_on(vector) end

--- Rotates the vector in a certain angle
---@param phi number Amount to be rotated, in radians
---@return vec2
function vec2:rotate(phi) end

--- Rotates the vector in-place in a certain angle
---@param phi number Amount to be rotated, in radians
---@return vec2
function vec2:rotate_inplace(phi) end

--- Truncates (scales down) the vector if its length is larger than maxLen
--- https://web.archive.org/web/20130512171728/http://blog.signalsondisplay.com/?p=336
---@param maxLen number The maximum length of the vector
---@return vec2
function vec2:trim(vector) end

--- Truncates (scales down) the vector in-place if its length is larger than maxLen
--- https://web.archive.org/web/20130512171728/http://blog.signalsondisplay.com/?p=336
---@param maxLen number The maximum length of the vector
---@return vec2
function vec2:trim_inplace(vector) end

--- Unpacks the vector into its components
---@return number, number
function vec2:unpack() end

--- Initializes a new 2D vector with its components in a table
---@param components table A table in the { x, y } format
function vec2(components) return setmetatable({}, { _index = vec2 }) end

--- Initializes a new 2D vector with its individual components
---@param x number The value of X component
---@param y number The value of Y component
function vec2(x, y) return setmetatable({}, { _index = vec2 }) end