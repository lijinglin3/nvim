local tree = require('nvim-tree')
local api = require('nvim-tree.api')

tree.setup({
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    update_focused_file = { enable = true },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        severity = { min = vim.diagnostic.severity.ERROR }
    },
    git = { ignore = false },
    modified = { enable = true },
    view = { width = 50, number = true },
    renderer = {
        full_name = true,
        highlight_git = true,
        highlight_opened_files = 'all',
        icons = { git_placement = 'signcolumn' }
    },
})

vim.keymap.set('n', '<leader>t', function() api.tree.toggle() end, { noremap = true })
