devtrillo = {
    colorscheme = "onedark"
}
require("devtrillo.set")
require("devtrillo.packer")
require("devtrillo.autocommands")

local augroup = vim.api.nvim_create_augroup

DevtrilloGroup = augroup("devtrillo", {})

local yank_group = augroup("HighlightYank", {})
