require('lualine').setup({
    options = {
        globalstatus = true,
        disabled_filetypes = {
            statusline = {},
            winbar = { '', 'NvimTree' }
        }
    },
    tabline = {
        lualine_a = { { 'buffers', show_filename_only = false, mode = 2 } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { { 'filename', newfile_status = true, path = 3 } },
        lualine_x = {},
        lualine_y = { 'datetime', 'hostname' },
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { { 'filename', newfile_status = true, path = 3 } },
        lualine_x = {},
        lualine_y = { 'datetime', 'hostname' },
        lualine_z = {},
    },
    winbar = {
        lualine_a = {},
        lualine_b = { { 'filename', newfile_status = true, path = 3 }, 'location', 'progress' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { 'searchcount', 'selectioncount', 'diff', 'diagnostics', 'encoding', 'filesize', 'fileformat',
            { 'filetype', icon_only = true } },
        lualine_z = {},
    },
    inactive_winbar = {
        lualine_a = {},
        lualine_b = { { 'filename', newfile_status = true, path = 3 }, 'location', 'progress' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { 'searchcount', 'selectioncount', 'diff', 'diagnostics', 'encoding', 'filesize', 'fileformat',
            { 'filetype', icon_only = true } },
        lualine_z = {},
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
