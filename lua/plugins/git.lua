return {
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>gt",
                function()
                    if vim.g._diffview_open then -- close it
                        vim.cmd("DiffviewClose")
                        vim.g._diffview_open = false
                    else -- then open it
                        vim.cmd("DiffviewOpen")
                        vim.g._diffview_open = true
                    end
                end,
                desc = "diffview: toggle",
            },
        },
        config = function()
            vim.g._diffview_open = false
            require("diffview").setup()
        end,
    },
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
