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
