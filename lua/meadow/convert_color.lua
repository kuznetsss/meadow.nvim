local M = {}

local to_int = function(f)
  return math.floor(f + 0.5)
end

-- Hue should be in [0, 360]
-- Saturation and value should be in [0, 100]
---@param hsv table: {1 = hue, 2 = saturation, 3 = value} hsv array of floats
---@return table: {1 = red, 2 = green, 3 = blue} rgb array of integers
M.hsv_to_rgb = function(hsv)
  local hue = hsv[1]
  local saturation = hsv[2] / 100
  local value = hsv[3] * 255 / 100

  local c = value * saturation
  local h = hue / 60
  local x = c * (1 - math.abs(math.fmod(h, 2) - 1))

  local result = { 0, 0, 0 }
  if h >= 0 and h <= 1 then
    result = { c, x, 0 }
  elseif h > 1 and h <= 2 then
    result = { x, c, 0 }
  elseif h > 2 and h <= 3 then
    result = { 0, c, x }
  elseif h > 3 and h <= 4 then
    result = { 0, x, c }
  elseif h > 4 and h <= 5 then
    result = { x, 0, c }
  elseif h > 5 and h <= 6 then
    result = { c, 0, x }
  end
  local m = value - c
  for i = 1, #result do
    result[i] = to_int(result[i] + m)
  end
  return result
end

---Converts rgb array to hex string
---@param table: {1 = red, 2 = green, 3 = blue} rgb array of integers
---@return string: rgb hex value
M.rgb_to_hex = function(rgb)
  local string_to_format = '#'
  for _, v in ipairs(rgb) do
    if v < 16 then
      string_to_format = string_to_format .. '0'
    end
    string_to_format = string_to_format .. '%x'
  end
  return string.format(string_to_format, rgb[1], rgb[2], rgb[3])
end

---Converts hsv array to rgb hex string
---@param hsv table: {1 = hue, 2 = saturation, 3 = value} hsv array of floats
---@return string: rgb hex value
M.hsv_to_rgb_hex = function(hsv)
  local rgb = M.hsv_to_rgb(hsv)
  return M.rgb_to_hex(rgb)
end

return M
