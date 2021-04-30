" gruvbox
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" nerdtree
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd BufEnter * lcd %:p:h
autocmd BufWinEnter * silent NERDTreeMirror

nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

let NERDTreeShowHidden = 1
let g:NERDSpaceDelims = 1

" vim-go
au FileType go nmap <C-S-d> :GoDeclsDir<CR>
au FileType go nmap <C-d> :GoDecls<CR>
au FileType go nmap <C-i> :GoImplements<CR>
au FileType go nmap <C-b> :GoReferrers<CR>

let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_list_type = "quickfix"
let g:go_autodetect_gopath = 1
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split = 2
