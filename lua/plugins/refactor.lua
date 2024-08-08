return {
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()

            vim.keymap.set("x", "<leader>re", "<cmd>Refactor extract<cr>")
            vim.keymap.set({ "n", "x" }, "<leader>ri", "<cmd>Refactor inline_var<cr>")
            vim.keymap.set("n", "<leader>rI", "<cmd>Refactor inline_func<cr>")

            -- vim.keymap.set({ "n", "x" }, "<leader>rr", function()
            --     require("telescope").extensions.refactoring.refactors()
            -- end)
        end,
    },
}
