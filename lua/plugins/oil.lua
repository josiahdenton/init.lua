return {
    {
        "stevearc/oil.nvim",
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup({})
            vim.keymap.set("n", "<leader>N", function()
                vim.cmd("Oil")
                -- require("mini.files").open(vim.api.nvim_buf_get_name(0))
            end, { desc = "Oil: open tree" })
        end,
    },
}
