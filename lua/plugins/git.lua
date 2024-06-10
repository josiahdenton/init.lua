return {
    { 'akinsho/git-conflict.nvim', version = "*", config = true },
    {
        "pwntester/octo.nvim",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require("octo").setup()
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup {
                current_line_blame = true,
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ ']c', bang = true })
                        else
                            gitsigns.nav_hunk('next')
                        end
                    end, { desc = "gitsigns: next hunk" })

                    map('n', '[c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ '[c', bang = true })
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end, { desc = "gitsigns: next hunk" })

                    -- Actions
                    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "gitsigns: stage hunk" })
                    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "gitsigns: reset hunk" })
                    map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = "gitsigns: unstage hunk" })

                    map('v', '<leader>hs', function()
                        gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
                    end, { desc = "gitsigns: stage hunk (visual)" })

                    map('v', '<leader>hr', function()
                        gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') }
                    end, { desc = "gitsigns: reset hunk (visual)" })

                    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = "gitsigns: stage buffer" })
                    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = "gitsigns: reset buffer" })
                    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "gitsigns: preview hunk" })
                    map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end,
                        { desc = "gitsigns: toggle blame" })
                    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "gitsigns: toggle current line blame" })
                    map('n', '<leader>hd', gitsigns.diffthis, { desc = "gitsigns: diff this" })
                    map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = "gitsigns: diff this (~)" })
                    map('n', '<leader>td', gitsigns.toggle_deleted, { desc = "gitsigns: toggle deleted" })

                    -- Text object
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "gitsigns: hunk text object" })
                end
            }
        end
    },
}
