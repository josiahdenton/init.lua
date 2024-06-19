return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    {
        "nvim-neorg/neorg",
        -- event = "BufEnter *.norg",
        event = "VeryLazy", -- must load to get Neorg workspace command
        dependencies = { "luarocks.nvim" },
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/notes", -- Format: <name_of_workspace> = <path_to_workspace_root>
                            },
                            index = "index.norg", -- The name of the main (root) .norg file
                        },
                    },
                },
            })
        end,
    },
}
