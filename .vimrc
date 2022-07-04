" install vim-plug if not
let g:bootstrap = empty(glob('~/.vim/autoload/plug.vim'))
if bootstrap
  silent execute '!curl -sfLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugUpdate --sync
endif

" install plugins
call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'voldikss/vim-floaterm'
Plug 'Yggdroot/LeaderF', {'do': ':LeaderfInstallCExtension'}
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

if !bootstrap
  source ~/.config/nvim/configs/common-basic.vim
  source ~/.config/nvim/configs/common-plugins.vim
  source ~/.config/nvim/configs/special-vim.vim
endif
