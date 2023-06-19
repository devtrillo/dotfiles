local icons = require("devtrillo.icons")

return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
			{ "<C-h>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Cycle Prev" },
			{ "<C-l>", "<Cmd>BufferLineCycleNext<CR>", desc = "Cycle Next" },
		},
    dependencies={

{ 'echasnovski/mini.bufremove', version = false ,config=function()
        require('mini.bufremove').setup()
      end}
    },
		opts = {
			options = {
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				diagnostics_indicator = function(_, _, diag)
					local ret = (diag.error and icons.diagnostics.Warning .. diag.error .. " " or "")
						.. (diag.warning and icons.diagnostics.Warning .. diag.warning or "")
					return vim.trim(ret)
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
	},
}
