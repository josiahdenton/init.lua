return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.7",
        -- or                              , branch = '0.1.x',
        event = "VeryLazy",
        dependencies = {
            "AckslD/nvim-neoclip.lua",
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_strategy = "vertical",
                    prompt_prefix = ">  ",
                    sorting_strategy = "descending",
                    file_ignore_patterns = {
                        "node_modules",
                    },
                },
                pickers = {
                    -- diagnostics = {
                    -- theme = 'ivy',
                    -- },
                },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                },
            })
            require("neoclip").setup()

            local no_preview = require("telescope.themes").get_dropdown({
                winblend = 0,
                width = 0.5,
                prompt = " ",
                results_height = 15,
                previewer = false,
            })

            -- themes
            local themes = require("telescope.themes")
            -- extensions
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("neoclip")

            local builtin = require("telescope.builtin")
            local custom_actions = require("core.extensions.telescope").actions()

            vim.keymap.set("n", "<leader>gh", function()
                builtin.find_files({
                    prompt_title = "Git File History",
                    -- :h telescope.mappings
                    attach_mappings = function(_, map)
                        map("n", "<cr>", custom_actions.diff_view_file_history)
                        map("i", "<cr>", custom_actions.diff_view_file_history)
                        return true -- required
                    end,
                })
            end, {})

            vim.keymap.set("n", "<leader>ff", function()
                builtin.find_files()
            end, {})

            vim.keymap.set("n", "<leader>fg", function()
                builtin.live_grep()
            end, {})

            vim.keymap.set("n", "<leader>fb", function()
                builtin.buffers(no_preview)
            end, {})

            vim.keymap.set("n", "<leader>f'", function()
                builtin.marks()
            end, {})

            vim.keymap.set("n", "<leader>fi", function()
                builtin.current_buffer_fuzzy_find(no_preview)
            end, {})

            vim.keymap.set("n", "<localleader>ss", function()
                builtin.spell_suggest(themes.get_cursor())
            end, {})

            -- vim.keymap.set("n", "<leader>fm", function()
            --     builtin.man_pages({ sections = { "ALL" } })
            -- end)

            vim.keymap.set("n", "<leader>fh", function()
                builtin.help_tags()
            end, {})

            vim.keymap.set("n", "<leader>hk", function()
                builtin.keymaps(themes.get_ivy())
            end, { desc = "Telescope: find keys" })

            vim.keymap.set("n", "<leader>cc", function()
                builtin.colorscheme(no_preview)
            end, {})

            vim.keymap.set("n", "<leader>fy", function()
                require("telescope").extensions.neoclip.default()
            end)
        end,
    },
}
