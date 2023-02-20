vim.opt.guifont = { "Fira Code Pro", "h14" }
vim.g.neovide_fullscreen = true
vim.api.nvim_create_autocmd("VimResized", {
	pattern = "*",
	callback = function()
		vim.cmd("redraw!")
	end,
})
