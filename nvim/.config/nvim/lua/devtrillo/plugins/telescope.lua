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
		cmd = "Telescope",
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

				---@usage disable telescope completely [not recommended]
				active = true,
				on_config_done = nil,
				theme = "dropdown", ---@type telescope_themes
				defaults = {
					prompt_prefix = require("devtrillo.icons").ui.Telescope .. " ",
					selection_caret = require("devtrillo.icons").ui.Forward .. " ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = nil,
					layout_strategy = nil,
					layout_config = {},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob=!.git/",
					},
					file_ignore_patterns = {},
					path_display = { "smart" },
					winblend = 0,
					border = {},
					borderchars = nil,
					color_devicons = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				},
				pickers = {
					find_files = {
						hidden = true,
					},
					live_grep = {
						--@usage don't include the filename in the search results
						only_sort_text = true,
					},
					grep_string = {
						only_sort_text = true,
					},
					buffers = {
						initial_mode = "normal",
					},
					planets = {
						show_pluto = true,
						show_moon = true,
					},
					git_files = {
						hidden = true,
						show_untracked = true,
					},
					colorscheme = {
						enable_preview = true,
					},
				},
				extensions = {
					recent_files = {
						-- This extension's options, see below.
						only_cwd = true,
					},
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
				},
			})
		end,
	},
}
