local options = {
    backup = false,
    timeoutlen = 0,
    clipboard = "unnamedplus",
    cmdheight = 1,
    cmdheight = 2,
    colorcolumn = "80",
    completeopt = {"menuone", "noselect"},
    conceallevel = 0,
    cursorline = true,
    errorbells = false,
    expandtab = true,
    fileencoding = "utf-8",
    guicursor = "",
    guifont = "monospace:h17",
    hlsearch = false,
    hlsearch = true,
    ignorecase = true,
    incsearch = true,
    mouse = "a",
    nu = true,
    number = true,
    numberwidth = 4,
    pumheight = 10,
    relativenumber = false,
    relativenumber = true,
    scrolloff = 8,
    shiftwidth = 2,
    shiftwidth = 4,
    showmode = false,
    showtabline = 2,
    sidescrolloff = 8,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    softtabstop = 4,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 2,
    termguicolors = true,
    timeoutlen = 100,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
    updatetime = 300,
    updatetime = 50,
    wrap = false,
    writebackup = false
}

vim.g.mapleader = " "
vim.opt.shortmess:append("c")
vim.opt.isfname:append("@-@")

for option_prop, value in pairs(options) do
    vim.opt[option_prop] = value
end
