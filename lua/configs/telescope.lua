local telescope = require('telescope')
local extensions = telescope.extensions
local builtin = require('telescope.builtin')
local opts = { noremap = true }

local open_project = function()
	extensions.project.project { display_type = 'full' }
end

local find_command = (function()
	if 1 == vim.fn.executable 'fd' then
		return 'fd'
	elseif 1 == vim.fn.executable 'fdfind' then
		return 'fdfind'
	end
end)()

telescope.setup({
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

telescope.load_extension('fzf')
telescope.load_extension('frecency')
telescope.load_extension('project')
telescope.load_extension('file_browser')
telescope.load_extension('dap')

vim.keymap.set('n', '<leader>a', builtin.builtin, opts)
vim.keymap.set('n', '<leader>f', builtin.find_files, opts)
vim.keymap.set('n', '<leader>g', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>b', builtin.buffers, opts)
vim.keymap.set('n', '<leader>s', builtin.git_status, opts)

vim.keymap.set('n', '<leader>p', open_project, opts)
vim.keymap.set('n', '<leader>F', extensions.frecency.frecency, opts)
vim.keymap.set('n', '<leader>l', extensions.file_browser.file_browser, opts)

vim.keymap.set('n', '<leader>dC', extensions.dap.commands, opts)
vim.keymap.set('n', '<leader>dc', extensions.dap.configurations, opts)
vim.keymap.set('n', '<leader>dl', extensions.dap.list_breakpoints, opts)
vim.keymap.set('n', '<leader>dv', extensions.dap.variables, opts)
vim.keymap.set('n', '<leader>df', extensions.dap.frames, opts)

vim.api.nvim_create_autocmd('VimEnter', { callback = function()
	if vim.fn.argc() == 0 then open_project() end
end })

vim.api.nvim_create_autocmd('VimEnter', { callback = function()
	if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv()[1]) ~= 0 then
		builtin.find_files({ cwd = vim.fn.argv()[1] })
	end
end })
