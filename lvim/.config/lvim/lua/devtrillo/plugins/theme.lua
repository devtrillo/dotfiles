table.insert(lvim.plugins, {
  "folke/tokyonight.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme tokyonight]])
  end,
})

table.insert(lvim.plugins, {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  enabled = true,
  priority = 1000,
}
)
