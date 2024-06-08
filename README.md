# Neovim

### Prerequisites

- install nvim, for macOS you can run `brew install neovim`
    - run `brew install luajit` as well for neorg dependency
    - run `brew install gnu-sed` for spectre dependency
    - run `brew install gcc-12` for neorg

### Theming

This setup uses rose pine with the experimental noice UI.

I use [this background](https://codeberg.org/nine_point_eight/config-files/src/branch/master/config-files/wallpapers/everforest-conifer.jpg) and iterm2 with opacity 10%

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

### Setup

This setup requires `0.10.x` or above. During your first open,
Lazy (the package manager) will install itself if not found.
If you want to use dap, you will need the debugger tools, such as
- [debugpy for python](https://github.com/microsoft/debugpy)
- [codelldb for rust](https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb))
