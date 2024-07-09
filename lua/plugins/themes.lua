return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("tokyonight-night")
        end
    },
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function()
            -- Available values: 'hard', 'medium'(default), 'soft'
            vim.g.gruvbox_material_background = "soft"
            vim.g.gruvbox_material_enable_italic = true
            -- vim.cmd.colorscheme("gruvbox-material")
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
