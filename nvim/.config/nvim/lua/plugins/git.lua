return {
  {
    'f-person/git-blame.nvim',
    cmd = 'GitBlameToggle',
    config = function(_, opts)
      vim.cmd 'highlight default link gitblame SpecialComment'
      require('gitblame').setup(opts)
    end,
    opts = {
      enabled = false,
    },
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open lazy git' },
    },
  },
}
