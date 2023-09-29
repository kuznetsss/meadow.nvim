local M = {}

M.setup = function(options)
  options = require('meadow.options').merge_with_default(options)
  local colors = require('meadow.colors').generate_colors(options)
  require('meadow.highlights').apply_colors(colors)
end

return M
