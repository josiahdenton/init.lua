vim.keymap.set("n", "<leader>a", function()
    vim.cmd.RustLsp("codeAction")
end, { silent = true, desc = "Rust: code actions" })

vim.keymap.set("n", "<leader>r", function()
    vim.cmd.RustLsp("run")
end, { silent = true, desc = "Rust: run" })

vim.keymap.set("n", "<leader>n", function()
    vim.cmd.RustLsp("debug")
end, { silent = true, desc = "Rust: start debugger" })

vim.keymap.set("n", "<leader>e", function()
    vim.cmd.RustLsp("renderDiagnostic")
end, { desc = "Rust: open diagnostic" })

vim.keymap.set("n", "<leader>E", function()
    vim.cmd.RustLsp("explainError")
end, { desc = "Rust: explain error" })
