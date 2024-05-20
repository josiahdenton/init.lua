local set = vim.keymap.set
local opts = { noremap = true, silent = true }

set("v", "<", "<gv")
set("v", ">", ">gv")

set("n", "<C-u>", "<C-u>zz", opts)
set("n", "<C-d>", "<C-d>zz", opts)

set("v", "J", ":m '>+1<CR>gv=gv", opts)
set("v", "K", ":m '<-2<CR>gv=gv", opts)

set('n', '<leader>zz', function()
    require("zen-mode").toggle({
        window = {
            width = .60 -- width will be 85% of the editor width
        }
    })
end, opts)


set('v', 'gx', "<CMD>silent execute '!open ' .. shellescape(expand('<cfile>'), v:true)<CR>")

set({ 'n' }, '<Esc>', '<CMD>nohlsearch<CR>')

set({ 'n' }, '<C-h>', '<C-w><C-h>', { desc = 'move focus to left window' })
set({ 'n' }, '<C-l>', '<C-w><C-l>', { desc = 'move focus to right window' })
set({ 'n' }, '<C-j>', '<C-w><C-j>', { desc = 'move focus to lower window' })
set({ 'n' }, '<C-k>', '<C-w><C-k>', { desc = 'move focus to upper window' })


set({ 'n' }, '<M-,>', '<C-w>5<')
set({ 'n' }, '<M-.>', '<C-w>5>')
set({ 'n' }, '<M-t>', '<C-w>+')
set({ 'n' }, '<M-s>', '<C-w>-')

-- Easily hit escape in terminal mode.
set("t", "<esc><esc>", "<c-\\><c-n>")
