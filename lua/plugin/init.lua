local bootstrap = false
local packer_repo = 'https://github.com/wbthomason/packer.nvim'
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
    bootstrap = vim.fn.system({ 'git', 'clone', '--depth', '1', packer_repo, install_path })
end

require('plugin.packer')

if bootstrap then
    require('packer').sync()
else
    local ok, _ = pcall(require, 'packer_compiled')
    if not ok then
        vim.notify('Error requiring packer_compiled.lua: run PackerSync to fix!')
    end
end
