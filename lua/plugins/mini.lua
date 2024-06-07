return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require("mini.indentscope").setup()
            require("mini.files").setup()
            require("mini.ai").setup()
            require("mini.pairs").setup()
            require("mini.cursorword").setup()
            require('mini.surround').setup()
            require('mini.bracketed').setup({
                buffer     = { suffix = 'b', options = {} },
                comment    = { suffix = '', options = {} },
                conflict   = { suffix = 'x', options = {} },
                diagnostic = { suffix = 'd', options = {} },
                file       = { suffix = 'f', options = {} },
                indent     = { suffix = 'i', options = {} },
                jump       = { suffix = 'j', options = {} },
                location   = { suffix = 'l', options = {} },
                oldfile    = { suffix = 'o', options = {} },
                quickfix   = { suffix = 'q', options = {} },
                treesitter = { suffix = 't', options = {} },
                undo       = { suffix = '', options = {} },
                window     = { suffix = 'w', options = {} },
                yank       = { suffix = 'y', options = {} },
            })

            local hipatterns = require('mini.hipatterns')
            hipatterns.setup({
                highlighters = {
                    -- this is just folke's todo plugin but with no search
                    -- -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    -- fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                    -- hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                    -- todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                    -- note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            })

            require("mini.basics").setup(
                {
                    -- Options. Set to `false` to disable.
                    options = {
                        -- Basic options ('number', 'ignorecase', and many more)
                        basic = true,

                        -- Extra UI features ('winblend', 'cmdheight=0', ...)
                        extra_ui = false,

                        -- Presets for window borders ('single', 'double', ...)
                        win_borders = 'default',
                    },

                    -- Mappings. Set to `false` to disable.
                    mappings = {
                        -- Basic mappings (better 'jk', save with Ctrl+S, ...)
                        basic = true,

                        -- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
                        -- Supply empty string to not create these mappings.
                        option_toggle_prefix = [[\]],

                        -- Window navigation with <C-hjkl>, resize with <C-arrow>
                        windows = true,

                        -- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
                        move_with_alt = false,
                    },

                    -- Autocommands. Set to `false` to disable
                    autocommands = {
                        -- Basic autocommands (highlight on yank, start Insert in terminal, ...)
                        basic = true,

                        -- Set 'relativenumber' only in linewise and blockwise Visual mode
                        relnum_in_visual_mode = false,
                    },

                    -- Whether to disable showing non-error feedback
                    silent = false,
                }
            )

            vim.keymap.set("n", "<leader>N", function()
                require("mini.files").open()
            end, { desc = "MiniFiles: open cwd folder" })

            vim.keymap.set("n", "<leader>?", function()
                require("mini.files").open(vim.api.nvim_buf_get_name(0))
            end, { desc = "MiniFiles: open relative" })
        end
    }
}
