return {
    {
        "diegoulloao/neofusion.nvim",
        priority = 1000,
        config = function()
            -- require("neofusion").setup({
            --     bold = false,
            --     -- transparent_mode = true,
            --     overrides = {
            --         ["@lsp.type.method"] = { fg = '#CC1D1D' }
            --     }
            -- })
            -- vim.o.background = "dark"
            -- vim.cmd.colorscheme("neofusion")
        end
    },
    {
        'rose-pine/neovim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("rose-pine-dawn")
            -- vim.cmd.colorscheme("rose-pine-main")
        end
    }
}
