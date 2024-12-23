return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      local cmp = require("blink-cmp")
      -- disable a keymap
      local prevKeyAction = keys[8]
      print(vim.inspect(prevKeyAction))
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
