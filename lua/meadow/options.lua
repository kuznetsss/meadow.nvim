local M = {}

-- Current options
M.current_options = {}

local clamp = require('meadow.utils').clamp

local default_options = {
  color_saturation = 80,
  color_value = 80,
}

---Update options with new values
---@param new_values table: new values
M.update_options = function(new_values)
  M.current_options = vim.tbl_deep_extend('force', M.current_options, new_values)
  -- Check values range
  M.current_options.color_saturation = clamp(M.current_options.color_saturation)
  M.current_options.color_value = clamp(M.current_options.color_value)
end

---Merge user options with default options
---@param user_options table | nil: user options
M.merge_with_default = function(user_options)
  M.update_options(default_options)
  M.update_options(user_options or {})
  return M.current_options
end

return M
