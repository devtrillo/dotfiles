return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    keys = {
      { '<leader>os', '<cmd>ObsidianSearch<cr>', desc = 'Obsidian Search' },
      { '<leader>on', '<cmd>ObsidianNew<cr>', desc = 'Obsidian New' },
    },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '/Users/trillo/Library/Mobile Documents/iCloud~md~obsidian/Documents/my-vault',
        },
      },

      -- see below for full list of options 👇
    },
  },
  {

    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
}
