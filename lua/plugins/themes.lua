return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            -- vim.cmd.colorscheme("rose-pine")
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
