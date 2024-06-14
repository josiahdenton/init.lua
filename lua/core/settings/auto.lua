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
    vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx" })

    vim.api.nvim_create_autocmd({ "TextYankPost" }, {
        pattern = { "*" },
        callback = function()
            vim.highlight.on_yank()
        end,
        desc = "Highlight yanked text",
    })
end

return M
