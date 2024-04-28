# Neovim

### Theming

This setup uses rose pine with the experimental noice UI.

### Plugins

- lazy.nvim
- nvim-dap-ui 
    - nvim-dap
    - nvim-dap-python
- neodev.nvim 
- nvim-treesitter 
- nvim-lspconfig 
- cmp-nvim-lsp 
    - LuaSnip 
    - friendly-snippets 
    - cmp-buffer 
    - cmp-path 
    - cmp_luasnip 
    - nvim-cmp 
    - lspkind.nvim 
- mason.nvim 
    - mason-lspconfig.nvim 
- Comment.nvim
- nvim-autopairs 
- nvim-lint 
- formatter.nvim 
- fidget.nvim 
- oil.nvim
    - nvim-web-devicons 
- telescope.nvim
    - telescope-fzf-native.nvim 
    - fzf-lua 
- flash.nvim
- harpoon
- nvim-spectre 
- neogit 
    - diffview.nvim 
- rose-pine 
- gitsigns.nvim 
- lualine.nvim
- noice.nvim 
    - nui.nvim 
    - nvim-notify 
- todo-comments.nvim 
- zen-mode.nvim
- plenary.nvim 

### Setup

This setup requires `0.9.x` or above. Durign your first open,
Lazy (the package manager) will install itself if not found.
If you want to use dap, you will need the debugger tools, such as
- [debugpy for python](https://github.com/microsoft/debugpy)
- [codelldb for rust](https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb))
