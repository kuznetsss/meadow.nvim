local M = {}

local color_palette = {
  -- Value for each color (for grayscale hue and saturation are 0)
  grayscale_values = {
    black1 = 3,
    black2 = 14,
    black3 = 19,
    black4 = 22,
    grey_bg1 = 26,
    grey_bg2 = 34,
    grey = 55,
    white = 100,
  },

  -- Hue values of each color
  colors_hues = {
    blue1 = 202,
    blue2 = 195,
    blue3 = 178,
    green1 = 115,
    green2 = 87,
    red1 = 0,
    red2 = 12,
    violet = 280,
    yellow1 = 65,
    yellow2 = 46,
    orange = 35,
  },
}

---Scale value to the same range as value_from_options
---@param value number: value to scale
---@param value_from_options number: value from options
---@return number: scaled value
local scale_value = function(value, value_from_options)
  return value * value_from_options / 100
end

---Make background and foreground colors from hsv values
---@param hue number: hue value
---@param saturation number: saturation value
---@param value number: value value
---@param bg_is_darker boolean: if true, background color will be 2 times darker
---@return table: { fg: string, bg: string } rgb colors
local make_bg_and_fg = function(hue, saturation, value, bg_is_darker)
  local hsv_to_rgb_hex = require('meadow.convert_color').hsv_to_rgb_hex
  return {
    fg = hsv_to_rgb_hex { hue, saturation, value },
    bg = hsv_to_rgb_hex { hue, saturation, bg_is_darker and value / 2 or value},
  }
end

---Return table with rgb colors where each color is a table with fg and bg rgb values
---@param options table: table with color options
---@return table: table with rgb colors
M.generate_colors = function(options)
  M.rgb = {}

  for name, value in pairs(color_palette.grayscale_values) do
    M.rgb[name] = make_bg_and_fg(0, 0, scale_value(value, options.color_value), false)
  end
  for name, hue in pairs(color_palette.colors_hues) do
    M.rgb[name] =
        make_bg_and_fg(hue, options.color_saturation, options.color_value, true)
  end
  return M.rgb
end

return M
