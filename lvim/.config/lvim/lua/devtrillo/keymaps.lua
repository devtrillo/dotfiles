lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-j>"] = ":BufferKill<CR>"

vim.keymap.set("n", "<C-/>", "<cmd>:ToggleTerm<CR>", { desc = "ToggleTerm" })

lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["z"] = {
    name = "+Zettlekasten",
    z = { "<cmd>ZenMode<CR>", "Zen Mode" },
    i = { "<cmd>TroubleToggle <cr>", "References" },
    n = { "<cmd>TroubleToggle <cr>", "References" },
    c = { "<cmd>TroubleToggle <cr>", "References" },
}
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
