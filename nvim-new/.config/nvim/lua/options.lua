local opt = vim.opt

opt.clipboard = "unnamedplus" -- Sync with system clipboard

opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.mouse = "a" -- Enable mouse mode
opt.nu = true
opt.rnu = true
opt.list = true -- Show some invisible characters (tabs...
opt.scrolloff = 4 -- Lines of context
opt.tabstop = 2 -- Number of spaces tabs count for
opt.timeoutlen = 1000 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
vim.g.autoformat = true
vim.g.root_lsp_ignore = { "copilot" }
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
opt.termguicolors = true -- True color support
