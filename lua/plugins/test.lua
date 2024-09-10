return {
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-jest", "marilari88/neotest-vitest" },
    opts = function(_, opts)
      opts.adapters = {
        require("neotest-jest"),
        require("neotest-vitest"),
      }
    end,
  },
}
