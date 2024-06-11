return {
    {
        "nvim-neotest/neotest",
        event = "VeryLazy",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- testing adapters
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-jest"
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        dap = { justMyCode = false },
                    }),
                    require("neotest-go"),
                    require("neotest-jest")
                },
            })
            -- generalized test debugging keymaps
            vim.keymap.set("n", "<leader>nr", function()
                require("neotest").run.run()
            end, { desc = "Neotest: run test" })

            vim.keymap.set("n", "<leader>nf", function()
                require("neotest").run.run(vim.fn.expand("%"))
            end, { desc = "Neotest: run file" })

            vim.keymap.set("n", "<leader>dm", function()
                require("neotest").run.run({ strategy = "dap" })
            end, { desc = "Neotest: debug test" })

            vim.keymap.set("n", "<leader>df", function()
                require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
            end, { desc = "Neotest: debug file" })

            vim.keymap.set("n", "<leader>ne", function()
                require("neotest").output.open({ enter = true, auto_close = true })
            end, { desc = "Neotest: show test outcome" })

            vim.keymap.set("n", "<leader>no", function()
                require("neotest").summary.toggle()
            end, { desc = "Neotest: show test summary panel" })
        end
    },
    {
        'rcarriga/nvim-dap-ui',
        event = "VeryLazy",
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
                render = {
                    indent = 2,
                },
                layouts = {
                    {
                        elements = {
                            { id = "scopes",  size = 0.5 },
                            { id = "watches", size = 0.5 },
                        },
                        size = 40,
                        position = "left",
                    },
                    {
                        elements = { "console" },
                        position = "bottom",
                        size = 15,
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
            require("nvim-dap-virtual-text").setup({
                display_callback = function(variable, buf, stackframe, node, options)
                    if #(variable.value) > 10 then
                        return "..."
                    end

                    if options.virt_text_pos == 'inline' then
                        return ' = ' .. variable.value
                    else
                        return variable.name .. ' = ' .. variable.value
                    end
                end,
            })
            require('dap-python').setup()
            require('dap-go').setup()

            dap.adapters["pwa-node"] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "node",
                    args = { vim.env.HOME .. "/path/to/js-debug/src/dapDebugServer.js", "${port}" }
                }
            }

            keymap('n', '<leader>n', function() dap.continue() end, { desc = "DAP: continue" })
            keymap('n', '<leader>j', function() dap.step_over() end, { desc = "DAP: step over" })
            keymap('n', '<leader>i', function() dap.step_into() end, { desc = "DAP: step into" })
            keymap('n', '<leader>r', function() dap.restart() end, { desc = "DAP: restart" })
            keymap('n', '<leader>rc', function() dap.run_to_cursor() end, { desc = "DAP: run to cursor" })
            keymap('n', '<leader>o', function() dap.step_out() end, { desc = "DAP: step out" })
            keymap('n', '<Leader>b', function() dap.toggle_breakpoint() end, { desc = "DAP: toggle breakpoint" })
            keymap('n', '<Leader>B', function() dap.set_breakpoint() end, { desc = "DAP: set breakpoint" })
            keymap('n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
                { desc = "DAP: set breakpoint with debug log" })
            keymap('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "DAP: re-run last" })
            keymap('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "DAP: open repl" })

            keymap({ 'n', 'v' }, '<leader>K', function()
                require("dapui").eval(nil, { enter = true })
            end, { desc = "DAP: eval variable" })

            keymap({ 'n', 'v' }, '<leader>dp', function()
                require('dap.ui.widgets').preview()
            end, { desc = "DAP: preview value(???)" })

            keymap('n', '<Leader>ds', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.scopes)
            end, { desc = "DAP: show scopes" })

            vim.keymap.set("n", "<leader>do", dapui.open, { desc = "DAP: open ui" })
            vim.keymap.set("n", "<leader>de", dapui.close, { desc = "DAP: close ui" })
            vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "DAP: toggle ui" })
        end
    }
}
