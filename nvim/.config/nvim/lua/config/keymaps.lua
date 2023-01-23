-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
--
--
lvim.keys.normal_mode["<C-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-j>"] = ":BufferKill<CR>"

vim.keymap.set("n", "<C-/>", "<cmd>:ToggleTerm<CR>", { desc = "ToggleTerm" })
vim.keymap.set("n", "<C-s>", "<cmd>:w<CR>", { desc = "Save file" })

vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", { desc = "Go to the next file" })
vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", { desc = "Go to the previous buffer" })
vim.keymap.set("n", "<C-j>", ":BufferKill<CR>", { desc = "kill the current buffer" })
vim.keymap.set("n", "<leader>P", ":Telescope Projects<CR>", { desc = "Open the projects" })

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  t = { "<cmd>TroubleToggle <cr>", "References" },
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

lvim.builtin.which_key.mappings["g"] = {
  name = "+Git",
  P = { "<cmd>!git pull<cr>", "Pull latest changes" },
  p = { "<cmd>!gp<cr>", "Push/Publish changes" },
  g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
}

lvim.builtin.which_key.mappings["o"] = {
  name = "+Obsidian",
  f = { "<cmd>ObsidianQuickSwitch<CR>", "Search Note" },
  t = { "<cmd>ObsidianToday<CR>", "Today" },
}
