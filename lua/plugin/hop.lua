local hop = require('hop')
local hint = require('hop.hint')
local AFTER = hint.HintDirection.AFTER_CURSOR
local BEFORE = hint.HintDirection.BEFORE_CURSOR

local scope = function(direction)
    return { direction = direction, current_line_only = true }
end

hop.setup()

local opts = { noremap = true }
vim.keymap.set('n', 'f', function() hop.hint_words(scope(AFTER)) end, opts)
vim.keymap.set('n', 't', function() hop.hint_words(scope(BEFORE)) end, opts)
vim.keymap.set('n', 'F', hop.hint_patterns, opts)
vim.keymap.set('n', 'T', hop.hint_words, opts)
