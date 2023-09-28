local M = {}

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
                capabilities = settings.capabilities,
                on_attach = settings.on_attach,
                settings = servers[server_name],
                filetypes = (servers[server_name] or {}).filetypes
            })
        end,
        -- TODO: may need to setup DAP first
        -- ['rust_analyzer'] = function()
        --     require('rust-tools').setup()
        -- end
    })
end

return M
