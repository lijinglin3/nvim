local gs = require('gitsigns')

gs.setup({
    numhl = true,
    yadm = {
        enable = true
    },
    on_attach = function(bufnr)
        local opts = { buffer = bufnr, noremap = true }
        vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end, opts)
        vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, opts)
        vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, opts)
        vim.keymap.set('n', '<leader>hs', gs.stage_hunk, opts)
        vim.keymap.set('n', '<leader>hr', gs.reset_hunk, opts)
        vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, opts)
        vim.keymap.set('n', '<leader>hp', gs.preview_hunk, opts)
        vim.keymap.set('n', '<leader>hd', gs.diffthis, opts)

        opts.expr = true
        vim.keymap.set('n', ']]', function()
            if vim.wo.diff then return ']]' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, opts)

        vim.keymap.set('n', '[[', function()
            if vim.wo.diff then return '[[' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, opts)
    end
})
