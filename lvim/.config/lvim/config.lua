-- vim options
reload("devtrillo.options")
reload("devtrillo.plugins")
reload("devtrillo.keymaps")
reload("devtrillo.formatters")
reload("devtrillo.colorizer")
reload("devtrillo.autocmds")
reload("devtrillo.scrollbar")

if vim.g.neovide then
	require("devtrillo.neovide")
end
