return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local todo_comments = require("todo-comments")
            todo_comments.setup({
                signs = false,
            })

            vim.keymap.set("n", "]t", function()
                todo_comments.jump_next()
            end)

            vim.keymap.set("n", "[t", function()
                todo_comments.jump_prev()
            end)
        end,
    },
}
