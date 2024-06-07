local M = {}

local border = {
    { '╭', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '╮', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '╯', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '╰', 'FloatBorder' },
    { '│', 'FloatBorder' },
}

-- LSP settings (for overriding per client)
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

M.setup = function()
    require('mason').setup()

    local mason_lspconfig = require('mason-lspconfig')

    -- get settings
    local settings = require('core.lsp.settings')
    local servers = require('core.lsp.servers')

    mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers)
    })

    mason_lspconfig.setup_handlers({
        function(server_name)
            require('lspconfig')[server_name].setup({
                handlers = handlers,
                capabilities = settings.capabilities,
                on_attach = settings.on_attach,
                settings = servers[server_name],
                filetypes = (servers[server_name] or {}).filetypes
            })
        end,
        -- ['rust_analyzer'] = function()
        --     local rt = require('rust-tools')
        --     rt.setup({
        --         server = {
        --             on_attach = settings.on_attach_rt(rt)
        --         },
        --     })
        -- end
    })
end

return M
