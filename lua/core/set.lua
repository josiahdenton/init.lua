-- local arrows = require("icons").arrows

vim.g.copilot_no_tab_map = true
-- disable copilot for buffer
-- vim.b.copilot_enabled = false

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.foldlevelstart = 99 -- no auto folding

vim.opt.scrolloff = 10
vim.opt.signcolumn = 'yes'

vim.opt.termguicolors = true

-- Show whitespace.
-- vim.opt.list = true
-- vim.opt.listchars = { space = '⋅', trail = '⋅', tab = '  ↦ ' }

-- Folding.
vim.o.foldcolumn = '0' -- set to display fold symbols
vim.o.foldlevelstart = 99
vim.o.foldmethod = 'expr'
vim.wo.foldtext = ''
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- UI characters.
vim.opt.fillchars = {
    eob = ' ',
    fold = '.',
    foldclose = '',
    foldopen = '',
    foldsep = ' ',
    msgsep = '─',
}


vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

vim.opt.clipboard = "unnamedplus"

vim.opt.cursorline = true
vim.opt.mouse = 'a'

vim.opt.completeopt = 'menuone,preview'

vim.opt.undofile = true  -- enable persistent undo

vim.opt.exrc = true      -- allow for .nvim.lua files per workspace

vim.g.c_syntax_for_h = 1 -- `.h` files are `c` instead of `cpp`
