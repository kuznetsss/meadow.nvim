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

## Screenshots

Lua:
![lua](https://user-images.githubusercontent.com/15742918/135935783-61b11df5-cd00-456d-8cc6-136dadf4e59d.png)

<details><summary>More screenshots</summary>
<p>

C++:
![c++](https://user-images.githubusercontent.com/15742918/135935785-9372a829-e325-47a0-8203-f8aa69fa67c9.png)

Python:
![python](https://user-images.githubusercontent.com/15742918/135935776-e38cf97f-3c13-4d23-999b-54ccdda0a7b5.png)

</p>
</details>

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
    color_saturation = 80, -- colors contrast, can be from 0 to 100
    color_value = 80, -- colors brightness, can be from 0 to 100
    indentblankline_colors = true, -- set colors for indent-blankline
    signify_colors = true, -- set colors for signify
    lspsaga_colors = true, -- set colors for lspsaga
    telescope_colors = true, -- set colors for telescope
    spelunker_colors = true, -- set colors for spelunker 
}
```

## Adjusting brightness and contrast

Brightness could be changed using lua:

```lua
-- Add relative_value (could be negative) to the current brightness (color_value option)
require'meadow'.change_brightness(<relative_value>)

-- Set brightness (color_value option) to absolute_value
require'meadow'.set_brightness(<absolute_value>)
```

or using vim commands:

```vim
" Add relative_value (could be negative) to the current brightness (color_value option)
:MeadowChangeBrightness <relative_value>

" Set brightness (color_value option) to absolute_value
:MeadowSetBrightness <absolute_value>
```


Contrast could be changed using lua:

```lua
-- Add relative_value (could be negative) to the current contrast (color_saturation option)
require'meadow'.change_contrast(<relative_value>)

-- Set contrast (color_saturation option) to absolute_value
require'meadow'.set_contrast(<absolute_value>)
```

or using vim commands:

```vim
" Add relative_value (could be negative) to the current contrast (color_saturation option)
:MeadowChangeContrast <relative_value>

" Set contrast (color_saturation option) to absolute_value
:MeadowSetConstrast <absolute_value>
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

