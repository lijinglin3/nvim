require('nvim-tree').setup({
	disable_netrw = true,
	sync_root_with_cwd = true,
	reload_on_bufenter = true,
	update_focused_file = { enable = true },
	diagnostics = { enable = true, show_on_dirs = true },
	git = { ignore = false },
	view = {
		centralize_selection = true,
		width = 50,
		number = true,
	},
	renderer = {
		full_name = true,
		highlight_git = true,
		highlight_opened_files = 'all',
		icons = { git_placement = 'signcolumn' }
	},
})

local opts = { noremap = true }
vim.keymap.set('n', '<leader>t', function() require('nvim-tree').toggle(false, true) end, opts)
