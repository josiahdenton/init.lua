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
    -- conform fallbacks to vim.lsp.buf.format
    -- keymap('n', '<leader>p', vim.lsp.buf.format, buf_opts)

    -- searching
    keymap('n', 'gd', vim.lsp.buf.definition, buf_opts)
    -- now default in v0.10
    -- keymap('n', 'K', vim.lsp.buf.hover, buf_opts)
    -- telesope
    keymap('n', 'gr', telescope_builtins.lsp_references, buf_opts)
    keymap('n', 'gI', telescope_builtins.lsp_implementations, buf_opts)
end

local signs = { Error = "", Warn = "", Hint = "", Info = "" }


local function set_diagnostic_config()
    vim.diagnostic.config({
        signs = {
            enable = true,
            text = {
                ["ERROR"] = signs.Error,
                ["WARN"] = signs.Warn,
                ["HINT"] = signs.Hint,
                ["INFO"] = signs.Info,
            }
        },
        virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = function(diagnostic, i, total)
                if diagnostic.severity == vim.diagnostic.severity.ERROR then
                    return signs.Error
                end
                if diagnostic.severity == vim.diagnostic.severity.WARN then
                    return signs.Warn
                end
                if diagnostic.severity == vim.diagnostic.severity.INFO then
                    return signs.Info
                end
                if diagnostic.severity == vim.diagnostic.severity.HINT then
                    return signs.Hint
                end
                return ""
            end
            -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
            -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
            -- prefix = "icons",
        },
        severity_sort = true,
        underline = false,
        float = {
            -- style = 'minimal',
            border = 'rounded',
            source = true,
            header = '',
            prefix = '',
        },
    })
end

local function setup_inlay_hints(client, bufnr)
    local function toggle_inlay_hints()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
    end

    vim.keymap.set("n", "<leader>dh", toggle_inlay_hints)
end

M.on_attach = function(client, bufnr)
    setup_inlay_hints(client, bufnr)
    set_diagnostic_config()
    lsp_keymaps(bufnr)
end

M.on_attach_rt = function(rt)
    return function(_, bufnr)
        lsp_keymaps(bufnr, rt)
    end
end




return M
