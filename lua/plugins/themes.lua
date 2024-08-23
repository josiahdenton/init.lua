return {
    {
        "diegoulloao/neofusion.nvim",
        priority = 1000,
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
        config = function()
            -- vim.cmd.colorscheme("rose-pine-main")
        end,
    },
    {
        "tjdevries/colorbuddy.nvim",
        config = function()
            -- vim.cmd.colorscheme("gruvbuddy")
            -- require("themes.ziggy")
            -- require("themes.synthwave")
        end,
    },
}
