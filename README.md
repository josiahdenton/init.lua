# Neovim

### Install

- install nvim, for macOS you can run `brew install neovim`
    - run `brew install luajit` as well for neorg dependency
    - run `brew install gnu-sed` for spectre dependency

### Theming

This setup uses rose pine with the experimental noice UI.

### Debugging

#### Python

To debug python, dap-python comes with many defaults. To run
any module that imports relative, you must create an .nvim.lua file, e.g.
```lua
table.insert(require("dap").configurations.python, {
    type = "python",
    request = "launch",
    name = "Run Module",
    console = "integratedTerminal",
    module = "src.adapter.client", -- edit this to the module you are debugging
    cwd = "${workspaceFolder}",
    justMyCode = false,
})
```

### Plugins

- lazy.nvim
- nvim-dap-ui 
    - nvim-dap
    - nvim-dap-python
    - nvim-dap-go
    - nvim-nio
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

This setup requires `0.10.x` or above. During your first open,
Lazy (the package manager) will install itself if not found.
If you want to use dap, you will need the debugger tools, such as
- [debugpy for python](https://github.com/microsoft/debugpy)
- [codelldb for rust](https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb))
