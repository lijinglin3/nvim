local setting = {}

setting.g = {
    mapleader                = " ",
    loaded_gzip              = 1,
    loaded_zip               = 1,
    loaded_zipPlugin         = 1,
    loaded_tar               = 1,
    loaded_tarPlugin         = 1,
    loaded_getscript         = 1,
    loaded_getscriptPlugin   = 1,
    loaded_vimball           = 1,
    loaded_vimballPlugin     = 1,
    loaded_2html_plugin      = 1,
    loaded_matchit           = 1,
    loaded_matchparen        = 1,
    loaded_logiPat           = 1,
    loaded_rrhelper          = 1,
    loaded_netrw             = 1,
    loaded_netrwPlugin       = 1,
    loaded_netrwSettings     = 1,
    loaded_netrwFileHandlers = 1,
}

setting.opt = {
    cindent        = true,
    colorcolumn    = "120",
    cursorline     = true,
    expandtab      = true,
    foldcolumn     = "auto",
    foldlevel      = 999,
    foldmethod     = "syntax",
    ignorecase     = true,
    lazyredraw     = true,
    list           = true,
    listchars      = "eol:$,tab:<->,trail:·,nbsp:×,precedes:<,extends:>",
    foldenable     = false,
    swapfile       = false,
    writebackup    = false,
    number         = true,
    relativenumber = true,
    scrolloff      = 999,
    shiftwidth     = 4,
    showmatch      = true,
    sidescrolloff  = 999,
    smartindent    = true,
    softtabstop    = 4,
    tabstop        = 4,
    termguicolors  = true,
    textwidth      = 120,
    title          = true,
    undofile       = true,
    visualbell     = true,
    wildignore     = vim.opt.wildignore:append("*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store"),
    whichwrap      = vim.opt.whichwrap:append("<>hl"),
    wrapmargin     = 2,
}

if vim.fn.has('mac') ~= 0 then
    setting.opt.runtimepath = vim.opt.runtimepath:append('/usr/local/opt/fzf,/opt/homebrew/opt/fzf')
end

for prefix, tbl in pairs(setting) do
    for key, value in pairs(tbl) do
        vim[prefix][key] = value
    end
end
