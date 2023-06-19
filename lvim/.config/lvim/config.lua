-- vim options
reload("devtrillo.plugins")
reload("devtrillo.keymaps")
reload("devtrillo.formatters")
reload("devtrillo.colorizer")
reload("devtrillo.autocmds")
reload("devtrillo.scrollbar")

if vim.g.neovide then
	require("devtrillo.neovide")
end
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
