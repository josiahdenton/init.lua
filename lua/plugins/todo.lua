return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        config = function()
            local todo_comments = require("todo-comments")
            todo_comments.setup({
                signs = false,
            })

            vim.keymap.set("n", "]t", function()
                todo_comments.jump_next({ keywords = { "ERROR", "FIXME", "TODO" } })
            end)

            vim.keymap.set("n", "[t", function()
                todo_comments.jump_prev({ keywords = { "ERROR", "FIXME", "TODO" } })
            end)
        end,
    },
}
