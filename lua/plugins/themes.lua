return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("tokyonight-night")
        end,
    },
    {
        "oxfist/night-owl.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            require("night-owl").setup()
            vim.cmd.colorscheme("night-owl")
        end,
    },
    {
        "rose-pine/neovim",
        priority = 1000,
        name = "rose-pine",
        config = function()
            -- vim.cmd.colorscheme("rose-pine-main")
        end,
    },
}
