local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)

map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
