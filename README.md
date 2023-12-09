# 🌼 meadow.nvim

A dark neovim colorscheme based on [HSV](https://en.wikipedia.org/wiki/HSL_and_HSV) colors.
Why another coolorscheme?
I wanted to have a colorscheme with a lot of green and yellow color.
This colorschemes is inspired by [QtCreator](https://www.qt.io/product/development-tools)'s default colorscheme.

## 🖥️ Screenshots
![Lua code](https://private-user-images.githubusercontent.com/15742918/289275710-b755f65c-e2ce-4290-9ffc-38fd4af55a79.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTEiLCJleHAiOjE3MDIxMzA2MTgsIm5iZiI6MTcwMjEzMDMxOCwicGF0aCI6Ii8xNTc0MjkxOC8yODkyNzU3MTAtYjc1NWY2NWMtZTJjZS00MjkwLTlmZmMtMzhmZDRhZjU1YTc5LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFJV05KWUFYNENTVkVINTNBJTJGMjAyMzEyMDklMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjMxMjA5VDEzNTgzOFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTgzZDk5NGVkN2NlZjk1NjBlOWFmODE5ZmExMzBlMmM0YjExZGVkNWFhNGUwYjY5ODNlNTBjNWE3M2UxNWYxM2EmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.acELPprEKqWgVmWZPAJhoOV8vQYKdpRpsnXuGQtoPIo)

## 📦 Installation
Same as any other plugin, e.g. using lazy:
```lua
{
  'kuznetsss/meadow.nvim',
  priority = 1000,
  config = true
},
```
To switch to the colorscheme:
```vim
colorscheme meadow
```
or
```lua
vim.cmd.colorscheme 'meadow'
```

## 🔧 Setup
Here is an example of configuration with default values:
```lua
require'meadow'.setup {
  color_saturation = 80, -- contrast (0-100)
  color_value = 80, -- brightness (0-100)
}
```
which will change the initial brightness and contrast of the colorscheme.
Setting `color_saturation` to 0 will result in grayscale colorscheme.
And setting `color_value` to 0 will result in black screen.

## 🛠️ Adjusting brightness and contrast

[![demo](https://github.com/kuznetsss/meadow.nvim/assets/15742918/cc6f8e87-c331-4510-87f8-e46d07b8b6ac)](https://github.com/kuznetsss/meadow.nvim/assets/15742918/76175dd4-4e51-4e87-afce-b4a584918ead)

It is possible to adjust brightness and contrast using lua:
```lua
require'meadow'.change_brightness(10) -- increase brightness by 10
require'meadow'.change_contrast(10) -- increase brightness by 10
```
or vim commands:
```vim
MeadowChanngeBrightness +10 " increase brightness by 10
MeadowChanngeBrightness -10 " decrease brightness by 10
MeadowChanngeContrast +10 " increase contrast by 10
MeadowChanngeContrast -10 " decrease contrast by 10
```

## 💡 Using colors in your lua code

`require'meadow'.colors.rgb` contains a table with all colors in hex rgb format. Eache color has two fields: `fg` and `bg`.
For example:

```lua
require'meadow'.colors.rgb.red1.fg -- '#cc2929' with the default brightness and contrast
```

## 👍 Thanks
- Thanks to [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) for the list of highlights.

## 🎨 Similar colorschemes
- I think [one-dark.nvim](https://github.com/navarasu/onedark.nvim) is quite similar but with more blue and less green.
