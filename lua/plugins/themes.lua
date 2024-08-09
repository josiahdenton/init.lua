return {
    {
        "rose-pine/neovim",
        priority = 1000,
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "main", -- auto, main, moon, or dawn
                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true, -- Handle deprecated options automatically
                },
                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                },
                highlight_groups = {
                    -- TroubleNormal = { bg = "base" },
                    -- TroubleText = { bg = "base" },
                    -- TroubleCount = { bg = "base" },
                    StatusLine = { fg = "love", bg = "love", blend = 10 },
                    StatusLineNC = { fg = "subtle", bg = "surface" },
                    -- custom groups
                    WinBarRoot = { fg = "love", bg = "surface" },
                    WinBarSep = { fg = "love", bg = "surface" },
                },
            })

            vim.cmd.colorscheme("rose-pine")
        end,
    },
}
