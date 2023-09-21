local M = {}

M.setup = function()
    require('mason').setup()

    local mason_lspconfig = require('mason-lspconfig')

    -- get settings
    local setup = require('core.lsp.setup')
    local servers = require('core.lsp.servers')

    mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers)
    })

    mason_lspconfig.setup_handlers({
        function(server_name)
            require('lspconfig')[server_name].setup({
                capabilities = setup.capabilities,
                on_attach = setup.on_attach,
                settings = servers[server_name],
                filetypes = (servers[server_name] or {}).filetypes
            })
        end
    })
end

return M
