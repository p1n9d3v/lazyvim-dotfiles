return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = function(_, opts)
      opts.transparent = true
      opts.italic_comments = true
      opts.borderless_telescope = false
      opts.theme = {
        overrides = function(colors)
          return {
            LineNr = { fg = colors.blue, bg = "NONE", italic = true },
            CursorLineNr = { fg = colors.pink, bg = "NONE", italic = true },
          }
        end,
      }
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },
  -- modicator (auto color line number based on vim mode)
}
