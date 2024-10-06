return {
    {
        "telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            "nvim-telescope/telescope-file-browser.nvim",
        },
        keys = {
            {
                "<leader>fP",
                function()
                    require("telescope.builtin").find_files({
                        cwd = require("lazy.core.config").options.root,
                    })
                end,
                desc = "Find Plugin File",
            },
            {
                ";f",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.find_files({
                        no_ignore = false,
                        hidden = true,
                    })
                end,
                desc = "Lists files in your current working directory, respects .gitignore",
            },
            {
                ";r",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.live_grep({
                        additional_args = { "--hidden" },
                    })
                end,
                desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
            },
            {
                "\\\\",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.buffers()
                end,
                desc = "Lists open buffers",
            },
            {
                ";t",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.help_tags()
                end,
                desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
            },
            {
                ";;",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.resume()
                end,
                desc = "Resume the previous telescope picker",
            },
            {
                ";e",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.diagnostics()
                end,
                desc = "Lists Diagnostics for all open buffers or a specific buffer",
            },
            {
                ";s",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.treesitter()
                end,
                desc = "Lists Function names, variables, from Treesitter",
            },
            {
                "sf",
                function()
                    local telescope = require("telescope")

                    local function telescope_buffer_dir()
                        return vim.fn.expand("%:p:h")
                    end

                    telescope.extensions.file_browser.file_browser({
                        path = "%:p:h",
                        cwd = telescope_buffer_dir(),
                        respect_gitignore = false,
                        hidden = true,
                        grouped = true,
                        previewer = false,
                        initial_mode = "normal",
                        layout_config = { height = 40 },
                    })
                end,
                desc = "Open File Browser with the path of the current buffer",
            },
        },
        config = function(_, opts)
            local telescope = require("telescope")

            opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
                file_ignore_patterns = { ".git", "node_modules", "vendor" },
                wrap_results = true,
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
                mappings = {
                    n = {},
                },
            })
            opts.pickers = {
                diagnostics = {
                    theme = "ivy",
                    initial_mode = "normal",
                    layout_config = {
                        preview_cutoff = 9999,
                    },
                },
            }
            telescope.setup(opts)
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("file_browser")
        end,
    },
}
