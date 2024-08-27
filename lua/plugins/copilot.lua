return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            -- { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
            {
                "github/copilot.vim",
                event = "InsertEnter",
                opts = {},
                config = function()
                    vim.g.copilot_on = false
                    vim.cmd("Copilot disable")

                    local toggle_copilot = function()
                        if vim.g.copilot_on then
                            vim.g.copilot_on = false
                            vim.cmd("Copilot disable")
                        else
                            vim.g.copilot_on = true
                            vim.cmd("Copilot enable")
                        end
                    end

                    vim.keymap.set("n", "<leader>ct", toggle_copilot, { desc = "Copilot: toggle" })

                    vim.keymap.set("n", "<leader>cp", "<cmd>Copilot panel<cr>", { desc = "Copilot: open panel" })
                    vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
                        expr = true,
                        replace_keycodes = false,
                        desc = "Copilot: accept suggestion",
                    })
                    vim.keymap.set("i", "<C-e>", "<Plug>(copilot-dismiss)", { desc = "Copilot dismiss suggestion" })
                end,
            },
        },
        opts = {
            debug = false, -- Enable debugging
            -- See Configuration section for rest
            window = {
                layout = "replace",
            },
        },
        config = function(_, opts)
            require("CopilotChat").setup(opts)
            vim.keymap.set("n", "<leader>co", function()
                local bufnr = vim.api.nvim_get_current_buf()
                local win = vim.api.nvim_get_current_win()
                local win_width = vim.api.nvim_win_get_width(win)
                local opened_win = vim.api.nvim_open_win(bufnr, true, {
                    split = "left",
                    win = 0,
                    width = math.floor(0.30 * win_width),
                })

                vim.cmd("CopilotChatToggle")

                local copilot_buffer = vim.api.nvim_win_get_buf(opened_win)
                vim.keymap.set("n", "q", function()
                    vim.api.nvim_win_close(opened_win, false)
                end, { buffer = copilot_buffer })
            end, { desc = "copilot" })
        end,
        -- See Commands section for default commands if you want to lazy load on them
    },
}
