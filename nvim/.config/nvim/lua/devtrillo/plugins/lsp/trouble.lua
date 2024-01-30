return {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    keys = {
      { "<leader>tt", "<cmd>TroubleToggle<cr>", desc = "trouble" },
      { "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "workspace" },
      { "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "document" },
      { "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", desc = "quickfix" },
      { "<leader>tl", "<cmd>TroubleToggle loclist<cr>", desc = "loclist" },
      { "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>", desc = "references" },
    },
  },
}
