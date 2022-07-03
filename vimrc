" install vim-plug if not
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" import common configs
source ~/.vim/common.vim

" nerdtree
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

nnoremap tt :NERDTreeToggle<CR>
nnoremap tf :NERDTreeFind<CR>

let g:NERDTreeShowHidden = 1
let g:NERDSpaceDelims = 1

