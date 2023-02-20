local themes = {
  gruvbox = {
    "ellisonleao/gruvbox.nvim",
    priority = 0,
    lazy = false,
    dependencies = {
      {
        "LazyVim/LazyVim",
        opts = {
          colorscheme = "gruvbox",
        },
      },
    },
  },
  onedark = {
    "navarasu/onedark.nvim",
    priority = 0,
    lazy = false,
    dependencies = {
      {
        "LazyVim/LazyVim",
        opts = {
          colorscheme = "onedark",
        },
      },
    },
  },
}

local selected = "onedark"

return themes[selected]
