return {
  "saghen/blink.cmp",
  opts = {
    signature = { enabled = true, window = { border = "single" } },
    keymap = {
      -- Setting on lsp.lua file
      -- ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
    },
    completion = {
      menu = { border = "single" },
      documentation = { window = { border = "single" } },
    },
  },
}
