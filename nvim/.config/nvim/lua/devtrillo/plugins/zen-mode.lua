return {
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		keys = {
			{ "<leader>zz", "<cmd>ZenMode<cr>", desc = "Toggle Zen mode" },
		},
		opts = {
			alacritty = {
				enabled = true,
				font = "20", -- font size
			},
		},
	},
}
