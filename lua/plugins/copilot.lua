return {
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

            vim.keymap.set("n", "<leader>co", toggle_copilot, { desc = "Copilot: toggle" })

            vim.keymap.set("n", "<leader>cp", "<cmd>Copilot panel<cr>", { desc = "Copilot: open panel" })
            vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false,
                desc = "Copilot: accept suggestion",
            })
            vim.keymap.set("i", "<C-e>", "<Plug>(copilot-dismiss)", { desc = "Copilot dismiss suggestion" })
        end,
    },
}
