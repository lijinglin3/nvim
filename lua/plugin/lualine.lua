require('lualine').setup({
    options = { globalstatus = true },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', newfile_status = true, path = 3 } },
        lualine_x = { 'searchcount' },
        lualine_y = { 'encoding', 'fileformat', 'filetype' },
        lualine_z = { 'progress', 'location' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = { { 'buffers', show_filename_only = false, mode = 2 } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = { { 'windows', mode = 2 } },
        lualine_y = { { 'tabs', mode = 2 } },
        lualine_z = { 'hostname' },
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
