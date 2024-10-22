return {
    -- {
    --     "scottmckendry/cyberdream.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = function(_, opts)
    --         opts.transparent = true
    --         opts.italic_comments = true
    --         opts.borderless_telescope = false
    --         opts.theme = {
    --             overrides = function(colors)
    --                 return {
    --                     LineNr = { fg = colors.blue, bg = "NONE", italic = true },
    --                     CursorLineNr = { fg = colors.pink, bg = "NONE", italic = true },
    --                     CursorLine = { bg = colors.bgHighlight, fg = "NONE" },
    --                     Visual = { bg = colors.blue, fg = colors.fg },
    --                     FloatBorder = { fg = colors.cyan, bg = "NONE" },
    --                     NeoTreeFloatBorder = { fg = colors.pink, bg = "NONE" },
    --                     NeoTreeTitleBar = { fg = colors.fg, bg = colors.pink },
    --                 }
    --             end,
    --         }
    --     end,
    -- },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            transparent_background = true,
            custom_highlights = function(colors)
                return {
                    --         FloatBorder = { fg = colors.red, bg = "NONE" },
                    --         NeoTreeFloatBorder = { fg = colors.red, bg = "NONE" },
                    --         NeoTreeTitleBar = { fg = "NONE", bg = colors.red },
                    LineNr = { fg = colors.blue, bg = "NONE" },
                    CursorLineNr = { fg = colors.red, bg = "NONE" },
                }
            end,
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin-mocha",
        },
    },
    -- modicator (auto color line number based on vim mode)
}
