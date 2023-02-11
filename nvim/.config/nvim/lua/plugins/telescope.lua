return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 
      {'nvim-lua/plenary.nvim'},
      {"nvim-telescope/telescope-symbols.nvim"} 
    },
    keys = {
      {"<leader>f","<cmd>Telescope git_files<CR>",desc="Find git files"},
      {"<leader>F","<cmd>Telescope find_files<CR>",desc="Find files from CWD"},
      {"<leader>st","<cmd>Telescope live_grep<CR>",desc="Search Text"},
      {"<leader>sr","<cmd>Telescope oldfiles<CR>",desc="Find old files"},
      {"<leader>ss","<cmd>Telescope symbols<CR>",desc="Symbols"},
      {"<leader>sk","<cmd>Telescope keymaps<CR>",desc="Keymaps"},
    },
    cmd="Telescope"
  }
}
