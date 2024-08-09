return {
    {
        "akinsho/git-conflict.nvim",
        version = "*",
        event = "VeryLazy",
        opts = {
            default_mappings = {
                ours = "<leader>go",
                theirs = "<leader>gt",
                none = "<leader>gn",
                both = "<leader>gb",
                prev = "[x",
                next = "]x",
            },
            disable_diagnostics = true,
        },
        config = true,
    },
    {
        "pwntester/octo.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("octo").setup()
        end,
    },
}
