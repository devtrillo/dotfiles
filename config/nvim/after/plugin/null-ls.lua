local augroup = vim.api.nvim_create_augroup

local null_ls_group = augroup("null_ls_group", {})
require("null-ls").setup({
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = null_ls_group, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = null_ls_group,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
    },
})
