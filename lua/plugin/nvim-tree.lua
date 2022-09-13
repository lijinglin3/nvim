local tree = require('nvim-tree')

tree.setup({
    disable_netrw = true,
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    update_focused_file = { enable = true },
    diagnostics = { enable = true, show_on_dirs = true },
    git = { ignore = false },
    view = { width = 50, number = true },
    renderer = {
        full_name = true,
        highlight_git = true,
        highlight_opened_files = 'all',
        icons = { git_placement = 'signcolumn' }
    },
})

vim.keymap.set('n', '<leader>t', function() tree.toggle(true, true) end, { noremap = true })
vim.api.nvim_create_autocmd('DirChanged', { callback = function() tree.open() vim.cmd('wincmd p') end })
