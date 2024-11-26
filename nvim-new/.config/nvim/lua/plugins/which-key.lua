return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
    end,
    opts = {
      default = {},
      specs = {
        {
          mode = { "n", "v" },
        },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
