return {
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        config = function()
            -- Default options
            require('nightfox').setup({
                options = {
                    -- Compiled file's destination location
                    transparent = true,      -- Disable setting background
                    dim_inactive = false,    -- Non focused panes set to alternative background
                    styles = {               -- Style to be applied to different syntax groups
                        comments = "italic", -- Value is any valid attr-list value `:help attr-list`
                        conditionals = "NONE",
                        constants = "NONE",
                        functions = "NONE",
                        keywords = "italic",
                        numbers = "italic",
                        operators = "italic",
                        strings = "italic",
                        types = "NONE",
                        variables = "NONE",
                    },
                },
            })

            vim.cmd.colorscheme("terafox")
        end
    },
    {
        'rose-pine/neovim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("rose-pine-dawn")
            -- vim.cmd.colorscheme("rose-pine-main")
        end
    }
}
