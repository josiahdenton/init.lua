vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 150,
            options = { }
        },
    }
    require("zen-mode").toggle()
end)

vim.keymap.set("n", "<leader>cc", function()
    if vim.g.colors_name == 'neobones' then
        vim.cmd('colorscheme rose-pine')
    else
        vim.cmd('colorscheme neobones')
    end
    require("zen-mode").setup {
        window = {
            width = 150,
            options = { }
        },
    }
    require("zen-mode").toggle()
end)


