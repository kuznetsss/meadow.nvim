local M = {}

-- Current options
M.current_options = {}

local clamp = require('meadow.utils').clamp

local default_options = {
  color_saturation = 80,
  color_value = 80,
}

-- Merge default and user options
---@param options table
---@return table: merged options
M.merge_with_default = function(user_options)
  M.current_options = vim.tbl_deep_extend('force', default_options, user_options or {})
  -- Check values range
  M.current_options.color_saturation = clamp(M.current_options.color_saturation)
  M.current_options.color_value = clamp(M.current_options.color_value)
  return M.current_options
end

return M
