require('lualine').setup({
    options = { globalstatus = true },
    tabline = {
        lualine_a = { 'hostname' },
        lualine_b = { { 'buffers', show_filename_only = false, mode = 2 } },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', newfile_status = true, path = 3 } },
        lualine_x = { 'searchcount', 'selectioncount' },
        lualine_y = { 'encoding', 'fileformat', 'filetype', 'filesize' },
        lualine_z = { 'progress', 'location' },
    },
    extensions = { 'nvim-tree', 'nvim-dap-ui', 'quickfix', 'toggleterm' },
})

local opts = { noremap = true }
vim.keymap.set('n', '<leader>1', '<CMD>LualineBuffersJump! 1<CR>', opts)
vim.keymap.set('n', '<leader>2', '<CMD>LualineBuffersJump! 2<CR>', opts)
vim.keymap.set('n', '<leader>3', '<CMD>LualineBuffersJump! 3<CR>', opts)
vim.keymap.set('n', '<leader>4', '<CMD>LualineBuffersJump! 4<CR>', opts)
vim.keymap.set('n', '<leader>5', '<CMD>LualineBuffersJump! 5<CR>', opts)
vim.keymap.set('n', '<leader>6', '<CMD>LualineBuffersJump! 6<CR>', opts)
vim.keymap.set('n', '<leader>7', '<CMD>LualineBuffersJump! 7<CR>', opts)
vim.keymap.set('n', '<leader>8', '<CMD>LualineBuffersJump! 8<CR>', opts)
vim.keymap.set('n', '<leader>9', '<CMD>LualineBuffersJump! 9<CR>', opts)
vim.keymap.set('n', '<leader>0', '<CMD>LualineBuffersJump! $<CR>', opts)
