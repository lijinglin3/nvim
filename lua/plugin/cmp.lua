local cmp = require('cmp')
local types = require('cmp.types')

local disable = function(fallback)
    cmp.close()
    fallback()
end

cmp.setup({
    snippet = {
        expand = function(args) vim.fn['vsnip#anonymous'](args.body) end
    },
    mapping = cmp.mapping.preset.insert({
        ['<Down>'] = cmp.mapping(disable, { 'i' }),
        ['<Up>'] = cmp.mapping(disable, { 'i' }),
        ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-j>'] = { i = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }) },
        ['<C-k>'] = { i = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }) },
    }),
    sources = cmp.config.sources(
        { { name = 'nvim_lsp' } },
        { { name = 'buffer' }, { name = 'path' } }
    )
})

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
