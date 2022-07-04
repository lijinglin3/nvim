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

" floatterm
let g:floaterm_wintype = 'split'
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

let g:go_fmt_command = "goimports"
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
