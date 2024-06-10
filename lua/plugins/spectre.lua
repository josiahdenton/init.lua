return {
    {
        'nvim-pack/nvim-spectre',
        config = function()
            vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
                desc = "spectre: toggle"
            })
            vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
                desc = "spectre: search current word"
            })
            vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
                desc = "spectre: search current word"
            })
            vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
                desc = "spectre: search on current file"
            })
        end
    }
}
