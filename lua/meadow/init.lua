local M = {}

local options = require 'meadow.options'

M.change_brightness = function(diff)
    local new_value = options.current_options.color_value + diff
    options.update_options { color_value = new_value }
    vim.notify(vim.inspect(options.current_options), vim.log.levels.INFO, { title = 'Meadow' })
    vim.cmd.colorscheme 'meadow'
end

M.change_contrast = function(diff)
    local new_value = options.current_options.color_saturation + diff
    options.update_options { color_saturation = new_value }
    vim.notify(vim.inspect(options.current_options), vim.log.levels.INFO, { title = 'Meadow' })
    vim.cmd.colorscheme 'meadow'
end

local define_commands = function()
  vim.api.nvim_create_user_command('MeadowChangeBrightness', function(args)
    local change = tonumber(args.args)
    local new_value = options.current_options.color_value + change
    options.update_options { color_value = new_value }
    print(vim.inspect(options.current_options))
    M.activate()
  end, { nargs = 1 })

  vim.api.nvim_create_user_command('MeadowChangeContrast', function(args)
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
