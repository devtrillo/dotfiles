return {
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      dashboard.section.header.val = { [[The ultimate editor]] }
      dashboard.section.buttons.val = {
        dashboard.button('e', 'New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('f', 'Search File', ':Telescope find_files <CR>'),
        dashboard.button('t', 'Search Text', ':Telescope grep_string <CR>'),
        dashboard.button('l', 'Lazy', ':Lazy <CR>'),
        dashboard.button('q', 'Quit NVIM', ':qa<CR>'),
      }
      dashboard.config.opts.noautocmd = true

      vim.cmd [[autocmd User AlphaReady echo 'ready']]

      alpha.setup(dashboard.config)
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}
