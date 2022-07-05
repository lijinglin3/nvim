filetype plugin indent on " 开启文件类型检查，并且载入与该类型对应的缩进规则
syntax enable " 语法高亮
set ai "Auto indent
" set autochdir " 自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。该配置可以将工作目录自动切换到，正在编辑的文件的目录
set autoindent " 自动缩进
set autoread " 打开文件监视。如果在编辑过程中文件发生外部改变，就会发出提示
set background=dark
set backspace=eol,start,indent
set cindent
set cmdheight=1
set cursorline " 光标所在的当前行高亮
set encoding=utf-8 " 使用 utf-8 编码
set expandtab " 由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格
set ffs=unix,dos,mac " Use Unix as the standard file type
set foldcolumn=1 " Add a bit extra margin to the left
set foldmethod=syntax
set foldnestmax=32
set hid " A buffer becomes hidden when it is abandoned
set history=10000 " Vim 需要记住多少次历史操作
set hlsearch " 搜索时，高亮显示匹配结果
set ignorecase " 搜索时忽略大小写
set incsearch " 输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
set langmenu=en_US.UTF-8
set laststatus=2 " 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示
set lazyredraw " Don't redraw while executing macros (good performance config)
set linebreak " 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行
set list
set listchars=eol:$,tab:>-,space:·,trail:~,nbsp:×,extends:>,precedes:<
set magic " For regular expressions turn magic on
set mouse-=a " 禁止使用鼠标
set nobackup " 不创建备份文件。默认情况下，文件保存时，会额外创建一个备份文件，它的文件名是在原文件名的末尾，再添加一个波浪号（〜）
set nocompatible " 不与 vi 兼容
set noerrorbells " 出错时，不要发出响声
set noexpandtab
set nofoldenable " 打开文件时不折叠
set noswapfile " 不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是 . 结尾是 .swp
set nowb
set number " 显示行号
set ruler " 在状态栏显示光标的当前位置（位于哪一行哪一列）
" set relativenumber " 显示光标所在的当前行的行号，其他行都为相对于该行的相对行号
set scrolloff=5 " 垂直滚动时，光标距离顶部/底部的位置（单位：行）
set selection=inclusive
set selectmode=mouse,key
set shiftwidth=4 " 每一级缩进的字符数
set showcmd " 命令模式下，在底部显示当前键入的指令
set showmatch " 显示括号匹配
set showmode " 在底部显示当前处于命令模式还是插入模式
set si "Smart indent
set sidescrolloff=15 " 水平滚动时，光标距离行首或行尾的位置（单位：字符）
set smartcase " 如果同时打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；其他情况都是大小写不敏感
set smartindent
set smarttab
set so=10
set softtabstop=4 " Tab 转为多少个空格
" set spell spelllang=en_us " 打开英语单词的拼写检查
set t_Co=256 " 启用 256 色
set tabstop=4 " 按下 Tab 键时 Vim 显示的空格数
set termencoding=utf-8
set termguicolors " 开启 24bit 颜色
set textwidth=80 " 设置行宽，即一行显示多少个字符
set title
set undodir=~/.cache/nvim//
set undofile " 保留撤销历史
set visualbell " 出错时，发出视觉提示，通常是屏幕闪烁
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildmenu " 命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set wildmode=longest:full,list:full
set whichwrap+=<,>,h,l
set wrap " 自动折行，即太长的行分成几行显示
set wrapmargin=2 " 指定折行处与编辑窗口的右边缘之间空出的字符数

if has('mac')
    set rtp+=/opt/homebrew/opt/fzf,/usr/local/opt/fzf
endif
if has('unix')
    if filereadable('/usr/share/doc/fzf/examples/fzf.vim')
        source /usr/share/doc/fzf/examples/fzf.vim
    endif
endif

let mapleader = "\<Space>"

nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>c :tabclose<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <DELETE>
tnoremap <ESC> <C-\><C-n>
