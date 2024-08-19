return {
    {
        "EdenEast/nightfox.nvim",
        config = function()
            -- vim.cmd.colorscheme("terafox")
        end,
    },
    {
        "tjdevries/colorbuddy.nvim",
        config = function()
            -- vim.cmd.colorscheme("gruvbuddy")
            require("themes.ziggy")
        end,
    },
}
