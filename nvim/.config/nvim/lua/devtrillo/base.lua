local opt = vim.opt

opt.backup = false
opt.colorcolumn = "80"
opt.cursorcolumn = true
opt.expandtab = true
opt.hlsearch = false
opt.incsearch = true
opt.isfname:append("@-@")
opt.nu = true
opt.relativenumber = true
opt.scrolloff = 8
opt.shiftwidth = 2
opt.signcolumn = "yes"
opt.smartindent = true
opt.softtabstop = 4
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.updatetime = 50
opt.wrap = false
opt.showmode = false
opt.splitbelow = true
opt.splitright = true
vim.g.markdown_recommended_style = 0
