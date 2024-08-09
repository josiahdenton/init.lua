local M = {}

M.lsp_signs = function()
    -- NOTE: err was 
    return { Error = "✘", Warn = "▲", Hint = "", Info = "" }
end

M.git = function()
    return {
        Branch = "",
    }
end

M.winbar = function()
    return {
        Folder = "󰉋",
        Separator = " ",
    }
end

return M
