return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
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

        -- TODO cleanup the following

        -- setup key maps
        local builtin = require('telescope.builtin')
        -- Project wide searching
        vim.keymap.set('n', '<leader>ff', function()
            builtin.find_files(no_preview())
        end, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', "<leader>f'", builtin.marks, {})
        vim.keymap.set({ 'n', 'v' }, '<leader>fw', builtin.grep_string, {})
        -- in file searches
        -- TODO can I use the following
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
    end
}

