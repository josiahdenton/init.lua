vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.foldlevelstart = 99 -- no auto folding

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true
vim.opt.mouse = 'a'

vim.opt.completeopt = 'menuone,preview'

vim.opt.undofile = true -- enable persistent undo

vim.g.c_syntax_for_h = 1 -- `.h` files are `c` instead of `cpp`
