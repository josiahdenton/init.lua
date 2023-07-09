local api = require("nvim-tree.api")

-- empty setup using defaults
require("nvim-tree").setup()

local function open_nvim_tree()
    api.tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter "}, { callback = open_nvim_tree })
vim.api.nvim_set_keymap("n", "<Leader>?", ":NvimTreeFindFile<CR>", { noremap = true })
