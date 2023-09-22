return {
    'tpope/vim-fugitive',
    { 'akinsho/git-conflict.nvim', version = "*", config = true },
    {
        'lewis6991/gitsigns.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = true
    },
}
