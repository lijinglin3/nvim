require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'vim', 'vimdoc', 'query', 'json', 'yaml', 'diff', 'dockerfile', 'sql',
        'lua', 'go', 'gomod', 'gosum', 'rust', 'c', 'cpp', 'python', 'bash',
    },
    sync_install = true,
    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
