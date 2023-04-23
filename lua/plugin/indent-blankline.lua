require('indent_blankline').setup({
    use_treesitter = true,
    show_trailing_blankline_indent = false
})

for _, keymap in pairs({ 'zo', 'zO', 'zc', 'zC', 'za', 'zA', 'zv', 'zx', 'zX', 'zm', 'zM', 'zr', 'zR' }) do
    vim.keymap.set('n', keymap, keymap .. '<CMD>IndentBlanklineRefresh<CR>', { noremap = true, silent = true })
end
