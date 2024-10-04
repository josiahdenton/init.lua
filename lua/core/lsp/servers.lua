local M = {}

M.lua_ls = {
    Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
    },
}

M.gopls = {
    gopls = {
        analyses = {
            unusedvariable = true,
        },
        hints = {
            assignVariableTypes = true,
            rangeVariableTypes = true,
            constantValues = true,
            parameterNames = true,
            functionTypeParameters = true,
        },
    },
}

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

M.ts_ls = {
    complete_function_calls = true,
    vtsls = {
        enableMoveToFileCodeAction = true,
        autoUseWorkspaceTsdk = true,
        experimental = {
            completion = {
                enableServerSideFuzzyMatch = true,
            },
        },
    },
    typescript = {
        updateImportsOnFileMove = { enabled = "always" },
        suggest = {
            completeFunctionCalls = true,
        },
        inlayHints = {
            enumMemberValues = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            variableTypes = { enabled = false },
        },
    },
}

return M
