local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
    vim.cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>r", function()
    vim.cmd.RustLsp("run")
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>n", function()
    vim.cmd.RustLsp("debug")
end, { silent = true, buffer = bufnr })
