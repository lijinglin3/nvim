" gruvbox
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

" vim-airline
let g:airline_theme = "gruvbox"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" LeaderF
let g:Lf_ShortcutF = '<leader>f'
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShowDevIcons = 0

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

" floatterm
let g:floaterm_wintype = 'split'
let g:floaterm_position = 'belowright'
let g:floaterm_height = 0.3
let g:floaterm_keymap_toggle = '<F12>'

" vim-go
au FileType go nmap gR :GoRename<CR>
au FileType go nmap gr :GoReferrers<CR>
au FileType go nmap gp :GoDefPop<CR>
au FileType go nmap gf :GoFmt<CR>
au FileType go nmap gi :GoImplements<CR>
au FileType go nmap gl :GoDecls<CR>
au FileType go nmap gL :GoDeclsDir<CR>

let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_list_type = "quickfix"
let g:go_autodetect_gopath = 1
let g:go_version_warning = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:godef_split = 2
