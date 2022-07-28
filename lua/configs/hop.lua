require('hop').setup()

local opts = { noremap = true }
vim.keymap.set('n', 'f', ':HopWordCurrentLineAC<CR>', opts)
vim.keymap.set('n', 't', ':HopWordCurrentLineBC<CR>', opts)
vim.keymap.set('n', 'F', ':HopPattern<CR>', opts)
vim.keymap.set('n', 'T', ':HopWord<CR>', opts)
