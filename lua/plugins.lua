-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- file management, git and editing
    use { 'mbbill/undotree' }
    use { 'tpope/vim-fugitive' }
    use { 'akinsho/git-conflict.nvim', tag = "*", config = function()
        require('git-conflict').setup()
    end }
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    }

    use { 'nvim-telescope/telescope-file-browser.nvim' }
    use { 'nvim-telescope/telescope-project.nvim' }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- lint, format, warn
    use { 'jose-elias-alvarez/null-ls.nvim' }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- movement
    use { 'ggandor/leap.nvim' }
    use { 'theprimeagen/harpoon' }
    use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
    use { 'simrat39/symbols-outline.nvim' }

    -- debugging
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { 'mfussenegger/nvim-dap-python' }

    -- theming
    use { 'folke/zen-mode.nvim' }
    use { 'embark-theme/vim', as = 'embark' }
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use { 'folke/twilight.nvim' }
    use { "mcchrish/zenbones.nvim", requires = "rktjmp/lush.nvim" }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }

    -- tree sitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- quality of life
    use { 'windwp/nvim-ts-autotag' }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
            -- extended auto complete
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- note taking system
    use {
        "nvim-neorg/neorg",
        run = ":Neorg sync-parsers",
        requires = "nvim-lua/plenary.nvim",
    }
end)
