vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 150,
            options = { }
        },
    }
    require("zen-mode").toggle()
end)
