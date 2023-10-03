return {
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'mfussenegger/nvim-dap-python'
        },
        config = function()
            local keymap = vim.keymap.set
            local dap = require('dap')
            local dapui = require("dapui")

            dapui.setup()

            keymap('n', '<leader>n', function() dap.continue() end)
            keymap('n', '<leader>j', function() dap.step_over() end)
            keymap('n', '<leader>i', function() dap.step_into() end)
            keymap('n', '<leader>o', function() dap.step_out() end)
            keymap('n', '<Leader>b', function() dap.toggle_breakpoint() end)
            keymap('n', '<Leader>B', function() dap.set_breakpoint() end)
            keymap('n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
            keymap('n', '<Leader>dr', function() require('dap').repl.open() end)
            keymap('n', '<Leader>dl', function() require('dap').run_last() end)
            keymap({ 'n', 'v' }, '<leader>K', function() require('dap.ui.widgets').hover() end)
            keymap({ 'n', 'v' }, '<leader>dp', function()
                require('dap.ui.widgets').preview()
            end)
            keymap('n', '<Leader>df', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.frames)
            end)
            keymap('n', '<Leader>ds', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.scopes)
            end)

            vim.keymap.set("n", "<leader>do", dapui.open)
            vim.keymap.set("n", "<leader>de", dapui.close)
            vim.keymap.set("n", "<leader>dt", dapui.toggle)

            local dappython = require('dap-python')

            dappython.setup()

            vim.keymap.set("n", "<leader>dm", dappython.test_method)
            vim.keymap.set("n", "<leader>dc", dappython.test_class)
            vim.keymap.set("n", "<leader>dv", dappython.debug_selection)
        end
    }
}
