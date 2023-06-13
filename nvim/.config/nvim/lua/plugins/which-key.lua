return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 1
	end,
	opts = {
		key_labels = {
			-- override the label used to display some keys. It doesn't effect WK in any other way.
			-- For example:
			["<space>"] = "Space",
			["<cr>"] = "Enter",
			["<tab>"] = "Tab",
		},
	},
	config = function()
		local wk = require("which-key")

		wk.register({
			w = { "<cmd>write<CR>", "Save file" },
			s = { name = "Search" },
			t = { name = "Trouble" },
			z = { name = "Zen Mode" },
			b = { name = "Buffers" },
			n = { name = "Notifications" },
		}, { prefix = "<leader>" })
	end,
}
