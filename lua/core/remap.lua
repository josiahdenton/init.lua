local set = vim.keymap.set
local opts = { noremap = true, silent = true }

-- nice defaults
set({ 'n', 'x' }, 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true })
set({ 'n', 'x' }, 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true })

set({ "n", "x" }, ";", ":")
set({ "n", "x" }, "H", "^")
set({ "n", "x" }, "L", "$")
set("n", "<leader>w", "<cmd>update<cr>", { desc = "save buffer" })

set("v", "<", "<gv")
set("v", ">", ">gv")

set("n", "<C-u>", "<C-u>zz", opts)
set("n", "<C-d>", "<C-d>zz", opts)

set("v", "J", ":m '>+1<CR>gv=gv", opts)
set("v", "K", ":m '<-2<CR>gv=gv", opts)

local next_word_by_camel_case = function()
    -- TODO: figure out why this won't stop hi
    local parsed = vim.api.nvim_replace_termcodes("/\\u<cr><esc>", true, false, true)
    vim.api.nvim_feedkeys(parsed, "n", false)
end
set("n", "<localleader>w", next_word_by_camel_case, { desc = "go to next upper case word" })

set('v', 'gx', "<CMD>silent execute '!open ' .. shellescape(expand('<cfile>'), v:true)<CR>")

-- Copy/paste with system clipboard
set({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
set('n', 'gp', '"+p', { desc = 'Paste from system clipboard' })
-- - Paste in Visual with `P` to not copy selected text (`:h v_P`)
set('x', 'gp', '"+P', { desc = 'Paste from system clipboard' })

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
set("t", "<c-/>", "<c-\\><c-n>")
