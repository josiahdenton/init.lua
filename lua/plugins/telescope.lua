return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.7',
        -- or                              , branch = '0.1.x',
        dependencies = {
            "AckslD/nvim-neoclip.lua",
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            require('telescope').setup({
                defaults = {
                    -- layout_strategy = "vertical",
                    prompt_prefix = '>  ',
                    sorting_strategy = 'descending',
                    file_ignore_patterns = {
                        "node_modules"
                    }
                },
                pickers = {
                    -- diagnostics = {
                    -- theme = 'ivy',
                    -- },
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
            require('neoclip').setup()

            local no_preview = require "telescope.themes".get_dropdown({
                winblend = 0,
                width = 0.5,
                prompt = " ",
                results_height = 15,
                previewer = false,
            })
            -- themes
            local themes = require('telescope.themes')
            -- extensions
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('neoclip')

            -- setup key maps
            local builtin = require('telescope.builtin')
            -- Project wide searching
            vim.keymap.set('n', '<leader>ff', function()
                builtin.find_files(no_preview)
            end, {})
            vim.keymap.set('n', '<leader>fg', function()
                builtin.live_grep(no_preview)
            end, {})
            vim.keymap.set('n', '<leader>fb', function()
                builtin.buffers(no_preview)
            end, {})
            vim.keymap.set('n', "<leader>f'", function()
                builtin.marks(no_preview)
            end, {})
            -- in file searches
            vim.keymap.set('n', '<leader>fi', function()
                builtin.current_buffer_fuzzy_find(no_preview)
            end, {})
            -- text
            vim.keymap.set('n', '<leader>ss', function()
                builtin.spell_suggest(themes.get_cursor())
            end, {})
            -- Commands
            -- vim.keymap.set('n', '<leader>fc', builtin.commands, {})
            -- Docs
            vim.keymap.set('n', '<leader>fm', function() builtin.man_pages({ sections = { "ALL" } }) end)
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>hk', function()
                builtin.keymaps(themes.get_ivy())
            end, { desc = "Telescope: find keys" })
            -- Other
            vim.keymap.set('n', '<leader>cc', function()
                builtin.colorscheme(no_preview)
            end, {})

            -- git
            vim.keymap.set('n', '<leader>gs', function ()
                builtin.git_bcommits(themes.get_ivy())
            end)

            -- NEOCLIP
            -- search recordings in q
            vim.keymap.set('n', '<leader>fq', function()
                require('telescope').extensions.macroscope.default(no_preview)
            end)
            -- search all yanks
            vim.keymap.set('n', '<leader>fy', function()
                require('telescope').extensions.neoclip.default(themes.get_dropdown())
            end)
        end
    }
}
