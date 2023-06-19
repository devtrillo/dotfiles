table.insert(lvim.plugins,
  { "tpope/vim-surround" }
)

table.insert(lvim.plugins, {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      debounce_delay = 500,
    })
  end,
})
