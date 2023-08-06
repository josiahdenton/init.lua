-- require("true-zen").setup({
--     modes = {
--         ataraxis = {
--             minmum_writing_area = {
--                 width = 120,
--                 height = 44,
--             }
--         }
--     }
-- })
--
-- local api = vim.api
--
-- api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
-- api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
-- -- api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
-- -- api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
-- api.nvim_set_keymap("n", "<leader>zz", ":TZAtaraxis<CR>", {})
--

vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 150,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.rnu = true
end)


