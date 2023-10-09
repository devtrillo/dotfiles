return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			separator_style = "slant",
			tab_size = 20,
			custom_filter = function(buf_number, buf_numbers)
				-- filter out filetypes you don't want to see
				if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
					return true
				end
				-- filter out by buffer name
				if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
					return true
				end
				-- filter out based on arbitrary rules
				-- e.g. filter out vim wiki buffer from tabline in your work repo
				if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
					return true
				end
				-- filter out by it's index number in list (don't show first buffer)
				if buf_numbers[1] ~= buf_number then
					return true
				end
			end,
		},
	},
	config = function(_, opts)
		local bufferline = require("bufferline")
		bufferline.setup(opts)
		local map = vim.keymap.set

		map("n", "˙", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
		map("n", "¬", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
		map("n", "∆", "<cmd>bdelete<cr>", { desc = "Close buffer" })

		map("n", "<M-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
		map("n", "<M-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
		map("n", "<M-j>", "<cmd>bdelete<cr>", { desc = "Close buffer" })
		map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
	end,
}
