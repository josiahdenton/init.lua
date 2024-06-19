return {
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("mini.indentscope").setup({
                symbol = "│",
                options = { try_as_border = true },
            })
            -- disable indentscope for specific files...
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
            local mini_git = require("mini.git")
            mini_git.setup()

            vim.keymap.set({ "n", "v" }, "<leader>gi", function()
                mini_git.show_at_cursor()
            end)

            require("mini.ai").setup()
            require("mini.pairs").setup()
            require("mini.bracketed").setup({
                buffer = { suffix = "b", options = {} },
                comment = { suffix = "", options = {} },
                conflict = { suffix = "x", options = {} },
                diagnostic = { suffix = "d", options = {} },
                file = { suffix = "f", options = {} },
                indent = { suffix = "i", options = {} },
                jump = { suffix = "j", options = {} },
                location = { suffix = "l", options = {} },
                oldfile = { suffix = "o", options = {} },
                quickfix = { suffix = "q", options = {} },
                treesitter = { suffix = "t", options = {} },
                undo = { suffix = "", options = {} },
                window = { suffix = "w", options = {} },
                yank = { suffix = "y", options = {} },
            })

            local hipatterns = require("mini.hipatterns")
            hipatterns.setup({
                highlighters = {
                    -- this is just folke's todo plugin but with no search
                    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    -- fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                    -- hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                    -- todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                    -- note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            })

            local MiniStatusline = require("mini.statusline")
            MiniStatusline.setup({
                use_icons = vim.g.have_nerd_font,
                content = {
                    active = function()
                        local check_macro_recording = function()
                            if vim.fn.reg_recording() ~= "" then
                                return "Recording @" .. vim.fn.reg_recording()
                            else
                                return ""
                            end
                        end

                        local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                        local git = MiniStatusline.section_git({ trunc_width = 40 })
                        local diff = MiniStatusline.section_diff({ trunc_width = 75 })
                        local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                        -- local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
                        local filename = MiniStatusline.section_filename({ trunc_width = 140 })
                        local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                        local location = MiniStatusline.section_location({ trunc_width = 200 })
                        local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
                        local macro = check_macro_recording()

                        return MiniStatusline.combine_groups({
                            { hl = mode_hl, strings = { mode } },
                            { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
                            "%<", -- Mark general truncate point
                            { hl = "MiniStatuslineFilename", strings = { filename } },
                            "%=", -- End left alignment
                            { hl = "MiniStatuslineFilename", strings = { macro } },
                            { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                            { hl = mode_hl, strings = { search, location } },
                        })
                    end,
                },
            })
        end,
    },
}
