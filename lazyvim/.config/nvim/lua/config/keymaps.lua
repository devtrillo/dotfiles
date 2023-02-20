-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
--
--
vim.keymap.set("n", "<C-/>", "<cmd>:ToggleTerm<CR>", { desc = "ToggleTerm" })
vim.keymap.set("n", "<C-s>", "<cmd>:w<CR>", { desc = "Save file" })

vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", { desc = "Go to the next file" })
vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", { desc = "Go to the previous buffer" })
vim.keymap.set("n", "<C-j>", ":BufferKill<CR>", { desc = "kill the current buffer" })
vim.keymap.set("n", "<leader>P", ":Telescope Projects<CR>", { desc = "Open the projects" })

vim.keymap.set("n", "<leader>tt", ":TroubleToggle", { desc = "Trouble toggle" })
