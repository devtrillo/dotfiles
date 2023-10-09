local theme = "catppuccin"
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		enabled = theme == "catppuccin",
		config = function()
			vim.cmd([[colorscheme catppuccin-mocha]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		enabled = theme == "tokyonight",
		name = "tokyonight",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		enabled = theme == "onedark",
		priority = 1000,
		opts = {
			style = "warmer",
		},
		config = function()
			vim.cmd([[colorscheme onedark]])
		end,
	},
	{
		"LunarVim/lunar.nvim",
		lazy = false,
		enabled = theme == "lunar",
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd([[colorscheme lunar]])
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		enabled = theme == "gruvbox",
		priority = 1000,
		config = function(_, opts)
			require("gruvbox").setup(opts)
			vim.o.background = "dark"
			vim.cmd("colorscheme gruvbox")
		end,
		opts = {},
	},
}
