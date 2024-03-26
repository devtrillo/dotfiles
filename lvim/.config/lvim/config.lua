lvim.format_on_save.enabled = true
-- lvim.transparent_window = true
lvim.colorscheme = "catppuccin-mocha"


reload("devtrillo.plugins")

lvim.keys.normal_mode["<C-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-j>"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<C-/>"] = ":ToggleTerm<CR>"

lvim.builtin.which_key.mappings["<space>"] = { "<cmd>Telescope find_files<cr>", "Find files" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<cr>", "Find files" }
lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope find_files<cr>", "Find files" }

lvim.builtin.which_key.mappings.g = {
  J = { "<cmd>tabclose<cr>", "Tab Close" },
  N = { "<cmd>tabnew<cr>", "Tab New" },
  g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
  n = { "<cmd>tabNext<cr>", "Tab Next" },
  p = { "<cmd>tabprevious<cr>", "Tab Previous" },
}

lvim.builtin.bufferline.options.mode = 'tabs'

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


lvim.builtin.lualine.sections = {
  lualine_a = { "mode" },
  lualine_b = { "branch" },
  lualine_c = { "filename" },
  lualine_x = { "encoding", "fileformat", "filetype" },
  lualine_y = { "progress" },
  lualine_z = { "tabs" },
}

lvim.builtin.treesitter.auto_install = true

local function augroup(name)
  return vim.api.nvim_create_augroup("devtrillo_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local exclude = { "gitcommit" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    print("Creating file...")
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
