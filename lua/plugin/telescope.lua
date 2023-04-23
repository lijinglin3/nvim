local telescope = require('telescope')
local extensions = telescope.extensions
local builtin = require('telescope.builtin')
local layout = require('telescope.actions.layout')
local opts = { noremap = true }
local utils = require('telescope._extensions.project.utils')

local open_project = function()
    extensions.project.project { display_type = 'full' }
end

local find_command = function()
    if 1 == vim.fn.executable 'fd' then
        return 'fd'
    elseif 1 == vim.fn.executable 'fdfind' then
        return 'fdfind'
    end
end

local find = find_command()

local open_in_nvim_tree = function(project_path)
    local tree = require('nvim-tree.api').tree
    tree.change_root(project_path)
    tree.open(project_path)
    vim.cmd('wincmd p')
end

utils.open_in_nvim_tree = open_in_nvim_tree

telescope.setup({
    defaults = {
        sorting_strategy = 'ascending',
        layout_strategy = 'vertical',
        layout_config = { vertical = { prompt_position = 'top', width = 0.9, mirror = true } },
        path_display = { truncate = 100 },
        dynamic_preview_title = true,
        mappings = {
            i = {
                ['<C-j>'] = require('telescope.actions').move_selection_next,
                ['<C-k>'] = require('telescope.actions').move_selection_previous,
                ['<C-p>'] = layout.toggle_preview,
            }
        }
    },
    pickers = {
        find_files = {
            find_command = {
                find, '--type', 'file', '--type', 'symlink', '--strip-cwd-prefix',
                '--unrestricted', '--exclude', '.git', '--ignore-file', '.ignore',
            }
        }
    },
    extensions = {
        fzf = { override_generic_sorter = true, override_file_sorter = true },
        project = { hidden_files = true, sync_with_nvim_tree = true },
    },
})

telescope.load_extension('live_grep_args')
telescope.load_extension('file_browser')
telescope.load_extension('frecency')
telescope.load_extension('project')
telescope.load_extension('fzf')
telescope.load_extension('dap')

vim.keymap.set('n', '<leader>a', builtin.builtin, opts)
vim.keymap.set('n', '<leader>f', builtin.find_files, opts)
vim.keymap.set('n', '<leader>b', builtin.buffers, opts)
vim.keymap.set('n', '<leader>d', builtin.git_status, opts)

vim.keymap.set('n', '<leader>p', open_project, opts)
vim.keymap.set('n', '<leader>g', extensions.live_grep_args.live_grep_args, opts)
vim.keymap.set('n', '<leader>F', extensions.frecency.frecency, opts)
vim.keymap.set('n', '<leader>l', extensions.file_browser.file_browser, opts)

vim.keymap.set('n', '<leader>dC', extensions.dap.commands, opts)
vim.keymap.set('n', '<leader>dc', extensions.dap.configurations, opts)
vim.keymap.set('n', '<leader>dl', extensions.dap.list_breakpoints, opts)
vim.keymap.set('n', '<leader>dv', extensions.dap.variables, opts)
vim.keymap.set('n', '<leader>df', extensions.dap.frames, opts)

-- https://github.com/nvim-telescope/telescope.nvim/issues/559
vim.api.nvim_create_autocmd('BufRead', {
    callback = function()
        vim.api.nvim_create_autocmd('BufWinEnter', { once = true, command = 'normal! zx' })
    end
})

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function() if vim.fn.argc() == 0 then open_project() end end
})

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv()[1]) ~= 0 then
            builtin.find_files({ cwd = vim.fn.argv()[1] })
        end
    end
})
