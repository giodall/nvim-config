local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
    sources = {
        --lua
        null_ls.builtins.formatting.stylua,
        --python
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy.with({
            prefer_local = ".venv/bin",
        }),
        null_ls.builtins.diagnostics.ruff,
    },
    diagnostics_format = "[#{s}] #{m}",
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
}
return opts
