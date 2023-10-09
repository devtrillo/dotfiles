return {
	{
		"sanathks/workspace.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		opts = {
			workspaces = {
				{ name = "Vail", path = "~/lifelink/vail", keymap = { "<leader>PV" } },
				{ name = "Vail-2", path = "~/lifelink/vail-2", keymap = { "<leader>Pv" } },
				{ name = "Blog", path = "~/lifelink/astro-blog", keymap = { "<leader>Pb" } },
				{ name = "Dotfiles", path = "~/dotfiles", keymap = { "<leader>Pd" } },
			},
		},
		keys = {
			{
				"<leader>Ps",
				function()
					local workspace = require("workspace")
					workspace.tmux_sessions()
				end,
				desc = "Workspace: Tmux sessions",
			},
		},
	},
}
