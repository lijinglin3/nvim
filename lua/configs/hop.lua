require('hop').setup()

local opts = { noremap = true }
vim.keymap.set('n', 'f', ':HopWordCurrentLine<CR>', opts)
vim.keymap.set('n', 'F', ':HopPattern<CR>', opts)
