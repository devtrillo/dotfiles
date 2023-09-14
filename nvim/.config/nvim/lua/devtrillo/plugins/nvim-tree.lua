return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		opts = {
			hide_hidden = false,
		},
		keys = {
			{
				"<leader>e",
				"<cmd>Neotree toggle<cr>",
				desc = "Explorer NeoTree (root dir)",
			},
		},
	},
}
