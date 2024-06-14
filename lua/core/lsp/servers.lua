local M = {}

M.lua_ls = {
    Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
    },
}

M.gopls = {
    gopls = {
        hints = {
            constantValues = true,
            parameterNames = true,
            functionTypeParameters = true,
        },
    },
}

M.rust_analyzer = {}

M.yamlls = {
    yaml = {
        validate = false,
        format = {
            enable = true,
        },
        hover = true,
        completion = true,
    },
}

return M
