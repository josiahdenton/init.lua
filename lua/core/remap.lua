local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)

map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

map('n', '<leader>zz', function()
    require("zen-mode").toggle({
        window = {
            width = .60 -- width will be 85% of the editor width
        }
    })
end, opts)

map('n', '<leader>go', function()
    require("neogit").open()
end, opts)

map('n', '<leader>gc', function()
    require("neogit").close()
end, opts)

map('v', 'gx', "<CMD>silent execute '!open ' .. shellescape(expand('<cfile>'), v:true)<CR>")

map({ 'n' }, '<Esc>', '<CMD>nohlsearch<CR>')

map({ 'n' }, '<C-h>', '<C-w><C-h>', { desc = 'move focus to left window' })
map({ 'n' }, '<C-l>', '<C-w><C-l>', { desc = 'move focus to right window' })
map({ 'n' }, '<C-j>', '<C-w><C-j>', { desc = 'move focus to lower window' })
map({ 'n' }, '<C-k>', '<C-w><C-k>', { desc = 'move focus to upper window' })


map({ 'n' }, '<M-,>', '<C-w>5<')
map({ 'n' }, '<M-.>', '<C-w>5>')
map({ 'n' }, '<M-t>', '<C-w>+')
map({ 'n' }, '<M-s>', '<C-w>-')
