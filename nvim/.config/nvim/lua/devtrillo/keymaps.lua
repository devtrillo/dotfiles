local map = vim.keymap.set

map("n", "<leader>w", function()
	vim.lsp.buf.format({ timeout_ms = 10000 })
	vim.api.nvim_command("write")
end, { desc = "Save file" })

map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Close window" })
