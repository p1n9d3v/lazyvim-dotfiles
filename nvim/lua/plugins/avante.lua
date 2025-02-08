return {
  "yetone/avante.nvim",
  lazy = true,
  event = "VeryLazy",
  build = "make",

  opts = {
    provider = "claude",
    auto_suggestions_provider = "copilot",
    copilot = { model = "claude-3-5-sonnet-20241022" },
    hints = { enabled = false },
    file_selector = {
      provider = "snacks",
      provider_opts = {},
    },
    behaviour = {
      auto_suggestions = false,
    },
    suggestion = {
      debounce = 1000,
      throttle = 1000,
    },
  },

  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
    {
      "folke/which-key.nvim",
      opts = {
        spec = {
          { "<leader>a", group = "ai" },
        },
      },
    },
  },
}
