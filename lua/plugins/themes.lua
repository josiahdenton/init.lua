return {
    -- vim.cmd("highlight CustomCmpPicker guibg=#b4ebbc guifg=#212031 gui=bold")
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        enabled = true,
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
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        enabled = false,
        config = function()
            require("catppuccin").setup({
                highlight_overrides = {
                    all = function(colors)
                        return {
                            PmenuSel = { fg = "#212031", bg = "#b4ebbc", style = { "bold" } },
                            Pmenu = { fg = colors.text, bg = colors.base },
                            MiniIndentscopeSymbol = { fg = colors.surface2 },
                            CurSearch = { bg = colors.sky },
                            IncSearch = { bg = colors.sky },
                            CursorLineNr = { fg = colors.blue, style = { "bold" } },
                            DashboardFooter = { fg = colors.overlay0 },
                            TreesitterContextBottom = { style = {} },
                            WinSeparator = { fg = colors.overlay0, style = { "bold" } },
                            ["@markup.italic"] = { fg = colors.blue, style = { "italic" } },
                            ["@markup.strong"] = { fg = colors.blue, style = { "bold" } },
                            Headline = { style = { "bold" } },
                            Headline1 = { fg = colors.blue, style = { "bold" } },
                            Headline2 = { fg = colors.pink, style = { "bold" } },
                            Headline3 = { fg = colors.lavender, style = { "bold" } },
                            Headline4 = { fg = colors.green, style = { "bold" } },
                            Headline5 = { fg = colors.peach, style = { "bold" } },
                            Headline6 = { fg = colors.flamingo, style = { "bold" } },
                            rainbow1 = { fg = colors.blue, style = { "bold" } },
                            rainbow2 = { fg = colors.pink, style = { "bold" } },
                            rainbow3 = { fg = colors.lavender, style = { "bold" } },
                            rainbow4 = { fg = colors.green, style = { "bold" } },
                            rainbow5 = { fg = colors.peach, style = { "bold" } },
                            rainbow6 = { fg = colors.flamingo, style = { "bold" } },
                        }
                    end,
                },
                color_overrides = {
                    macchiato = {
                        rosewater = "#F5B8AB",
                        flamingo = "#F29D9D",
                        pink = "#AD6FF7",
                        mauve = "#FF8F40",
                        red = "#E66767",
                        maroon = "#EB788B",
                        peach = "#FAB770",
                        yellow = "#FACA64",
                        green = "#70CF67",
                        teal = "#4CD4BD",
                        sky = "#61BDFF",
                        sapphire = "#4BA8FA",
                        blue = "#00BFFF",
                        lavender = "#00BBCC",
                        text = "#C1C9E6",
                        subtext1 = "#A3AAC2",
                        subtext0 = "#8E94AB",
                        overlay2 = "#7D8296",
                        overlay1 = "#676B80",
                        overlay0 = "#464957",
                        surface2 = "#3A3D4A",
                        surface1 = "#2F313D",
                        surface0 = "#1D1E29",
                        base = "#0b0b12",
                        mantle = "#11111a",
                        crust = "#191926",
                    },
                },
                integrations = {
                    telescope = {
                        enabled = true,
                        style = "nvchad",
                    },
                },
            })

            vim.cmd.colorscheme("catppuccin-macchiato")
        end,
    },
    {
        "diegoulloao/neofusion.nvim",
        priority = 1000,
        enabled = false,
        config = function()
            require("neofusion").setup({
                overrides = {
                    MiniIndentscopeSymbol = { fg = "#374151" },
                },
            })
            vim.cmd.colorscheme("neofusion")
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        enabled = false,
        config = function()
            vim.cmd.colorscheme("rose-pine-main")
        end,
    },
    {
        "tjdevries/colorbuddy.nvim",
        enabled = false,
        config = function()
            vim.cmd.colorscheme("gruvbuddy")
            -- require("themes.ziggy")
            -- require("themes.synthwave")
        end,
    },
}
