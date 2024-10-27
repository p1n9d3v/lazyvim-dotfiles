return {
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/Documents/notes",
                        },
                        default_workspace = "notes",
                    },
                },
                ["core.completion"] = { -- 자동 완성 설정
                    config = { engine = "nvim-cmp", name = "[Norg]" },
                },
                ["core.keybinds"] = {
                    config = {
                        default_keybinds = true,
                    },
                },
            },
        },
    },
}
