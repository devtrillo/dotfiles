return {
	{
		"folke/tokyonight.nvim",
		lazy = true, -- make sure we load this during startup if it is your main colorscheme
		enabled = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		enabled = true,
		priority = 1000,
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme catppuccin]])
		end,
		opts = {
			integrations = {
				alpha = true,
				cmp = true,
				gitsigns = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				lsp_trouble = true,
				mini = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = true },
				neotest = true,
				noice = true,
				notify = true,
				nvimtree = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				which_key = true,
			},
		},
	},
}
