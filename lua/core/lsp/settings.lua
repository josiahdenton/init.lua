local M = {}
local keymap = vim.keymap.set

-- TODO: check if this line will do anything
-- local def_capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities()

local function lsp_keymaps(bufnr)
    local buf_opts = { buffer = bufnr, silent = true }
    local telescope_builtins = require('telescope.builtin')
    local trouble = require('trouble')

    -- errors
    keymap('n', '<leader>e', vim.diagnostic.open_float, buf_opts)

    -- actions
    keymap('n', '<leader>rn', vim.lsp.buf.rename, buf_opts)
    keymap('n', '<leader>ca', vim.lsp.buf.code_action, buf_opts)
    keymap('n', '<leader>p', vim.lsp.buf.format, buf_opts)

    -- searching
    keymap('n', 'gd', vim.lsp.buf.definition, buf_opts)
    keymap('n', 'K', vim.lsp.buf.hover, buf_opts)
    -- telesope
    keymap('n', 'gr', telescope_builtins.lsp_references, buf_opts)
    keymap('n', 'gI', telescope_builtins.lsp_implementations, buf_opts)
    -- keymap('n', '<leader>fd', function() telescope_builtins.diagnostics({ bufnr = 0 }) end, buf_opts)
    -- keymap('n', '<leader>fD', telescope_builtins.diagnostics, buf_opts)
    keymap('n', '<leader>fd', function() trouble.toggle('document_diagnostics') end)
    keymap('n', '<leader>fD', function() trouble.toggle('workspace_diagnostics') end)
    -- keymap('n', '<leader>dc', function () trouble.close() end)

    keymap('n', '<leader>ds', telescope_builtins.lsp_document_symbols, buf_opts)
    keymap('n', '<leader>ws', telescope_builtins.lsp_dynamic_workspace_symbols, buf_opts)

end

local function set_diagnostic_config()
    vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = {
            style = 'minimal',
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = '',
        },
    })
end

M.on_attach = function(_, bufnr)
    set_diagnostic_config()
    lsp_keymaps(bufnr)
end




return M
