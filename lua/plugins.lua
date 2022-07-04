return require('packer').startup({
  function(use)
    use {
      'nvim-neo-tree/neo-tree.nvim', branch = 'v2.x', config = [[require('configs.neo-tree')]],
      requires = {'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim'}
    }
    use {'wbthomason/packer.nvim'}
    use {'gruvbox-community/gruvbox'}
    use {'voldikss/vim-floaterm'}
    use {'airblade/vim-gitgutter'}
    use {'kevinhwang91/nvim-bqf'}
    use {'vim-airline/vim-airline', requires = 'vim-airline/vim-airline-themes'}
    use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'}
    use {'neoclide/coc.nvim', branch = 'release'}
    use {'fatih/vim-go', run = ':GoUpdateBinaries', requires = 'junegunn/fzf.vim'}
  end,
  config = {
    max_jobs = 16,
    compile_path = require('packer.util').join_paths(vim.fn.stdpath('data'), 'site', 'lua', 'packer_compiled.lua'),
  }
})

