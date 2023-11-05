# meadow.nvim

> **Note:** This is a work in progress. While it is ready for use something may look not nice.

A dark neovim colorscheme based on
[HSV](https://en.wikipedia.org/wiki/HSL_and_HSV) colors.

## Screenshots
TBD

## Install
Same as any other plugin, e.g. using lazy:
```lua
{
  'kuznetsss/meadow.nvim',
  priority = 1000,
  config = true
},
```

## Setup
Here is the default values for options that can be changed:
```lua
require'meadow'.setup {
  color_saturation = 80,
  color_value = 80,
}
```
which will change the default brightness and contrast of the colorscheme.


## Adjusting brightness and contrast
It is possible to adjust brightness and contrast using vim commands:
```vim
MeadowChanngeBrightness +10 " increase brightness by 10%
MeadowChanngeBrightness -10 " decrease brightness by 10%
MeadowChanngeContrast +10 " increase contrast by 10%
MeadowChanngeContrast -10 " decrease contrast by 10%
```

## Thanks
- Thanks to [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) for the list of highlights
