-- reduce update time
vim.o.updatetime = 250

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

vim.opt.inccommand = "split"

-- can now use gy and gp
-- vim.opt.clipboard = "unnamedplus"

-- vim.opt.cursorline = true
vim.opt.mouse = 'a'

vim.opt.undofile = true  -- enable persistent undo

vim.opt.exrc = true      -- allow for .nvim.lua files per workspace

vim.g.c_syntax_for_h = 1 -- `.h` files are `c` instead of `cpp`

if vim.g.neovide then
    vim.o.guifont = "GeistMono Nerd Font Mono"
    vim.g.neovide_transparency = 0.8
    vim.g.neovide_scale_factor = 1.2
    vim.g.neovide_theme = 'auto'
end

-- begin transfer
-- Appearance
vim.o.breakindent   = true    -- Indent wrapped lines to match line start
vim.o.cursorline    = true    -- Highlight current line
vim.o.linebreak     = true    -- Wrap long lines at 'breakat' (if 'wrap' is set)
vim.o.number        = true    -- Show line numbers
vim.o.splitbelow    = true    -- Horizontal splits will be below
vim.o.splitright    = true    -- Vertical splits will be to the right

vim.o.ruler         = false   -- Don't show cursor position in command line
vim.o.showmode      = false   -- Don't show mode in command line
vim.o.wrap          = false   -- Display long lines as just one line

vim.o.signcolumn    = 'yes'   -- Always show sign column (otherwise it will shift text)
vim.o.fillchars     = 'eob: ' -- Don't show `~` outside of buffer

-- Editing
vim.o.ignorecase  = true -- Ignore case when searching (use `\C` to force not doing that)
vim.o.incsearch   = true -- Show search results while typing
vim.o.infercase   = true -- Infer letter cases for a richer built-in keyword completion
vim.o.smartcase   = true -- Don't ignore case when searching if pattern has upper case
vim.o.smartindent = true -- Make indenting smart

vim.o.completeopt   = 'menuone,noinsert,noselect' -- Customize completions
vim.o.virtualedit   = 'block'                     -- Allow going past the end of line in visual block mode
vim.o.formatoptions = 'qjl1'                      -- Don't autoformat comments
vim.o.splitkeep = 'screen'  
