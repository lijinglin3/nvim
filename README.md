# vim

## Install

vim

```bash
git clone git@github.com:lijinglin3/vim.git ~/.vim
```

neovim

```bash
pip install --upgrade pynvim
git clone git@github.com:lijinglin3/vim.git ~/.config/nvim
```

## Init

```bash
git submodule update --init --recursive   # init plugins
vim +LeaderfInstallCExtension             # init LeaderF
vim '+packadd vim-go' +GoInstallBinaries  # init vim-go
```

## Update Plugins

```bash
git pull --recurse-submodules && git submodule update --remote
```

## Installed Plugins

- start
  - [LeaderF](https://github.com/Yggdroot/LeaderF)
  - [ale](https://github.com/dense-analysis/ale)
  - [coc.nvim](https://github.com/neoclide/coc.nvim)
  - [fzf.vim](https://github.com/junegunn/fzf.vim)
  - [gruvbox](https://github.com/morhetz/gruvbox)
  - [nerdtree](https://github.com/preservim/nerdtree)
  - [rainbow_csv](https://github.com/mechatroner/rainbow_csv)
  - [vim-airline](https://github.com/vim-airline/vim-airline)
  - [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- opt
  - [coc-clangd](https://github.com/clangd/coc-clangd)
  - [vim-go](https://github.com/fatih/vim-go)
