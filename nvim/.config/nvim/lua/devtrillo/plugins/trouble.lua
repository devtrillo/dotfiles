return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		keys = {
			{ "<leader>tt", "<cmd>TroubleToggle<cr>", desc = "Toggle" },
			{ "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Toggle Workspace" },
			{ "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Toggle Document" },
			{ "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", desc = "Toggle QuickFix" },
			{ "<leader>tl", "<cmd>TroubleToggle loclist<cr>", desc = "Toggle LocList" },
			{ "<leader>tR", "<cmd>TroubleToggle lsp_references<cr>", desc = "Lsp references" },
		},
	},
}
