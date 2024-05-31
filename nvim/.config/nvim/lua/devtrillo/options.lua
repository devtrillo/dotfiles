local opt = vim.opt

opt.backup = false
opt.breakindent = true
opt.clipboard = 'unnamedplus'
opt.colorcolumn = '80'
opt.cursorcolumn = true
opt.cursorline = true
opt.expandtab = true
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = 'split'
opt.incsearch = true
opt.isfname:append '@-@'
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.mouse = 'a'
opt.nu = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.shiftwidth = 2
opt.showmode = false
opt.signcolumn = 'yes'
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 300
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.undofile = true
opt.updatetime = 250
opt.updatetime = 50
opt.wrap = false

local has = vim.fn.has
local is_mac = has 'macunix'
local is_win = has 'win32'

if is_mac then
  opt.clipboard:append { 'unnamedplus' }
end
if is_win then
  opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
end
