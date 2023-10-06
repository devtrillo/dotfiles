local theme = "lunar"
return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		enabled = theme == "tokyonight",
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
}
