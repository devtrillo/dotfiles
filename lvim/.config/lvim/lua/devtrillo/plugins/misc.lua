table.insert(lvim.plugins,
  { "tpope/vim-surround" }
)

table.insert(lvim.plugins, { "wakatime/vim-wakatime", event = "VeryLazy" })
table.insert(lvim.plugins, {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    { "<leader>zz", "<cmd>ZenMode<cr>", desc = "ZenMode" },
  },
  config = {
    alacritty = {
      enabled = true,
      font = "20", -- font size
    },
  }
})
table.insert(lvim.plugins, {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  config = function()
    require("persistence").setup {
      dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
      options = { "buffers", "curdir", "tabpages", "winsize" },
    }
  end,
})

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}
