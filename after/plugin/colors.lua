-- vim.cmd('color rose-pine')

-- vim.o.background = "dark"
-- vim.cmd('colorscheme gruvbox')

-- require("tokyonight").setup({
--   style = "night"
-- })
-- vim.cmd('colorscheme tokyonight')

-- vim.cmd('colorscheme embark')


-- vim.o.background = "light"
vim.cmd('colorscheme neobones')

-- TEMP - this can be done wayyyy better!
local function colorCursorForDark()
    -- TODO - make this lua
    vim.cmd([[
    hi Cursor guifg=#F2EBA8 guibg=#F2EBA8
    hi Cursor2 guifg=#F2EBA8 guibg=#F2EBA8
    set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
    ]])
end

local function colorCursorForLight()
    vim.cmd([[
    hi Cursor guifg=#8A8A8A guibg=#8A8A8A
    hi Cursor2 guifg=#8A8A8A guibg=#8A8A8A
    set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
    ]])
end

colorCursorForDark()

vim.keymap.set('n', '<leader>cc', function ()
    if vim.o.background == 'dark' then
       vim.o.background = 'light'
       colorCursorForLight()
    else
       vim.o.background = 'dark'
       colorCursorForDark()
    end
end)
