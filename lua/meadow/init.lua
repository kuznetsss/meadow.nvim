local M = {}

local options = require 'meadow.options'

local define_commands = function()
  vim.api.nvim_create_user_command('MedowChangeBrightness', function(args)
    local change = tonumber(args.args)
    local new_value = options.current_options.color_value + change
    options.update_options { color_value = new_value }
    print(vim.inspect(options.current_options))
    M.activate()
  end, { nargs = 1 })

  vim.api.nvim_create_user_command('MedowChangeContrast', function(args)
    local change = tonumber(args.args)
    local new_value = options.current_options.color_saturation + change
    options.update_options { color_saturation = new_value }
    print(vim.inspect(options.current_options))
    M.activate()
  end, { nargs = 1 })
end

M.activate = function()
  local colors =
      require('meadow.colors').generate_colors(options.current_options)
  require('meadow.highlights').apply_colors(colors)
end

M.setup = function(user_options)
  options.merge_with_default(user_options)
  define_commands()
end

return M
