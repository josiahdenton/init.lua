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
        "tjdevries/colorbuddy.nvim",
        config = function()
            vim.cmd.colorscheme("gruvbuddy")
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
