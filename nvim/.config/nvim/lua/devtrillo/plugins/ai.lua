return {
  {
    'github/copilot.vim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.keymap.set('i', '<C-r>', 'copilot#Accept("<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_enabled = false
    end,
  },
}
