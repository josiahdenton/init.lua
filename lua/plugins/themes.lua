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
        "rose-pine/neovim",
        priority = 1000,
        name = "rose-pine",
        config = function()
            vim.cmd.colorscheme("rose-pine-main")
        end,
    },
}
