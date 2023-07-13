-- vim.keymap.set("n", "<leader>zz", function()
--     require("zen-mode").setup {
--         window = {
--             width = 150,
--             options = { }
--         },
--     }
--     require("zen-mode").toggle()
--     vim.wo.wrap = false
--     vim.wo.number = true
--     vim.wo.rnu = true
-- end)
require("true-zen").setup()

local api = vim.api

api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
-- api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
-- api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
api.nvim_set_keymap("n", "<leader>zz", ":TZAtaraxis<CR>", {})

