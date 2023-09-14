return {
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")
			nvim_tmux_nav.setup({
				disable_when_zoomed = true, -- defaults to false
			})
		end,
		keys = {
			{
				"<C-h>",
				function()
					local nvim_tmux_nav = require("nvim-tmux-navigation")
					nvim_tmux_nav.NvimTmuxNavigateLeft()
				end,
				desc = "Navigate Left",
			},
			{
				"<C-j>",
				function()
					local nvim_tmux_nav = require("nvim-tmux-navigation")
					nvim_tmux_nav.NvimTmuxNavigateDown()
				end,
				desc = "Navigate Down",
			},

			{
				"<C-k>",
				function()
					local nvim_tmux_nav = require("nvim-tmux-navigation")
					nvim_tmux_nav.NvimTmuxNavigateUp()
				end,
				desc = "Navigate Up",
			},
			{
				"<C-l>",
				function()
					local nvim_tmux_nav = require("nvim-tmux-navigation")
					nvim_tmux_nav.NvimTmuxNavigateRight()
				end,
				desc = "Navigate Right",
			},
			{
				"<C-\\>",
				function()
					local nvim_tmux_nav = require("nvim-tmux-navigation")
					nvim_tmux_nav.NvimTmuxNavigateLastActive()
					vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
				end,
				desc = "Navigate last active",
			},
			{
				"<C-Space>",
				function()
					local nvim_tmux_nav = require("nvim-tmux-navigation")
					nvim_tmux_nav.NvimTmuxNavigateNext()
				end,
				desc = "Navigate next",
			},
		},
	},
}
