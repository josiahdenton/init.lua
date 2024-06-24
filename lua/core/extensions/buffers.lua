local M = {}

---@class ToggleTaskBufferOptions
---@field width? integer
local default = {
    width = 0.75,
}

local bufnr = -1
local open = false
local border = require("core.ui.style").rounded_border()

-- M.toggle_scratch_buffer = function()
--     -- FIXME: have this open a side buffer that
--     -- will be in the cwd
--     local float_win = vim.api.nvim_open_win(
--         bufnr,
--         false,
--         { -- create a new split in the current window and put the new buffer in that win
--             title = "Tasks",
--             border = border,
--             relative = "win",
--             row = (gheight - 18) * 0.5, -- row is height
--             col = (gwidth - width) * 0.5, -- col is width
--             win = win,
--             height = 18,
--             width = width,
--         }
--     )
--     vim.api.nvim_buf_call(bufnr, function()
--         vim.cmd("e ~/notes/index.norg")
--     end)
-- end
--
-- TODO: make this a floating window

---@param opts? ToggleTaskBufferOptions
M.toggle_tasks_buffer = function(opts)
    opts = opts or default

    if open and bufnr > 0 then
        open = false
        vim.api.nvim_buf_delete(bufnr, { unload = true })
        return -- return early, don't do anything else
    end

    local win = vim.api.nvim_get_current_win()
    if bufnr < 0 then -- if buffer not set, create a new scratch buffer
        bufnr = vim.api.nvim_create_buf(true, true)
    end

    local win_width = vim.api.nvim_win_get_width(win)
    local win_height = vim.api.nvim_win_get_height(win)
    local width = math.floor(opts.width * win_width)

    -- center
    local gheight = vim.api.nvim_list_uis()[1].height
    local gwidth = vim.api.nvim_list_uis()[1].width

    local float_win = vim.api.nvim_open_win(
        bufnr,
        false,
        { -- create a new split in the current window and put the new buffer in that win
            title = "Tasks",
            border = border,
            relative = "win",
            row = (gheight - 18) * 0.5, -- row is height
            col = (gwidth - width) * 0.5, -- col is width
            win = win,
            height = 18,
            width = width,
        }
    )
    vim.api.nvim_buf_call(bufnr, function()
        vim.cmd("e ~/notes/index.norg")
    end)
    vim.api.nvim_set_current_win(float_win)
    open = true -- task list is now open
end

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

-- vim.print(vim.bo.buftype)
-- vim.api.nvim_win_set_buf(win, bufnr)
-- vim.lsp.buf_attach_client
-- vim.lsp.get_clients
-- vim.lsp.start
-- lua vim.api.nvim_buf_call(buf, function() vim.cmd('edit /absolute/path/to/a/file.lua') end)
-- local file_type = vim.bo.filetype
-- vim.api.nvim_set_option_value("filetype", "nor", { buf = bufnr }) -- set file type of buffer to markdown
-- if bufnr > 0 then -- created, now close it
--     vim.cmd('bd ' .. tostring(bufnr))
--     bufnr = -1
-- end
-- io.open
-- io.write
-- io.close
-- 5.1  Basic Functions                                           *lua-lib-core*
-- 5.7, 5.8

return M
