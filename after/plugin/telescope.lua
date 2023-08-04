local project_actions = require("telescope._extensions.project.actions")

require('telescope').setup({
    defaults = {
        layout_strategy = "vertical"
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netwr = true
        },
        project = {
            on_project_selected = function(prompt_bufnr)
                -- Do anything you want in here. For example:
                project_actions.change_working_directory(prompt_bufnr, false)
                require("harpoon.ui").toggle_quick_menu()
            end

        }
    }
})

require("telescope").load_extension "file_browser"
require("telescope").load_extension "project"
require("telescope").load_extension "undo"

vim.api.nvim_set_keymap(
    'n',
    '<leader>fu',
    ":Telescope undo<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    'n',
    '<leader>fp',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>fl",
    ":Telescope file_browser<CR>",
    { noremap = true }
)

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
    "n",
    "<leader>?",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { noremap = true }
)

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
