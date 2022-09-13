vim.api.nvim_create_augroup("remember_folds", { clear = true })
vim.api.nvim_create_autocmd("BufWinLeave", { group = 'remember_folds', pattern = "*.*", command = "mkview" })
vim.api.nvim_create_autocmd("BufWinEnter", { group = 'remember_folds', pattern = "*.*", command = "silent! loadview" })

vim.api.nvim_create_augroup('bufcheck', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', { group = 'bufcheck', pattern = '*',
    callback = function() vim.highlight.on_yank { timeout = 500 } end
})
vim.api.nvim_create_autocmd('TextYankPost', { group = 'bufcheck', pattern = '*',
    callback = function() vim.fn.setreg('+', vim.fn.getreg('*')) end
})
