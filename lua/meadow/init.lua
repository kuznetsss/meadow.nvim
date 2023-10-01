local M = {}

local options = require('meadow.options')

M.activate = function()
  local colors = require('meadow.colors').generate_colors(options.current_options)
  require('meadow.highlights').apply_colors(colors)
end

M.setup = function(user_options)
  options.merge_with_default(user_options)
  M.activate()
end

return M
