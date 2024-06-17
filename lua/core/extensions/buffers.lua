local M = {}

-- TODO: the next step is to create a "scratches" dir with
-- a list of scratch files and allow the user to choose
-- which type of scratch they would like (python / lua / etc)
-- and then create that file
M.open_tasks_buffer = function()
    -- io.open
    -- io.write
    -- io.close

    -- 5.1  Basic Functions                                           *lua-lib-core*
    -- 5.7, 5.8
    local win = vim.api.nvim_get_current_win()
    local bufnr = vim.api.nvim_create_buf(true, true) -- create a new scratch buffer to throwaway

    -- vim.api.nvim_win_set_buf(win, bufnr)
    -- vim.lsp.buf_attach_client
    -- vim.lsp.get_clients
    -- vim.lsp.start
    -- lua vim.api.nvim_buf_call(buf, function() vim.cmd('edit /absolute/path/to/a/file.lua') end)
    -- local file_type = vim.bo.filetype
    -- vim.api.nvim_set_option_value("filetype", "nor", { buf = bufnr }) -- set file type of buffer to markdown
    vim.api.nvim_open_win(bufnr, false, { -- create a new split in the current window and put the new buffer in that win
        split = "left",
        win = win,
        width = 40,
    })
    vim.api.nvim_buf_call(bufnr, function()
        vim.cmd("Neorg workspace notes")
    end)
end

-- vim.print(vim.bo.buftype)

return M
