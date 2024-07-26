return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function(_, opts)
      require('dashboard').setup(opts)
    end,
    opts = {
      theme = 'hyper',
      config = {
        footer = { 'Devtrillo nvim config' },
        week_header = {
          enable = true,
        },
        shortcut = {
          { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = ' dotfiles',
            group = 'Number',
            action = 'lua require("telescope.builtin").find_files({ prompt_title = "Config",cwd="~/dotfiles/nvim" })',
            key = 'd',
          },
        },
      },
    },
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}
