return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    mappings = {
                        ["q"] = "noop",
                    },
                },
            })

            vim.keymap.set("n", "<leader>gs", function()
                vim.cmd("Neotree git_status")
            end)

            vim.keymap.set("n", "<leader>N", function()
                vim.cmd("Neotree filesystem reveal")
            end)

            vim.keymap.set("n", "<leader>?", function()
                vim.cmd("Neotree buffers")
            end)
        end,
    },
}
