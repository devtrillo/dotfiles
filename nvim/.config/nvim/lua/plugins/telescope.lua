return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			"smartpde/telescope-recent-files",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-project.nvim",
		},
		event = "VeryLazy",
		keys = {
			{ "<leader><Space>", "<cmd>Telescope find_files<cr>", desc = "Find file" },
			{ "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
			{ "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>sp", "<cmd>Telescope project<cr>", desc = "Projects" },
			{ "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("recent_files")
			telescope.load_extension("project")
			telescope.setup({
				extensions = {
					recent_files = {
						-- This extension's options, see below.
						only_cwd = true,
					},
				},
			})
		end,
	},
}
