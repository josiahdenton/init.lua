local M = {}

-- example of persisting buffer id then closing it...
-- local id = vim.api.nvim_create_augroup("startup", {
--   clear = false
-- })
--
-- local persistbuffer = function(bufnr)
--   bufnr = bufnr or vim.api.nvim_get_current_buf()
--   vim.fn.setbufvar(bufnr, 'bufpersist', 1)
-- end
--
-- vim.api.nvim_create_autocmd({"BufRead"}, {
--   group = id,
--   pattern = {"*"},
--   callback = function()
--     vim.api.nvim_create_autocmd({"InsertEnter","BufModifiedSet"}, {
--       buffer = 0,
--       once = true,
--       callback = function()
--         persistbuffer()
--       end
--     })
--   end
-- })
--
-- vim.keymap.set('n', '<Leader>b',
--   function()
--     local curbufnr = vim.api.nvim_get_current_buf()
--     local buflist = vim.api.nvim_list_bufs()
--     for _, bufnr in ipairs(buflist) do
--       if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, 'bufpersist') ~= 1) then
--         vim.cmd('bd ' .. tostring(bufnr))
--       end
--     end
--   end, { silent = true, desc = 'Close unused buffers' })
--
-- TODO: enable this to toggle the task list buffer!
-- use the example above to track bufnr

-- local bufnr = -1
M.toggle_tasks_buffer = function()
    -- if bufnr > 0 then -- created, now close it
    --     vim.cmd('bd ' .. tostring(bufnr))
    --     bufnr = -1
    -- end
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
