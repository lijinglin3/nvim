local gs = require('gitsigns')

gs.setup({
    numhl = true,
    on_attach = function(bufnr)
        local opts = { buffer = bufnr, noremap = true }
        vim.keymap.set({ 'n', 'v' }, '<leader>hs', gs.stage_hunk, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>hr', gs.reset_hunk, opts)
        vim.keymap.set('n', '<leader>hS', gs.stage_buffer, opts)
        vim.keymap.set('n', '<leader>hR', gs.reset_buffer, opts)
        vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, opts)
        vim.keymap.set('n', '<leader>hp', gs.preview_hunk, opts)
        vim.keymap.set('n', '<leader>hd', gs.diffthis, opts)
        vim.keymap.set('n', '<leader>hD', gs.toggle_deleted, opts)
        vim.keymap.set('n', '<leader>hb', gs.toggle_current_line_blame, opts)
        vim.keymap.set('n', '<leader>hB', function() gs.blame_line { full = true } end, opts)

        opts.expr = true
        vim.keymap.set('n', ']]', function()
            if vim.wo.diff then return ']]' end
            vim.schedule(function() gs.next_hunk() end)
            return '<ignore>'
        end, opts)

        vim.keymap.set('n', '[[', function()
            if vim.wo.diff then return '[[' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<ignore>'
        end, opts)
    end
})
