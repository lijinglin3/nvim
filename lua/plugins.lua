local fn = vim.fn
local packer_repo = 'https://github.com/wbthomason/packer.nvim'
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', packer_repo, install_path})
end

require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}
  use {'gruvbox-community/gruvbox'}
  use {'voldikss/vim-floaterm'}
  use {'airblade/vim-gitgutter'}
  use {'kevinhwang91/nvim-bqf'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'vim-airline/vim-airline', requires = 'vim-airline/vim-airline-themes'}
  use {'nvim-neo-tree/neo-tree.nvim', branch = 'v2.x', requires = {'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim'}}
  use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'}
  use {'fatih/vim-go', run = ':GoUpdateBinaries'}
  use {'neoclide/coc.nvim', branch = 'release'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)

require('neo-tree').setup({
  close_if_last_window = true
})

