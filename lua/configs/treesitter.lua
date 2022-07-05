require('nvim-treesitter.configs').setup({
	ensure_installed = {"c" ,"cpp", "go", "json", "lua", "python", "rust"},
	sync_install = true,
	highlight = {enable = true},
	incremental_selection = {enable = true},
	indent = {enable = true},
})

vim.cmd([[
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
]])
