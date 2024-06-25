-- local set = vim.opt_local
--
-- -- Set local settings for terminal buffers
-- vim.api.nvim_create_autocmd("TermOpen", {
--     group = vim.api.nvim_create_augroup("custom-term-open", {}),
--     callback = function()
--         set.number = false
--         set.relativenumber = false
--         set.scrolloff = 0
--     end,
-- })
--
--
-- -- Open a terminal at the bottom of the screen with a fixed height.
-- vim.keymap.set("n", "<leader>t", function()
--     vim.cmd.new()
--     vim.cmd.wincmd "J"
--     vim.api.nvim_win_set_height(0, 12)
--     vim.wo.winfixheight = true
--     vim.cmd.term()
-- end)
--

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
--   callback = function ()
--     vim.diagnostic.open_float(nil, {focus=false})
--   end
-- })

local M = {}

M.setup = function()
    -- for mini status line
    vim.api.nvim_create_autocmd("RecordingEnter", {
        pattern = "*",
        callback = function()
            vim.cmd("redrawstatus")
        end,
    })

    vim.api.nvim_create_autocmd("RecordingLeave", {
        pattern = "*",
        callback = function()
            vim.cmd("redrawstatus")
        end,
    })

    -- vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx" })

    vim.api.nvim_create_autocmd({ "TextYankPost" }, {
        pattern = { "*" },
        callback = function()
            vim.highlight.on_yank()
        end,
        desc = "Highlight yanked text",
    })

    -- vim.api.nvim_create_autocmd({ "VimEnter", "InsertLeave" }, {
    --     pattern = "*",
    --     callback = function()
    --         vim.opt.number = true
    --         vim.opt.relativenumber = true
    --     end,
    -- })
    --
    -- vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    --     pattern = "*",
    --     callback = function()
    --         vim.opt.number = true
    --         vim.opt.relativenumber = false
    --     end,
    -- })
    --
    -- didn't work very well :(
    -- local min_cursor_group = vim.api.nvim_create_augroup("MinimalCursorLine", { clear = true })
    -- vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
    --     group = min_cursor_group,
    --     pattern = "*",
    --     callback = function()
    --         vim.opt_local.cursorline = true
    --     end,
    -- })
    --
    -- vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
    --     group = min_cursor_group,
    --     pattern = "*",
    --     callback = function()
    --         vim.opt_local.cursorline = false
    --     end,
    -- })
end

return M
