require('nvim-treesitter.configs').setup({
	ensure_installed = { 'c', 'cpp', 'go', 'json', 'lua', 'python', 'rust' },
	sync_install = true,
	highlight = { enable = true },
	incremental_selection = { enable = true },
	indent = { enable = true },
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- https://github.com/nvim-telescope/telescope.nvim/issues/559
vim.api.nvim_create_autocmd('BufRead', {
	callback = function()
		vim.api.nvim_create_autocmd('BufWinEnter', {
			once = true,
			command = 'normal! zx'
		})
	end
})
