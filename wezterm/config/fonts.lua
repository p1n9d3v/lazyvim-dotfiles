local wezterm = require('wezterm')
local platform = require('utils.platform')

local font_family = 'Dank Mono Nerd'
local font_size = platform.is_mac and 16 or 14

return {
   font = wezterm.font({
      family = font_family,
   }),
   font_size = font_size,
}
