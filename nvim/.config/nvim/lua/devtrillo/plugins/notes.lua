return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    cmd = {
      'ObsidianOpen',
      'ObsidianNew',
      'ObsidianQuickSwitch',
      'ObsidianFollowLink',
      'ObsidianBacklinks',
      'ObsidianTags',
      'ObsidianToday',
      'ObsidianYesterday',
      'ObsidianTomorrow',
      'ObsidianDailies',
      'ObsidianTemplate',
      'ObsidianSearch',
      'ObsidianLink',
      'ObsidianLinkNew',
      'ObsidianLinks',
      'ObsidianExtractNote',
      'ObsidianWorkspace',
      'ObsidianPasteImg',
      'ObsidianRename',
      'ObsidianToggleCheckbox',
    },
    keys = {
      { '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = 'Obsidian Backlinks' },
      { '<leader>od', '<cmd>ObsidianDailies<cr>', desc = 'Obsidian Dailies' },
      { '<leader>oe', '<cmd>ObsidianExtractNote<cr>', desc = 'Obsidian ExtractNote' },
      { '<leader>of', '<cmd>ObsidianFollowLink<cr>', desc = 'Obsidian Follow Link' },
      { '<leader>ol', '<cmd>ObsidianLink<cr>', desc = 'Obsidian Link' },
      { '<leader>on', '<cmd>ObsidianNew<cr>', desc = 'Obsidian New' },
      { '<leader>oo', '<cmd>ObsidianOpen', desc = 'Obsidian Open' },
      { '<leader>op', '<cmd>ObsidianPasteImg<cr>', desc = 'Obsidian PasteImg' },
      { '<leader>oq', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Obsidian Quick Switch' },
      { '<leader>or', '<cmd>ObsidianRename<cr>', desc = 'Obsidian Rename' },
      { '<leader>os', '<cmd>ObsidianSearch<cr>', desc = 'Obsidian Search' },
      { '<leader>ot', '<cmd>ObsidianToday<cr>', desc = 'Obsidian Today' },
      { '<leader>ow', '<cmd>ObsidianWorkspace<cr>', desc = 'Obsidian Workspace' },
      { '<leader>oy', '<cmd>ObsidianYesterday<cr>', desc = 'Obsidian Yesterday' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '/Users/trillo/Library/Mobile Documents/iCloud~md~obsidian/Documents/my-vault',
        },
      },
      daily_notes = {
        folder = 'dailies',
      },
    },
    config = function(_, opts)
      local obsidian = require 'obsidian'
      vim.opt.conceallevel = 1
      obsidian.setup(opts)
    end,
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
