return {
    -- {
    --     "rebelot/kanagawa.nvim", -- neorg needs a colorscheme with treesitter support
    --     priority = 1000,
    --     opts = {
    --         compile = true,
    --         -- transparent = true,
    --     },
    -- },
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
            custom_highlights = function(C)
                return {
                    --         FloatBorder = { fg = colors.red, bg = "NONE" },
                    --         NeoTreeFloatBorder = { fg = colors.red, bg = "NONE" },
                    --         NeoTreeTitleBar = { fg = "NONE", bg = colors.red },
                    LineNr = { fg = C.blue, bg = "NONE" },
                    CursorLineNr = { fg = C.red, bg = "NONE" },
                    CmpItemMenu = { fg = C.pink, bg = "NONE", italic = true },
                    CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
                    CmpItemKindKeyword = { fg = C.base, bg = C.red },
                    CmpItemKindText = { fg = C.base, bg = C.teal },
                    CmpItemKindMethod = { fg = C.base, bg = C.blue },
                    CmpItemKindConstructor = { fg = C.base, bg = C.blue },
                    CmpItemKindFunction = { fg = C.base, bg = C.blue },
                    CmpItemKindFolder = { fg = C.base, bg = C.blue },
                    CmpItemKindModule = { fg = C.base, bg = C.blue },
                    CmpItemKindConstant = { fg = C.base, bg = C.peach },
                    CmpItemKindField = { fg = C.base, bg = C.green },
                    CmpItemKindProperty = { fg = C.base, bg = C.green },
                    CmpItemKindEnum = { fg = C.base, bg = C.green },
                    CmpItemKindUnit = { fg = C.base, bg = C.green },
                    CmpItemKindClass = { fg = C.base, bg = C.yellow },
                    CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
                    CmpItemKindFile = { fg = C.base, bg = C.blue },
                    CmpItemKindInterface = { fg = C.base, bg = C.yellow },
                    CmpItemKindColor = { fg = C.base, bg = C.red },
                    CmpItemKindReference = { fg = C.base, bg = C.red },
                    CmpItemKindEnumMember = { fg = C.base, bg = C.red },
                    CmpItemKindStruct = { fg = C.base, bg = C.blue },
                    CmpItemKindValue = { fg = C.base, bg = C.peach },
                    CmpItemKindEvent = { fg = C.base, bg = C.blue },
                    CmpItemKindOperator = { fg = C.base, bg = C.blue },
                    CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
                    CmpItemKindCopilot = { fg = C.base, bg = C.teal },
                }
            end,
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin-mocha",
            -- colorscheme = "kanagawa",
        },
    },
    -- modicator (auto color line number based on vim mode)
}
