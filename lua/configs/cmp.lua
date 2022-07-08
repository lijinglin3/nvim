local cmp = require('cmp')

cmp.setup({
	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{name = 'nvim_lsp'},
	}, {
		{name = 'buffer'},
		{name = 'path'},
	})
})

vim.opt.completeopt = { "menu", "menuone", "noselect" }
