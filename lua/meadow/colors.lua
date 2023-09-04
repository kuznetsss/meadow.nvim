local M = {}

local hsv_to_rgb_hex = require('meadow.convert_color').hsv_to_rgb_hex

local initial_data = {
  -- Value for each color (for grayscale hue and satureation are 0)
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
    pink = 326,
  },
}

local scale_value = function(value, value_from_options)
  return value * value_from_options / 100
end

M.generate_colors = function(options)
  M.rgb = {
    grayscale = {},
    colors = {},
  }

  for name, value in initial_data.grayscale_values do
    M.rgb.grayscale[name] =
        hsv_to_rgb_hex { 0, 0, scale_value(value, options.color_value) }
  end
  for name, hue in initial_data.grayscale_values do
    M.rgb.colors[name] = hsv_to_rgb_hex {
      hue,
      options.color_saturation,
      scale_value(value, options.color_value),
    }
  end
end

return M
