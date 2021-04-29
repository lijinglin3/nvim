" gruvbox
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ctrlp
nnoremap <leader>p :CtrlPMixed<CR>

" nerdtree
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>t :NERDTreeToggle<CR>

let g:NERDSpaceDelims = 1

" vim-go
au FileType go nmap <Leader>b :GoDecls<CR>
au FileType go nmap <Leader>v :GoVet<CR>
au FileType go nmap <leader>i :GoImplements<CR>
