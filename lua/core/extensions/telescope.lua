local M = {}

local actions_state = require("telescope.actions.state")
local actions = require("telescope.actions")

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

return M
