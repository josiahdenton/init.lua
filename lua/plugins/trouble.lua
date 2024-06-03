return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                keys = {
                    ["<cr>"] = "jump_close",
                    ["<esc>"] = "close"
                },
                modes = {
                    lsp_definitions = {
                        focus = true,
                        win = {
                            type = "float",
                            relative = "editor",
                            border = "rounded",
                            position = { 0.5, 0.5 },
                            size = { width = 0.5, height = 0.4 },
                            zindex = 200,
                        },
                    },
                    lsp_implementations = {
                        focus = true,
                        win = {
                            type = "float",
                            relative = "editor",
                            border = "rounded",
                            position = { 0.5, 0.5 },
                            size = { width = 0.5, height = 0.4 },
                            zindex = 200,
                        },
                    },
                    lsp_references = {
                        focus = true,
                        win = {
                            type = "float",
                            relative = "editor",
                            border = "rounded",
                            position = { 0.5, 0.5 },
                            size = { width = 0.5, height = 0.4 },
                            zindex = 200,
                        },
                    },
                    lsp_outgoing_calls = {
                        focus = true,
                        win = {
                            type = "float",
                            relative = "editor",
                            border = "rounded",
                            position = { 0.5, 0.5 },
                            size = { width = 0.5, height = 0.4 },
                            zindex = 200,
                        },
                    },
                    lsp_incoming_calls = {
                        focus = true,
                        win = {
                            type = "float",
                            relative = "editor",
                            border = "rounded",
                            position = { 0.5, 0.5 },
                            size = { width = 0.5, height = 0.4 },
                            zindex = 200,
                        },
                    },
                    diagnostics = {
                        focus = true,
                        win = {
                            type = "float",
                            relative = "editor",
                            border = "rounded",
                            position = { 0.5, 0.5 },
                            size = { width = 0.5, height = 0.4 },
                            zindex = 200,
                        },
                    },
                    symbols = {
                        focus = true,
                        win = {
                            type = "float",
                            relative = "editor",
                            border = "rounded",
                            position = { 0.5, 0.5 },
                            size = { width = 0.5, height = 0.4 },
                            zindex = 200,
                        },
                    },
                },
            })
            vim.keymap.set('n', 'gd', function()
                require("trouble").open("lsp_")
            end)

            vim.keymap.set('n', 'go', function()
                require("trouble").open("lsp_outgoing_calls")
            end)
            vim.keymap.set('n', 'gi', function()
                require("trouble").open("lsp_incoming_calls")
            end)

            vim.keymap.set('n', 'gr', function()
                require("trouble").open("lsp_references")
            end)
            vim.keymap.set('n', 'gI', function()
                require("trouble").open("lsp_implementations")
            end)

            vim.keymap.set("n", "<leader>fo", function()
                require("trouble").open("symbols")
            end)

            vim.keymap.set("n", "<leader>fe", function()
                require("trouble").open("diagnostics")
            end)
        end,
    }
}
