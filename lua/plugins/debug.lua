return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- testing adapters
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-go"
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        dap = { justMyCode = false },
                    }),
                    require("neotest-go"),
                },
            })
            -- generalized test debugging keymaps
            vim.keymap.set("n", "<leader>nr", function()
                require("neotest").run.run()
            end)
            vim.keymap.set("n", "<leader>nf", function()
                require("neotest").run.run(vim.fn.expand("%"))
            end)
            vim.keymap.set("n", "<leader>dm", function()
                require("neotest").run.run({ strategy = "dap" })
            end)
            vim.keymap.set("n", "<leader>df", function()
                require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
            end)
        end
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            "theHamsta/nvim-dap-virtual-text",
            'nvim-neotest/nvim-nio',
            -- adapters
            'mfussenegger/nvim-dap-python',
            'leoluz/nvim-dap-go'
        },
        config = function()
            local keymap = vim.keymap.set
            local dap = require('dap')
            local dapui = require("dapui")

            dapui.setup({
                floating = {
                    max_height = nil,   -- These can be integers or a float between 0 and 1.
                    max_width = nil,    -- Floats will be treated as percentage of your screen.
                    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                controls = {
                    -- Requires Neovim nightly (or 0.8 when released)
                    enabled = true,
                    -- Display controls in this element
                    element = "repl",
                    icons = {
                        pause = "",
                        play = "",
                        step_into = "󰘕",
                        step_over = "󱞫",
                        step_out = "󰘖",
                        step_back = "",
                        run_last = "↻ ",
                        terminate = "□ ",
                    },
                },
            })
            require("nvim-dap-virtual-text").setup()
            require('dap-python').setup()
            require('dap-go').setup()

            keymap('n', '<leader>n', function() dap.continue() end)
            keymap('n', '<leader>j', function() dap.step_over() end)
            keymap('n', '<leader>i', function() dap.step_into() end)
            keymap('n', '<leader>r', function() dap.restart() end)
            keymap('n', '<leader>rc', function() dap.run_to_cursor() end)
            keymap('n', '<leader>o', function() dap.step_out() end)
            keymap('n', '<Leader>b', function() dap.toggle_breakpoint() end)
            keymap('n', '<Leader>B', function() dap.set_breakpoint() end)
            keymap('n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
            keymap('n', '<Leader>dl', function() require('dap').run_last() end)
            keymap('n', '<Leader>dr', function() require('dap').repl.open() end)

            keymap({ 'n', 'v' }, '<leader>K', function()
                require("dapui").eval(nil, { enter = true })
                -- require('dap.ui.widgets').hover()
            end)

            keymap({ 'n', 'v' }, '<leader>dp', function()
                require('dap.ui.widgets').preview()
            end)

            keymap('n', '<Leader>ds', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.scopes)
            end)

            vim.keymap.set("n", "<leader>do", dapui.open)
            vim.keymap.set("n", "<leader>de", dapui.close)
            vim.keymap.set("n", "<leader>dt", dapui.toggle)
        end
    }
}
