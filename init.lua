local fn = vim.fn
local packer_repo = 'https://github.com/wbthomason/packer.nvim'
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', packer_repo, install_path})
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

require('plugins')

if packer_bootstrap then
  require('packer').sync()
else
  vim.cmd([[source ~/.config/nvim/common.vim]])

  local status, _ = pcall(require, 'packer_compiled')
  if not status then
    vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
  end
end

