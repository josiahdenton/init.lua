local M = {}

M.fold_chars = function()
    return {
        eob = " ",
        fold = ".",
        foldclose = "",
        foldopen = "",
        foldsep = " ",
        msgsep = "─",
    }
end

M.rounded_border = function()
    return {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
    }
end

return M
