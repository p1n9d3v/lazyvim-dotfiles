return {
    "L3MON4D3/LuaSnip",
    --   lazy = false,
    config = function()
        local luasnipLoader = require("luasnip.loaders.from_lua")
        local lsp_root = require("lazyvim.util.root").get()
        vim.notify(lsp_root)

        if lsp_root then
            luasnipLoader.load({ paths = lsp_root .. "/.snippets" })
        else
            luasnipLoader.load({ paths = "~/.config/nvim/lua/plugins/luasnip" })
        end
        require("luasnip").config.setup({
            update_events = "TextChanged,TextChangedI",
            enable_autosnippets = true,
        })
    end,
}
