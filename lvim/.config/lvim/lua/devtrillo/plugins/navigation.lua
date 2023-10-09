table.insert(lvim.plugins,
  {
    "ggandor/lightspeed.nvim",
    event = "VeryLazy",
    dependencies = { "tpope/vim-repeat" },
    config = {}
  }
)

table.insert(lvim.plugins, {
  "ggandor/lightspeed.nvim",
  event = "BufRead",
})

table.insert(lvim.plugins, {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
})
