vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('install')

require('core.set')
require('core.remap')
require('core.autocmds')

require('lazy').setup('plugins')

require('core.lsp').setup()
