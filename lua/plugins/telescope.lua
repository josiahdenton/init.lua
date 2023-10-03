return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    -- or                              , branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
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
            },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
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

        -- extensions
        require('telescope').load_extension('fzf')

        -- setup key maps
        local builtin = require('telescope.builtin')
        -- Project wide searching
        vim.keymap.set('n', '<leader>ff', function()
            builtin.find_files(no_preview())
        end, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', function()
            builtin.buffers(no_preview())
        end, {})
        vim.keymap.set('n', "<leader>f'", builtin.marks, {})
        -- in file searches
        vim.keymap.set('n', '<leader>fi', function()
            builtin.current_buffer_fuzzy_find(no_preview())
        end, {})
        -- Git
        vim.keymap.set('n', '<leader>gs', function()
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