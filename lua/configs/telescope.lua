local find_command = (function()
	if 1 == vim.fn.executable 'fd' then
		return 'fd'
	elseif 1 == vim.fn.executable 'fdfind' then
		return 'fdfind'
	end
end)()

require('telescope').setup({
	defaults = {
		vimgrep_arguments = {
			'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--trim',
			'--no-ignore', '--hidden', '--glob', '!.git', '--ignore-file', '.ignore',
		},
		sorting_strategy = 'ascending',
		layout_config = { horizontal = { prompt_position = 'top' } },
		mappings = {
			i = {
				['<C-j>'] = require('telescope.actions').move_selection_next,
				['<C-k>'] = require('telescope.actions').move_selection_previous,
			}
		}
	},
	pickers = {
		find_files = {
			find_command = {
				find_command, '--type', 'file', '--type', 'symlink', '--strip-cwd-prefix',
				'--unrestricted', '--exclude', '.git', '--ignore-file', '.ignore',
			}
		}
	},
	extensions = {
		fzf = {
			override_generic_sorter = true,
			override_file_sorter = true,
		},
	},
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('frecency')
require('telescope').load_extension('project')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('dap')

local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions
local opts = { noremap = true }

vim.keymap.set('n', '<leader>a', builtin.builtin, opts)
vim.keymap.set('n', '<leader>f', builtin.find_files, opts)
vim.keymap.set('n', '<leader>g', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>b', builtin.buffers, opts)

vim.keymap.set('n', '<leader>F', extensions.frecency.frecency, opts)
vim.keymap.set('n', '<leader>l', extensions.file_browser.file_browser, opts)
vim.keymap.set('n', '<leader>p', function() extensions.project.project { display_type = 'full' } end, opts)

vim.keymap.set('n', '<leader>dC', extensions.dap.commands, opts)
vim.keymap.set('n', '<leader>dc', extensions.dap.configurations, opts)
vim.keymap.set('n', '<leader>dl', extensions.dap.list_breakpoints, opts)
vim.keymap.set('n', '<leader>dv', extensions.dap.variables, opts)
vim.keymap.set('n', '<leader>df', extensions.dap.frames, opts)
