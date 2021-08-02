--[[
O is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
O.format_on_save = true
O.auto_complete = true
O.colorscheme = "gruvbox"
O.auto_close_tree = 1
O.wrap_lines = false
O.timeoutlen = 100
O.leader_key = " "
O.ignore_case = true
O.smart_case = true

-- TODO User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
O.plugin.zen.active = true
O.plugin.dashboard.active = true
O.plugin.telescope.active = true
O.plugin.floatterm.active = true
-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = "all"
O.treesitter.ignore_install = { "haskell" }
O.treesitter.highlight.enabled = true

-- python
O.lang.python.isort = true
O.lang.python.diagnostics.virtual_text = true
O.lang.python.analysis.use_library_code_types = true

-- javascript
O.lang.tsserver.linter = 'eslint'


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
O.user_autocommands = {{ "BufWinEnter", "*", "highlight Normal guibg=none"}}

-- Additional Leader bindings for WhichKey
O.user_which_key = {
  ["."] = "LunarConfig",
  t={
    name="+Trouble",
    t={"<cmd> :TroubleToggle<cr>","Trouble Toggle"}
  },
  u={
    name="+Utils",
    b={"<cmd> lua require('lv-macos').background_selector()<cr>", "Change background"},
  },
}

-- Additional Plugins
O.user_plugins = {
  {"styled-components/vim-styled-components"},
  {"morhetz/gruvbox"},
  {"tpope/vim-surround"},
  {"wakatime/vim-wakatime", event = 'VimEnter'},
  {"tpope/vim-eunuch"},
  {"ap/vim-css-color"},
  {"mattn/emmet-vim", opt = true, ft={"tsx","js","jsx","svelte","html"}},

 {
    "folke/trouble.nvim",
    cmd = "TroubleToggle"}
}

vim.api.nvim_set_keymap("n", "<M-Right>", ":BufferNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-Left>", ":BufferPrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-Down>", ":BufferClose<CR>", { noremap = true, silent = true })

vim.cmd 'highlight Normal guibg=none'
-- dashboard
O.plugin.dashboard.custom_header = {
  '██████╗ ███████╗██╗   ██╗    ██╗   ██╗██╗███╗   ███╗',
  '██╔══██╗██╔════╝██║   ██║    ██║   ██║██║████╗ ████║',
  '██║  ██║█████╗  ██║   ██║    ██║   ██║██║██╔████╔██║',
  '██║  ██║██╔══╝  ╚██╗ ██╔╝    ╚██╗ ██╔╝██║██║╚██╔╝██║',
  '██████╔╝███████╗ ╚████╔╝      ╚████╔╝ ██║██║ ╚═╝ ██║',
  '╚═════╝ ╚══════╝  ╚═══╝        ╚═══╝  ╚═╝╚═╝     ╚═╝',
