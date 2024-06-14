local M = {}

M.setup = function()
    vim.filetype.add({
        extension = {
            mdx = "mdx",
        },
    })
end

return M
