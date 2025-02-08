return {
  "nvim-flutter/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = true,
  opts = {
    flutter_path = "/Users/p1n9/flutter",
    lsp = {
      cmd = { "/Users/p1n9/flutter/bin/dart", "language-server", "--protocol=lsp" },
    },
  },
  -- opts = function()
  --   local flutter = require("flutter-tools")
  --   flutter.setup({
  --     flutter_path = "/Users/p1n9/flutter",
  --     lsp = {
  --       cmd = { "/Users/p1n9/flutter/bin/dart", "language-server", "--protocol=lsp" },
  --     },
  --   })
  -- end,
}
