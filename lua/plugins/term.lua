return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        event = "BufEnter",
        config = function()
            require("toggleterm").setup({
                open_mapping = "<C-S-t>",
            })

            local Terminal = require("toggleterm.terminal").Terminal
            local trim_spaces = true

            vim.keymap.set("n", "<leader>to", "<cmd>ToggleTerm direction=float<cr>", { desc = "Term: open float" })

            local lazygit = Terminal:new({
                cmd = "lazygit",
                dir = "git_dir",
                direction = "float",
                float_opts = {
                    border = "double",
                },
                -- function to run on opening the terminal
                on_open = function(term)
                    vim.cmd("startinsert!")
                    vim.api.nvim_buf_set_keymap(
                        term.bufnr,
                        "n",
                        "q",
                        "<cmd>close<CR>",
                        { noremap = true, silent = true }
                    )
                end,
                -- function to run on closing the terminal
                on_close = function(term)
                    vim.cmd("startinsert!")
                end,
            })

            local lazygit_toggle = function()
                lazygit:toggle()
            end

            vim.keymap.set("n", "<leader>gg", lazygit_toggle, { desc = "ToggleTerm: lazygit toggle" })
            vim.keymap.set("v", "<leader>ts", function()
                require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
            end, { desc = "Term: send line to term" })
        end,
    },
}
