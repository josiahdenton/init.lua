local M = {}

M.keymaps = function ()
    vim.keymap.set('n', '<leader>p', vim.lsp.buf.format)
end

return M
