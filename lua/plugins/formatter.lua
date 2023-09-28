return {
    {
        'mhartington/formatter.nvim',
        config = function()
            require('formatter').setup({
                filetype = {
                    python = {
                        require('formatter.filetypes.python').black
                    }
                }
            })
        end
    }
}
