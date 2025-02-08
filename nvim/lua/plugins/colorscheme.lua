return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      custom_highlights = function(C)
        return {
          LineNr = { fg = C.blue, bg = "NONE" },
          CursorLineNr = { fg = C.red, bg = "NONE" },
        }
      end,
      integrations = { blink_cmp = true },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
