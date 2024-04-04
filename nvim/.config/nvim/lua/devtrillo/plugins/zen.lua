return {
  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    keys = {
      { '<leader>zz', '<cmd>ZenMode<cr>', desc = 'zenmode' },
    },
    config = {
      window = {
        width = 0.85,
      },
      alacritty = {
        enabled = true,
        font = '20', -- font size
      },
    },
    dependencies = {
      {
        'folke/twilight.nvim',
        opts = {},
      },
      { 'preservim/vim-pencil' },
    },
  },
}
