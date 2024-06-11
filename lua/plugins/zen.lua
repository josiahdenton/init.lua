return {
    {
        "folke/zen-mode.nvim",
        dependencies = {
            "folke/twilight.nvim"
        },
        config = function()
            require("twilight").setup({
                expand = {
                    "function_item",
                    "method_item",
                    "function_declaration",
                    "method_declaration",
                    "function",
                    "method",
                    "table",
                    "if_statement"
                }
            })

            vim.keymap.set('n', '<leader>zz', function()
                require("zen-mode").toggle({
                    window = {
                        width = .60     -- width will be 85% of the editor width
                    }
                })
            end, { noremap = true, silent = true }
            )
        end
    }
}
