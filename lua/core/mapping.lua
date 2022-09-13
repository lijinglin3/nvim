local opts = { noremap = true }

vim.keymap.set('n', '<leader>e', ':e!<CR>', opts)
vim.keymap.set('n', '<leader>w', ':w!<CR>', opts)
vim.keymap.set('n', '<leader>q', ':q!<CR>', opts)
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('i', '<C-h>', '<Left>', opts)
vim.keymap.set('i', '<C-j>', '<Down>', opts)
vim.keymap.set('i', '<C-k>', '<Up>', opts)
vim.keymap.set('i', '<C-l>', '<Right>', opts)
vim.keymap.set('i', '<C-d>', '<DELETE>', opts)
