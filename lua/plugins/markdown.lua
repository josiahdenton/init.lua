return {
    {
        "dhruvasagar/vim-table-mode",
        event = "BufEnter",
        config = function()
            vim.g.table_mode_corner = '|'
        end
    }
}
