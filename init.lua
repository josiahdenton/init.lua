vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("install")

require("core.settings")

require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
    },
    rocks = {
        enabled = false
    }
})

-- TODO: move lsp setup to lazy spec
require("core.lsp").setup()
