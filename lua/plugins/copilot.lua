return {
    {
        'github/copilot.vim',
        event = 'InsertEnter',
        opts = {},
        config = function()
            vim.keymap.set('n', '<leader>cp', '<cmd>Copilot panel<cr>')
            vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })
            vim.keymap.set('i', '<C-e>', '<Plug>(copilot-dismiss)')
        end
    },
}
