return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require("mini.indentscope").setup()
            require("mini.files").setup()

            vim.keymap.set("n", "<leader>N", function()
                require("mini.files").open()
            end, { desc = "MiniFiles: open cwd folder" })

            vim.keymap.set("n", "<leader>?", function()
                require("mini.files").open(vim.api.nvim_buf_get_name(0))
            end, { desc = "MiniFiles: open relative" })
        end
    }
}
