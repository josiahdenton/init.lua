return {
    {
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended
        lazy = false, -- This plugin is already lazy
        config = function()
            vim.g.rustaceanvim = {
                tools = {
                    float_win_config = {
                        border = "rounded",
                    },
                },
            }
        end,
    },
}
