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
        end
    }
}
