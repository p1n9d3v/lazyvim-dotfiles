return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = false },
            servers = {
                -- cssls = {
                --   settings = {
                --     css = {
                --       lint = {
                --         unknownAtRules = "ignore",
                --       },
                --     },
                --   },
                -- },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            local cmp = require("blink-cmp")
            -- disable a keymap
            keys[#keys + 1] = {
                "<C-k>",
                mode = { "i" },
                function()
                    if not cmp.is_visible() then
                        vim.lsp.buf.signature_help()
                    else
                        cmp.select_prev()
                    end
                end,
            }
        end,
    },
}
