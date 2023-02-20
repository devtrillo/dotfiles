--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

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
