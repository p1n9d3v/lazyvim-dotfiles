return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
        opts = {
            colors = {
                light_grey = "require('onedarkpro.helpers').darken('white', 50, 'onedark_dark')",
            },
            highlights = {
                PmenuSel = {
                    bg = "${light_grey}",
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
