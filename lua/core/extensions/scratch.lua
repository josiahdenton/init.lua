local M = {}

M.open_scratch_markdown = function()
    local win = vim.api.nvim_get_current_win()
    local bufnr = vim.api.nvim_create_buf(true, true) -- create a new scratch buffer to throwaway
    -- vim.api.nvim_win_set_buf(win, bufnr)
    vim.api.nvim_set_option_value("filetype", "markdown", { buf = bufnr }) -- set file type of buffer to markdown
    vim.api.nvim_open_win(bufnr, false, { -- create a new split in the current window and put the new buffer in that win
        split = "left",
        win = win,
        width = 40,
    })
end

return M
