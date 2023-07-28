local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier, -- or eslint_d
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports
    },
})

vim.keymap.set("n", "<Leader>p", vim.lsp.buf.format)
