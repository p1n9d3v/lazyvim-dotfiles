return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    config = function(_, opts)
        require("obsidian").setup(opts)

        -- HACK: fix error, disable completion.nvim_cmp option, manually register sources
        local cmp = require("cmp")
        cmp.register_source("obsidian", require("cmp_obsidian").new())
        cmp.register_source("obsidian_new", require("cmp_obsidian_new").new())
        cmp.register_source("obsidian_tags", require("cmp_obsidian_tags").new())
    end,
    opts = {
        workspaces = {
            {
                name = "notes",
                path = "~/Documents/notes",
            },
        },
        completion = {
            nvim_cmp = false,
        },
    },
}
