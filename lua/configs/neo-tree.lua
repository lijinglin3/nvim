require('neo-tree').setup({
	close_if_last_window = true,
	filesystem = {
		use_libuv_file_watcher = true
	}
})

vim.cmd([[
	nnoremap tt :NeoTreeShowToggle<CR>
	nnoremap tr :NeoTreeReveal<CR>
	nnoremap tf :NeoTreeFocus<CR>
]])
