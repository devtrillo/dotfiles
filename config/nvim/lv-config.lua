-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level="warn"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "gruvbox"

-- keymappings
lvim.leader = "space"

-- overwrite the key-mappings provided by LunarVim for any mode, or leave it empty to keep them
lvim.keys.normal_mode["[d"] = "<PageUp>"
lvim.keys.normal_mode["]d"] = "<PageDown>"
lvim.keys.normal_mode["<M-Right>"] = ":BufferNext<CR>"
lvim.keys.normal_mode["<M-Left>"] = ":BufferPrevious<CR>"
lvim.keys.normal_mode["<M-Down"] = ":BufferClose<CR>"

-- if you just want to augment the existing ones then use the utility function
-- require("utils").add_keymap_insert_mode({ silent = true }, {
-- { "<C-s>", ":w<cr>" },
-- { "<C-c>", "<ESC>" },
-- })
-- you can also use the native vim way directly
--vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = {"haskell"}
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- Additional Plugins
lvim.plugins = {
    {"styled-components/vim-styled-components"},
    {"morhetz/gruvbox"},
    {"tpope/vim-surround"},
    {"wakatime/vim-wakatime", event = "VimEnter"},
    {"tpope/vim-eunuch"},
    {"ap/vim-css-color"},
    {"mattn/emmet-vim", opt = true, ft = {"tsx", "js", "jsx", "svelte", "html"}},
    {"folke/trouble.nvim", cmd = "TroubleToggle"}

}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*", "highlight Normal guibg=none"},
-- }
vim.api.nvim_command([[
  autocmd BufEnter * :highlight Normal guibg=none
]])
-- Additional Leader bindings for WhichKey
lvim.builtin.dashboard.custom_header = {
    "██████╗ ███████╗██╗   ██╗    ██╗   ██╗██╗███╗   ███╗",
    "██╔══██╗██╔════╝██║   ██║    ██║   ██║██║████╗ ████║",
    "██║  ██║█████╗  ██║   ██║    ██║   ██║██║██╔████╔██║",
    "██║  ██║██╔══╝  ╚██╗ ██╔╝    ╚██╗ ██╔╝██║██║╚██╔╝██║",
    "██████╔╝███████╗ ╚████╔╝      ╚████╔╝ ██║██║ ╚═╝ ██║",
    "╚═════╝ ╚══════╝  ╚═══╝        ╚═══╝  ╚═╝╚═╝     ╚═╝"
}

vim.cmd "highlight Normal guibg=none"

lvim.builtin.which_key.mappings["u"] = {
    name = "+Utils",
    b = {"<cmd> lua require('personal').background_selector()<cr>", "Change background"}
}
lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = {"<cmd>Trouble lsp_references<cr>", "References"},
    f = {"<cmd>Trouble lsp_definitions<cr>", "Definitions"},
    d = {"<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss"},
    q = {"<cmd>Trouble quickfix<cr>", "QuickFix"},
    l = {"<cmd>Trouble loclist<cr>", "LocationList"},
    w = {"<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss"},
    t = {"<cmd> :TroubleToggle<cr>", "Trouble Toggle"}
}
