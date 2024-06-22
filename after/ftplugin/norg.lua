vim.opt.conceallevel = 2

vim.keymap.set("n", "<c-c>", function()
    vim.api.nvim_feedkeys(string.rep("-", 6) .. " ( ) ", "i", false)
end)
