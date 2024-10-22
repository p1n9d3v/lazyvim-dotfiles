return {
    "hrsh7th/nvim-cmp",

    opts = function(_, opts)
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local cmp = require("cmp")
        cmp.setup({
            mapping = {
                ["<C-Space>"] = cmp.mapping.complete(),
            },
        })

        opts.mapping = vim.tbl_extend("force", opts.mapping, {
            ["<C-e>"] = cmp.mapping.abort(),
            ["<C-j>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
                    cmp.select_next_item()
                elseif vim.snippet.active({ direction = 1 }) then
                    vim.schedule(function()
                        vim.snippet.jump(1)
                    end)
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<C-k>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif vim.snippet.active({ direction = -1 }) then
                    vim.schedule(function()
                        vim.snippet.jump(-1)
                    end)
                else
                    fallback()
                end
            end, { "i", "s" }),
        })
        opts.preselect = require("cmp.types.cmp").PreselectMode.None
        opts.completion = {
            completeopt = "menu,menuone,noselect,noinsert",
        }
        opts.mapping["<CR>"] = require("cmp").mapping.confirm({ select = false })
        opts.window = {
            completion = {
                border = {
                    { "󱐋", "WarningMsg" },
                    { "─", "Comment" },
                    { "╮", "Comment" },
                    { "│", "Comment" },
                    { "╯", "Comment" },
                    { "─", "Comment" },
                    { "╰", "Comment" },
                    { "│", "Comment" },
                },
                scrollbar = false,
                winblend = 0,
            },
            documentation = {
                border = {
                    { "󰙎", "DiagnosticHint" },
                    { "─", "Comment" },
                    { "╮", "Comment" },
                    { "│", "Comment" },
                    { "╯", "Comment" },
                    { "─", "Comment" },
                    { "╰", "Comment" },
                    { "│", "Comment" },
                },
                scrollbar = false,
                winblend = 0,
            },
        }
    end,
}
