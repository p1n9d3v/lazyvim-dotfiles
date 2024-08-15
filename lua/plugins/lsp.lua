return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        settings = {
          javascript = {
            preferences = {
              importModuleSpecifier = "non-relative",
            },
          },
          typescript = {
            preferences = {
              importModuleSpecifier = "non-relative",
            },
          },
        },
      },
    },
  },
}
