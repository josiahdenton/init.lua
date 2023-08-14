local project_actions = require("telescope._extensions.project.actions")


require('telescope').setup({
    defaults = {
        layout_strategy = "vertical",
        prompt_prefix = '  '
    },
    pickers = {
        diagnostics= {
            theme = 'ivy',
        },
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            hijack_netwr = true
        },
        project = {
            on_project_selected = function(prompt_bufnr)
                project_actions.change_working_directory(prompt_bufnr)
                require("harpoon.ui").toggle_quick_menu()
            end

        }
    }
})


-- themes
local no_preview = function()
    return require('telescope.themes').get_dropdown({
        borderchars = {
            { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
            prompt = { "─", "│", " ", "│", '┌', '┐', "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        },
        width = 0.9,
        previewer = false,
        prompt_title = false
    })
end

require("telescope").load_extension "file_browser"
require("telescope").load_extension "project"

vim.api.nvim_set_keymap(
    'n',
    '<leader>sp',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>sa",
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
-- Project wide searching
vim.keymap.set('n', '<leader>sf', function()
    builtin.find_files(no_preview())
end, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', "<leader>s'", builtin.marks, {})
vim.keymap.set({ 'n', 'v' }, '<leader>sw', builtin.grep_string, {})
-- LSP
vim.keymap.set('n', '<leader>sr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>ss', function()
    builtin.lsp_document_symbols(no_preview())
end, {})
vim.keymap.set('n', '<leader>sD', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>sd', function()
    builtin.diagnostics({
        bufnr = 0
    })
end, {})
-- in file searches
vim.keymap.set('n', '<leader>sq', builtin.quickfix, {})
vim.keymap.set('n', '<leader>si', function()
    builtin.current_buffer_fuzzy_find(no_preview())
end, {})
-- Git
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gl', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>gc', function()
    builtin.git_branches(no_preview())
end, {})
-- Commands
vim.keymap.set('n', '<leader>sc', builtin.commands, {})
-- Docs
vim.keymap.set('n', '<leader>sm', function() builtin.man_pages({ sections = { "ALL" } }) end)
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
-- Other
vim.keymap.set('n', '<leader>cc', function()
    builtin.colorscheme(no_preview())
end, {})
