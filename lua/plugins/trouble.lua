return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                preview = {
                    type = "float",
                    relative = "cursor",
                    -- position = "right",
                    border = "rounded",
                    size = { width = 0.5, height = 0.2 },
                    zindex = 300
                },
                modes = {
                    symbols = {
                        focus = true,
                        win = {
                            type = "float",
                            relative = "editor",
                            border = "rounded",
                            position = { 0.5, 0.5 },
                            size = { width = 1, height = 1 },
                            zindex = 200,
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>fo", function()
                require("trouble").open("symbols")
            end)

            vim.keymap.set("n", "<leader>xx", function()
                require("trouble").open("diagnostics")
            end)
        end,
    }
}
