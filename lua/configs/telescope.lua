require('telescope').setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = require('telescope.actions').move_selection_next,
				["<C-k>"] = require('telescope.actions').move_selection_previous,
			}
		}
	}
})

vim.cmd([[
	nnoremap <leader>f <cmd>Telescope find_files<cr>
	nnoremap <leader>g <cmd>Telescope live_grep<cr>
	nnoremap <leader>b <cmd>Telescope buffers<cr>
	nnoremap <leader>h <cmd>Telescope help_tags<cr>
]])
