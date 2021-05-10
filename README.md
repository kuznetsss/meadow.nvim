# meadow-nvim

A dark neovim colorscheme based on
[HSV](https://en.wikipedia.org/wiki/HSL_and_HSV) colors. 

## Features:
- adjustable brightness and contrast
- built-in colors for:
    - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
    - [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
    - [vim-signify](https://github.com/mhinz/vim-signify)
    - [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
    - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    - [spelunker.vim](https://github.com/kamykn/spelunker.vim)
- bold **functions** and **methods**
- italic *fields* and *properties*

## Install

It could be installed using any plugin manager, 
e.g. [packer](https://github.com/wbthomason/packer.nvim):

```lua
use 'kuznetsss/meadow-nvim'
```

## Setup

Initialize with default options:

```vimscript
colorscheme meadow-nvim
```

Or initialize from lua:

```lua
require'meadow'.setup {
    -- Available options and default values
    color_saturation = 65, -- colors contrast, can be from 0 to 100
    color_value = 70, -- colors brightness, can be from 0 to 100
    indentblankline_colors = true, -- set colors for indent-blankline
    signify_colors = true, -- set colors for signify
    lspsaga_colors = true, -- set colors for lspsaga
    telescope_colors = true, -- set colors for telescope
    spelunker_colors = true, -- set colors for spelunker 
}
```

## Adjusting brightness and contrast

Brightness could be changed by lua commands:

```lua
-- Add relative_value (could be negative) to current brightness (color_value option)
require'meadow'.change_brightness(<relative_value>)

-- Set brightness (color_value option) to absolute_value
require'meadow'.set_brightness(<absolute_value>)
```

Contrast could be changed by lua commands:

```lua
-- Add relative_value (could be negative) to current contrast (color_saturation option)
require'meadow'.change_contrast(<relative_value>)

-- Set contrast (color_saturation option) to absolute_value
require'meadow'.set_contrast(<absolute_value>)
```

Current values of options could be obtained by:

```lua 
require'meadow'.options

-- Returns table:
-- {
--     color_saturation,
--     color_value,
--     indentblankline_colors,
--     signify_colors,
--     lspsaga_colors,
--     telescope_colors,
--     spelunker_colors,
-- }
```

