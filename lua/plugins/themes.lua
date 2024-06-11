return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- Default options:
            require('kanagawa').setup({
                compile = false,  -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false,   -- do not set background color
                dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                colors = {             -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                overrides = function(colors) -- add/modify highlights
                    return {}
                end,
                theme = "wave",    -- Load "wave" theme when 'background' option is not set
                background = {     -- map the value of 'background' option to a theme
                    dark = "wave", -- try "dragon" !
                    light = "lotus"
                },
            })

            -- setup must be called before loading
            -- vim.cmd("colorscheme kanagawa-dragon")
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
                override = {},
                -- Cursorline options.  Also includes visual/selection.
                cursorline = {
                    -- Bold font in cursorline.
                    bold = true,
                    -- Bold cursorline number.
                    bold_number = true,
                    -- Available styles: 'dark', 'light'.
                    theme = 'dark',
                    -- Blending the cursorline bg with the buffer bg.
                    blend = 0.85,
                },
                noice = {
                    -- Available styles: `classic`, `flat`.
                    style = 'flat',
                },
                telescope = {
                    -- Available styles: `classic`, `flat`.
                    style = 'flat',
                },
                leap = {
                    -- Dims the backdrop when using leap.
                    dim_backdrop = false,
                },
                ts_context = {
                    -- Enables dark background for treesitter-context window
                    dark_background = true,
                }
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
