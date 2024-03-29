require('telescope').setup({
    defaults = {
        layout_strategy = "vertical",
        prompt_prefix = '  '
    },
    pickers = {
        diagnostics = {
            theme = 'ivy',
        },
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

local builtin = require('telescope.builtin')
-- Project wide searching
vim.keymap.set('n', '<leader>ff', function()
    builtin.find_files(no_preview())
end, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', "<leader>f'", builtin.marks, {})
vim.keymap.set({ 'n', 'v' }, '<leader>fw', builtin.grep_string, {})
-- LSP
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.lsp_document_symbols(no_preview())
end, {})
vim.keymap.set('n', '<leader>fD', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fd', function()
    builtin.diagnostics({
        bufnr = 0
    })
end, {})
-- in file searches
vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
vim.keymap.set('n', '<leader>fi', function()
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
vim.keymap.set('n', '<leader>fc', builtin.commands, {})
-- Docs
vim.keymap.set('n', '<leader>fm', function() builtin.man_pages({ sections = { "ALL" } }) end)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- Other
vim.keymap.set('n', '<leader>cc', function()
    builtin.colorscheme(no_preview())
end, {})
