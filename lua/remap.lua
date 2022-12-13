vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)
