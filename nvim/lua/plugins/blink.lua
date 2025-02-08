return {
    {
        "saghen/blink.compat",
        lazy = true,
        opts = {},
        config = function()
            -- monkeypatch cmp.ConfirmBehavior for Avante
            require("cmp").ConfirmBehavior = {
                Insert = "insert",
                Replace = "replace",
            }
        end,
    },
    {

        "saghen/blink.cmp",
        lazy = true,
        dependencies = {
            { "epwalsh/obsidian.nvim" },
        },

        opts = {
            signature = { enabled = true, window = { border = "single" } },
            keymap = {
                -- cmdline 모드에서의 키 매핑
                -- Setting on lsp.lua file
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<C-j>"] = { "select_next", "fallback" },
                ["<CR>"] = { "select_and_accept", "fallback" },
            },
            completion = {
                menu = { border = "single" },
                documentation = { window = { border = "single" } },
            },
            sources = {
                compat = {
                    "avante_commands",
                    "avante_mentions",
                    "avante_files",
                    "obsidian",
                    "obsidian_new",
                    "obsidian_tags",
                },
                providers = {
                    obsidian = {
                        name = "obsidian",
                        module = "blink.compat.source",
                    },
                    obsidian_new = {
                        name = "obsidian_new",
                        module = "blink.compat.source",
                    },
                    obsidian_tags = {
                        name = "obsidian_tags",
                        module = "blink.compat.source",
                    },
                },
            },
        },
    },
}
