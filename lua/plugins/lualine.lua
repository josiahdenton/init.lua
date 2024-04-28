return {
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup({
                sections = {
                    lualine_x = {
                        {
                            require("noice").api.statusline.mode.get,
                            cond = require("noice").api.statusline.mode.has,
                            color = { fg = "#ff9e64" },
                        }
                    },
                },
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
