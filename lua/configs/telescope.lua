require('telescope').setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_config = {horizontal = {prompt_position = 'top'}},
		mappings = {
			i = {
				["<C-j>"] = require('telescope.actions').move_selection_next,
				["<C-k>"] = require('telescope.actions').move_selection_previous,
			}
		}
	},
	pickers = {
		find_files = {
			find_command = {
				'fd', '--type', 'file', '--type', 'symlink', '--strip-cwd-prefix', '--unrestricted',
				'--exclude', '.git', '--ignore-file', '.fdignore',
			}
		}
	}
})

require('telescope').load_extension("frecency")
require('telescope').load_extension('project')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('dap')
require('telescope').load_extension('aerial')

local opts = {noremap = true}
vim.api.nvim_set_keymap("n", "<leader>B", ":Telescope builtin<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>g", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>F", ":Telescope frecency<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>p", ":Telescope project<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>l", ":Telescope file_browser<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>o", ":Telescope aerial<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>dC", ":Telescope dap commands<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dc", ":Telescope dap configurations<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dl", ":Telescope dap list_breakpoints<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dv", ":Telescope dap variables<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>df", ":Telescope dap frames<CR>", opts)
