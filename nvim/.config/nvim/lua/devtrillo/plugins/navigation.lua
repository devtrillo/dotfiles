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
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false,
					hide_by_name = {
						"node_modules",
					},
					never_show = {
						".DS_Store",
					},
				},
				follow_current_file = {
					enabled = true,
				},
			},
		},
		config = function(_, opts)
			local neotree = require("neo-tree")
			neotree.setup(opts)
		end,
		keys = {
			{
				"<leader>e",
				"<cmd>Neotree toggle<cr>",
				desc = "Explorer NeoTree (root dir)",
			},
		},
	},
}
