return{
   {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      {"<leader>tt", "<cmd>TroubleToggle <cr>", "References" },
      {"<leader>tr", "<cmd>Trouble lsp_references<cr>", "References" },
      {"<leader>tf", "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
      {"<leader>td", "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
      {"<leader>tq", "<cmd>Trouble quickfix<cr>", "QuickFix" },
      {"<leader>tl", "<cmd>Trouble loclist<cr>", "LocationList" },
      {"<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    },
  },
}
