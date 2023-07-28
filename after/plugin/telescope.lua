require('telescope').setup({
    defaults = {
        layout_strategy = "vertical"
    }
})

local builtin = require('telescope.builtin')
-- File Searching
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- In File Searching
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
-- Git
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gl', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>gc', builtin.git_branches, {})
-- Commands
vim.keymap.set('n', '<leader>fh', builtin.command_history, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})
-- Other
vim.keymap.set('n', '<leader>"', builtin.registers, {})
