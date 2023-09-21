local M = {}

M.setup = function()
    require('neodev').setup()
    require('core.lsp.mason').setup()
    require('core.lsp.cmp').setup()

    require('core.lsp.post').keymaps()
end

return M
