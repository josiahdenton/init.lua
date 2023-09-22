return {
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers", -- This is the important bit!
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                        default_workspace = 'notes'
                    },
                },
            },
        }
    }
}
