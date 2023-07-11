local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.diagnostics.flake8
    },
})

vim.api.nvim_set_keymap("n", "<Leader>p", ":LspZeroFormat<CR>", { noremap = true })
