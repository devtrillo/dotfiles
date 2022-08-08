local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local devTrilloGroup = augroup("Devtrillo", {})

autocmd("InsertLeave", {
    command = "set nowrap | set rnu",
    group = devTrilloGroup,
    pattern = { "*" },
})

autocmd("InsertEnter", {
    command = "set nornu | set wrap linebreak nolist showbreak=-->>",
    group = devTrilloGroup,
    pattern = { "*" },
})
autocmd("FileType", {
    callback = function()
        require("nvim-treesitter.highlight").attach(0, "bash")
    end,
    group = devTrilloGroup,
    pattern = "zsh",
})
