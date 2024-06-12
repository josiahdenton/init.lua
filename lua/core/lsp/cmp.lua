local M = {}

M.setup = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup()

    cmp.setup({
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        completion = {
            completeopt = 'menu,menuone',
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },
        mapping = cmp.mapping.preset.insert {
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['/'] = cmp.mapping.close(),
            ['<C-Space>'] = cmp.mapping.complete {},
            -- ['<CR>'] = cmp.mapping.confirm { -- will rely on C-y for this...
            --     behavior = cmp.ConfirmBehavior.Replace,
            --     select = true,
            -- },
            ['<Tab>'] = cmp.mapping(function(fallback)
                -- local copilot = require('copilot.suggestion')

                -- only supported in copilot.lua
                -- if copilot.is_visible() then
                --     copilot.accept()
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        },
        sources = cmp.config.sources({
            { name = "lazydev", group_index = 0 }, -- set group index to 0 to skip loading LuaLS completions
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
        }),
        formatting = {
            format = function(entry, vim_item)
                if vim.tbl_contains({ 'path' }, entry.source.name) then
                    local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
                    if icon then
                        vim_item.kind = icon
                        vim_item.kind_hl_group = hl_group
                        return vim_item
                    end
                end
                return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
            end
        }
    })
end

return M
