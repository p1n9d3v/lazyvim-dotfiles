return {
    "ibhagwan/fzf-lua",
    opts = {
        files = {
            actions = {
                ["alt-g"] = { require("fzf-lua").actions.toggle_hidden },
            },
        },
    },
}
