local M = {}

local actions_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

M.actions = function()
    return {
        diff_view_file_history = function(prompt_bufnr)
            local selected_entry = actions_state.get_selected_entry()
            local cmd = "<cmd>DiffviewFileHistory " .. selected_entry[1] .. "<cr>"
            local parsed = vim.api.nvim_replace_termcodes(cmd, true, false, true)
            vim.api.nvim_feedkeys(parsed, 'n', false)
            actions.close(prompt_bufnr)
        end
    }
end



-- our picker function: colors
-- local filetypes = function(opts)
--     opts = opts or {}
--     pickers.new(opts, {
--         prompt_title = "Open new scratch file",
--         finder = finders.new_table {
--             results = { 'python', 'rust', 'go', 'markdown' }
--         },
--         sorter = conf.generic_sorter(opts),
--         attach_mappings = function(prompt_bufnr, _) -- (prompt_bufnr, map)
--             actions.select_default:replace(function()
--                 actions.close(prompt_bufnr)
--                 local selection = actions_state.get_selected_entry()
--                 open_scratch_with_type(selection[1])
--             end)
--             return true
--         end,
--     }):find()
-- end
--
-- -- to execute the function
-- filetypes()
--
return M
