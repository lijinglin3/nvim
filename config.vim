colorscheme gruvbox
filetype plugin indent on
syntax enable
set autochdir
set autoindent
set background=dark
set backup
set backupdir=~/.vim/tmp//
set cindent
set cursorline
set directory=~/.vim/tmp//
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set magic
set number
set ruler
set selection=inclusive
set selectmode=mouse,key
set shiftwidth=4
set showcmd
set showmode
set smartcase
set smartindent
set smarttab
set softtabstop=4
set spell spelllang=en_us
set swapfile
set tabstop=4
set termguicolors
set title
set undodir=~/.vim/tmp//
set undofile
set wildmenu
set wildmode=longest:full,list:full
set wrap

map <C-n> :NERDTreeToggle<CR>

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
