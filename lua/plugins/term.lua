return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup({
                -- open_mapping = "<leader>t"
            })

            local trim_spaces = true
            -- vim.keymap.set("v", "<leader>ts", function()
            --     require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
            -- end)
            vim.keymap.set("v", "<leader>ts", function()
                require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
            end)
        end
    }
}
