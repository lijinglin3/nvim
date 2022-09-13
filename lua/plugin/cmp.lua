local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args) vim.fn["vsnip#anonymous"](args.body) end
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-j>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-k>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources(
        { { name = 'nvim_lsp' } },
        { { name = 'buffer' }, { name = 'path' } }
    )
})

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
