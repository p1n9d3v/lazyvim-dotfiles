return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
        opts = {
            colors = {
                light_grey = "require('onedarkpro.helpers').darken('white', 50, 'onedark_dark')",
                dark_red = "require('onedarkpro.helpers').darken('purple', 58, 'onedark')",
            },
            highlights = {
                PmenuSel = {
                    bg = "${light_grey}",
                },
                CursorLine = {
                    bg = "${dark_red}",
                },
                NeoTreeGitUntracked = {
                    fg = "#ef596f",
                },
            },
            styles = {
                keywords = "italic",
                functions = "italic",
                conditionals = "italic",
            },
            options = {
                transparency = true,
            },
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "onedark_dark",
        },
    },
}
