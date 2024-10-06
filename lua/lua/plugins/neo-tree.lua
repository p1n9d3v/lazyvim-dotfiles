return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        { "<leader>e", "<leader>fE", desc = "Explorer NeoTree (Root Dir)", remap = true },
        { "<leader>E", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
    },
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
            },
            window = {
                mappings = {
                    ["s"] = "",
                    ["sv"] = "open_vsplit",
                    ["ss"] = "open_split",
                },
            },
        },
    },
}
