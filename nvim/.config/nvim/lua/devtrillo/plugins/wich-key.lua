return {
	"folke/which-key.nvim",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		plugins = { spelling = true },
		defaults = {
			["<leader>t"] = { name = "+Trouble" },
			["<leader>s"] = { name = "+Search" },
			["<leader>h"] = { name = "+Harpoon" },
			["<leader>z"] = { name = "+Zen Mode" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
	keys = {
		{ "<leadr>", "WhichKey" },
	},
}
