# vim

## Install

neovim

```bash
pip install --upgrade pynvim
git clone https://github.com/lijinglin3/vim ~/.config/nvim
```

vim

```bash
git clone https://github.com/lijinglin3/vim ~/.vim
```

## Init

```bash
git submodule update --init --recursive             # init plugins
nvim '+packadd LeaderF' +LeaderfInstallCExtension   # init LeaderF
nvim '+packadd vim-go' +GoInstallBinaries           # init vim-go
```

## Update

```bash
git pull --recurse-submodules
git submodule update --remote
```

## Plugins

- [gruvbox](https://github.com/gruvbox-community/gruvbox)
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-airline-theme](https://github.com/vim-airline/vim-airline-theme)
- [nerdtree](https://github.com/preservim/nerdtree)
- [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
- [vim-floaterm](https://github.com/voldikss/vim-floaterm)
- [LeaderF](https://github.com/Yggdroot/LeaderF)
- [fzf.vim](https://github.com/junegunn/fzf.vim)
- [ale](https://github.com/dense-analysis/ale)
- [coc.nvim](https://github.com/neoclide/coc.nvim)
- [rainbow_csv](https://github.com/mechatroner/rainbow_csv)
- [coc-clangd](https://github.com/clangd/coc-clangd)
- [vim-go](https://github.com/fatih/vim-go)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
