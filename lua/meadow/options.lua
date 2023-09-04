local M = {}

local clamp = require('meadow.utils').clamp

local default_options = {
  color_saturation = 80,
  color_value = 80,
}

-- Merge default and user options
---@param options table
---@return table: merged options
M.merge_options = function(options)
  options = vim.tbl_deep_extend('force', default_options, options or {})
  -- Check values range
  options.color_saturation = clamp(options.color_saturation)
  options.color_value = clamp(options.color_value)
  return options
end

return M
