local M = {}

M.setup = function()
    require("core.lsp.mason").setup()
    require("core.lsp.cmp").setup()
end

return M
