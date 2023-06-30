local bootstrap = false
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    bootstrap = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable", "--depth=1",
        "https://github.com/folke/lazy.nvim", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('plugin.lazy')
