lvim.format_on_save.enabled = true
-- lvim.transparent_window = true
lvim.colorscheme = "catppuccin-mocha"


reload("devtrillo.plugins")

lvim.keys.normal_mode["<C-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-j>"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<C-/>"] = ":ToggleTerm<CR>"

lvim.builtin.which_key.mappings["<space>"] = { "<cmd>Telescope find_files<cr>", "Find files" }

vim.opt.backup = false
vim.opt.colorcolumn = "80"
vim.opt.cursorcolumn = true
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wrap = false
vim.opt.timeoutlen = 250

lvim.builtin.treesitter.auto_install = true
