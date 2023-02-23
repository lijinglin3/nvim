require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'vim', 'lua', 'go', 'gomod', 'gosum', 'rust', 'c', 'cpp', 'python', 'bash',
        'json', 'yaml', 'diff', 'dockerfile', 'sql'
    },
    sync_install = true,
    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
