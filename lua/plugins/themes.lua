return {
    -- vim.cmd("highlight CustomCmpPicker guibg=#b4ebbc guifg=#212031 gui=bold")
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function()
            require("tokyonight").setup({
                style = "night",
                plugins = {
                    mini_cursorword = false,
                },
                on_colors = function(colors)
                    colors.bg = "#0b0b12"
                    colors.bg_sidebar = "#0b0b12"
                    colors.bg_highlight = "#181a26"
                end,
                on_highlights = function(hl, c)
                    hl.MiniCursorWord = {
                        fg = nil,
                        bg = nil,
                        underline = true,
                    }
                    hl.MiniCursorWordCurrent = {
                        fg = nil,
                        bg = nil,
                        underline = true,
                    }
                    hl.WinBar = {
                        bg = c.bg,
                    }
                    hl.PmenuSel = {
                        bg = "#aaf3b5",
                        fg = "#212031",
                    }
                    hl.TroubleNormal = {
                        bg = c.bg,
                    }
                    hl.TroubleNormalNC = {
                        bg = c.bg,
                    }
                end,
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        enabled = true,
        priority = 1000,
        config = function()
            require("nightfox").setup({
                palettes = {
                    terafox = {
                        bg0 = "#0a1214",
                        bg1 = "#0a1214",
                    },
                },
                groups = {
                    terafox = {
                        Pmenu = {
                            bg = "#0a1214",
                        },
                        PmenuSel = {
                            bg = "#aaf3b5",
                            fg = "#212031",
                        },
                        CursorLine = {
                            bg = "#17282c",
                        },
                    },
                },
            })

            vim.cmd.colorscheme("terafox")
        end,
    },
    {
        "tjdevries/colorbuddy.nvim",
        enabled = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("gruvbuddy")
            -- require("themes.ziggy")
            -- require("themes.synthwave")
        end,
    },
}
