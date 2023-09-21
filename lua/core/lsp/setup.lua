local M = {}
local keymap = vim.keymap.set

-- local def_capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities()

local function lsp_keymaps(bufnr)
    local buf_opts = { buffer = bufnr, silent = true }

    keymap('n', 'gD', '<CMD>Lspsaga lsp_finder<CR>', buf_opts)
    keymap('n', 'gl', '<CMD>Lspsaga show_line_diagnostics<CR>', buf_opts)
    keymap('n', 'gL', '<CMD>Lspsaga show_buf_diagnostics<CR>', buf_opts)
    keymap('n', 'gd', '<CMD>Lspsaga goto_definition<CR>', buf_opts)
    keymap('n', 'gp', '<CMD>Lspsaga peek_definition', buf_opts)

    keymap('n', 'K', '<CMD>Lspsaga hover_doc<CR>', buf_opts)
    keymap('n', 'gr', '<CMD>Lspsaga finder<CR>', buf_opts)

    keymap('n', '<F2>', '<CMD>Lspsaga rename<CR>', buf_opts)
    keymap('n', '<F4>', '<CMD>Lspsaga code_action<CR>', buf_opts)
end

M.on_attach = function(_, bufnr)
    lsp_keymaps(bufnr)
end

return M
