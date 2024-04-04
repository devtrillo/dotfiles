return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>t', '<cmd>Trouble<cr>', desc = 'Trouble' },
      { '<leader>T', '<cmd>TroubleToggle<cr>', desc = 'Trouble Toggle' },
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
