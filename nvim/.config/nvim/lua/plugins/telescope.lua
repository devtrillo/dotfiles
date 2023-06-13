return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			"smartpde/telescope-recent-files",
			"nvim-lua/plenary.nvim",
			"ahmedkhalf/project.nvim",
			{
				"ahmedkhalf/project.nvim",
				config = function()
					require("project_nvim").setup({
						detection_methods = { "pattern" },
						exclude_dirs = {},
						ignore_lsp = {},
						patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
						scope_chdir = "global",
						show_hidden = true,
						silent_chdir = true,
					})
				end,
			},
		},
		event = "VeryLazy",
		keys = {
			{ "<leader><Space>", "<cmd>Telescope find_files<cr>", desc = "Find file" },
			{ "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{
				"<leader>sC",
				"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
				desc = "Colorschem",
			},
			{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
			{ "<leader>sp", "<cmd>Telescope projects<cr>", desc = "Projects" },
			{ "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("recent_files")
			require("telescope").load_extension("projects")
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
