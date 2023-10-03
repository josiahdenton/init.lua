local M = {}

M.setup = function()
    require('neodev').setup({
        library = { plugins = { "nvim-dap-ui" }, types = true }
    })
    require('core.lsp.mason').setup()
    require('core.lsp.cmp').setup()
end

return M
