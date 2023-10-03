return {
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'auto',
                },
                winbar = {
                    lualine_c = {
                        "navic",
                        color_correction = nil,
                        navic_opts = nil
                    }
                }
            })
        end
    }

}
