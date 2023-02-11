return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = { style = "moon" },
    priority = 0
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
}
