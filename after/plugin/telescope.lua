local project_actions = require("telescope._extensions.project.actions")


require('telescope').setup({
    defaults = {
        layout_strategy = "vertical"
    },
    pickers = {
        man_pages = {
            -- theme = center_list,
        },
        git_branches = {
            theme = "cursor",
        },

    },
    extensions = {
        file_browser = {
            theme = "ivy",
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
-- local center_list = require"telescope.themes".get_dropdown({
--   winblend = 10,
--   width = 0.5,
--   prompt = " ",
--   results_height = 15,
--   previewer = false,
-- })

local no_preview = function()
    return require('telescope.themes').get_dropdown({
        borderchars = {
            { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
            prompt = { "─", "│", " ", "│", '┌', '┐', "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        },
        width = 0.8,
        previewer = false,
        prompt_title = false
    })
end

require("telescope").load_extension "file_browser"
require("telescope").load_extension "project"

-- require'telescope'.extensions.project.project{}
-- vim.keymap.set('n', '<leader>sp', require'telescope'.extensions.project.project(no_preview()), {})

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
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>/', builtin.grep_string, {})
-- In File Searching
vim.keymap.set('n', '<leader>sr', builtin.lsp_references, {})
-- Git
vim.keymap.set('n', '<leader>gt', builtin.git_status, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>gs', function()
    builtin.git_branches(no_preview())
end, {})
-- Commands
vim.keymap.set('n', '<leader>sc', builtin.commands, {})
-- Other
vim.keymap.set('n', '<leader>s', builtin.registers, {})
vim.keymap.set('n', '<leader>sm', function() builtin.man_pages({ sections = { "ALL" } }) end)
