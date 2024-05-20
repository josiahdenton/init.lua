local M = {}
local keymap = vim.keymap.set

-- TODO: check if this line will do anything
-- local def_capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities()

local function lsp_keymaps(client, bufnr)
    local buf_opts = { buffer = bufnr, silent = true }
    local telescope_builtins = require('telescope.builtin')
    local telescope_themes = require('telescope.themes')

    -- errors
    keymap('n', '<leader>e', vim.diagnostic.open_float, buf_opts)
    keymap('n', '<leader>fe', function()
        telescope_builtins.diagnostics(telescope_themes.get_cursor({
            layout_config = {
                width = function(_, _, _)
                    return 80
                end,
                height = function(_, _, _)
                    return 15
                end,
            },
        }))
    end, buf_opts)
    keymap('n', '<leader>fs', function()
        telescope_builtins.lsp_document_symbols(telescope_themes.get_ivy())
    end)
    keymap('n', '<leader>fS', function()
        telescope_builtins.lsp_workspace_symbols(telescope_themes.get_ivy())
    end)

    -- actions
    keymap('n', '<leader>rn', vim.lsp.buf.rename, buf_opts)
    keymap('n', '<leader>a', vim.lsp.buf.code_action, buf_opts)
    -- conform fallbacks to vim.lsp.buf.format
    -- keymap('n', '<leader>p', vim.lsp.buf.format, buf_opts)

    -- searching
    -- keymap('n', 'gd', vim.lsp.buf.definition, buf_opts)
    keymap('n', 'gd', function()
        telescope_builtins.lsp_definitions(telescope_themes.get_cursor())
    end, buf_opts)
    keymap('n', 'gd', function()
        telescope_builtins.lsp_definitions(telescope_themes.get_cursor())
    end, buf_opts)
    -- now default in v0.10
    -- keymap('n', 'K', vim.lsp.buf.hover, buf_opts)
    -- telesope
    keymap('n', 'go', function()
        telescope_builtins.lsp_outgoing_calls(telescope_themes.get_cursor())
    end, buf_opts)
    keymap('n', 'gi', function()
        telescope_builtins.lsp_incoming_calls(telescope_themes.get_cursor())
    end, buf_opts)
    keymap('n', 'gr', function()
        telescope_builtins.lsp_references(telescope_themes.get_cursor())
    end, buf_opts)
    keymap('n', 'gI', function()
        telescope_builtins.lsp_implementations(telescope_themes.get_cursor())
    end, buf_opts)
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
            format = function(diagnostic)
                local icon = ''
                if diagnostic.severity == vim.diagnostic.severity.ERROR then
                    icon = signs.Error
                end
                if diagnostic.severity == vim.diagnostic.severity.WARN then
                    icon = signs.Warn
                end
                if diagnostic.severity == vim.diagnostic.severity.INFO then
                    icon = signs.Info
                end
                if diagnostic.severity == vim.diagnostic.severity.HINT then
                    icon = signs.Hint
                end
                local message = vim.split(diagnostic.message, '\n')[1]
                return string.format('%s %s', icon, message)
            end
            -- prefix = function(diagnostic, i, total)
            --     return ""
            -- end
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

local function setup_inlay_hints(_, bufnr)
    local function toggle_inlay_hints()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
    end

    vim.keymap.set("n", "<leader>dh", toggle_inlay_hints)
end

M.on_attach = function(client, bufnr)
    setup_inlay_hints(client, bufnr)
    set_diagnostic_config()
    lsp_keymaps(client, bufnr)
end

return M
