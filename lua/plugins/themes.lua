return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            -- vim.cmd.colorscheme("rose-pine-main")
        end
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('nordic').setup({
                -- This callback can be used to override the colors used in the palette.
                on_palette = function(palette) return palette end,
                -- Enable bold keywords.
                bold_keywords = false,
                -- Enable italic comments.
                italic_comments = true,
                -- Enable general editor background transparency.
                transparent_bg = false,
                -- Enable brighter float border.
                bright_border = true,
                -- Reduce the overall amount of blue in the theme (diverges from base Nord).
                reduced_blue = true,
                -- Swap the dark background with the normal one.
                swap_backgrounds = true,
                -- Override the styling of any highlight group.
                override = {
                    Visual = { bg = "#3e4a5b" }
                },
                -- Cursorline options.  Also includes visual/selection.
                cursorline = {
                    -- Bold font in cursorline.
                    bold = true,
                    -- Bold cursorline number.
                    bold_number = true,
                    -- Available styles: 'dark', 'light'.
                    theme = 'dark',
                    -- Blending the cursorline bg with the buffer bg.
                    blend = 0.9,
                },
            })
            require('nordic').load()
        end
    },
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        config = function()
            -- Default options
            require('nightfox').setup({
                palettes = {
                    duskfox = {
                        bg3 = "#191724" -- from rose-pine iterm theme
                    },
                    terafox = {
                        sel0 = "#3e4a5b", -- Popup bg, visual selection bg
                        sel1 = "#4f6074", -- Popup sel bg, search bg
                    }
                },
                options = {
                    -- Compiled file's destination location
                    transparent = false,     -- Disable setting background
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

            -- vim.cmd.colorscheme("terafox")
            -- vim.cmd.colorscheme("duskfox")
        end
    }
}
