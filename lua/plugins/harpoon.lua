-- return {
--     'theprimeagen/harpoon',
--     config = function()
--         local mark = require("harpoon.mark")
--         local ui = require("harpoon.ui")
--
--         vim.keymap.set("n", "<leader>a", mark.add_file)
--         vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
--
--         vim.api.nvim_create_autocmd({ "VimEnter " }, { callback = ui.toggle_quick_menu })
--
--         vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
--         vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
--         vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
--         vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
--         vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
--         vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)
--         vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end)
--         vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end)
--         vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end)
--     end
-- }
return {

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")

            -- REQUIRED
            harpoon:setup()
            -- REQUIRED

            vim.keymap.set("n", "<leader>fa", function() harpoon:list():add() end)
            -- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-n>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-e>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-i>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-o>", function() harpoon:list():select(4) end)

            -- Toggle previous & next buffers stored within Harpoon list
            -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
            -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

            -- basic telescope configuration
            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
                { desc = "Open harpoon window" })
        end
    }
}
