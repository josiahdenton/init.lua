require("true-zen").setup({
    modes = {
        ataraxis = {
            minmum_writing_area = {
                width = 120,
                height = 44,
            }
        }
    }
})

local api = vim.api

api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
-- api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
-- api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
api.nvim_set_keymap("n", "<leader>zz", ":TZAtaraxis<CR>", {})

