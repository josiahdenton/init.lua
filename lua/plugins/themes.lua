return {
    {
        'rose-pine/neovim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme rose-pine]])
        end
    }
}
