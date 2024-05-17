local M = {}
local keymap = vim.keymap.set

-- TODO: check if this line will do anything
-- local def_capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities()

local function lsp_keymaps(bufnr, rt)
    local buf_opts = { buffer = bufnr, silent = true }
    local telescope_builtins = require('telescope.builtin')

    -- errors
    keymap('n', '<leader>e', vim.diagnostic.open_float, buf_opts)
    keymap('n', '<leader>fe', telescope_builtins.diagnostics, buf_opts)

    -- actions
    keymap('n', '<leader>rn', vim.lsp.buf.rename, buf_opts)
    if rt then
        keymap("n", "<leader>a", rt.code_action_group.code_action_group, buf_opts)
    else
        keymap('n', '<leader>a', vim.lsp.buf.code_action, buf_opts)
    end
    -- keymap('n', '<leader>p', vim.lsp.buf.format, buf_opts)

    -- searching
    keymap('n', 'gd', vim.lsp.buf.definition, buf_opts)
    keymap('n', 'K', vim.lsp.buf.hover, buf_opts)
    -- telesope
    keymap('n', 'gr', telescope_builtins.lsp_references, buf_opts)
    keymap('n', 'gI', telescope_builtins.lsp_implementations, buf_opts)
end

local function set_diagnostic_config()
    vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = {
            style = 'minimal',
            border = 'rounded',
            source = true,
            header = '',
            prefix = '',
        },
    })
end

M.on_attach = function(_, bufnr)
    set_diagnostic_config()
    lsp_keymaps(bufnr)
end

M.on_attach_rt = function(rt)
    return function(_, bufnr)
        lsp_keymaps(bufnr, rt)
    end
end




return M
