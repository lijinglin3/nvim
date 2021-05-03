# vim

## Install

for vim

```bash
git clone git@github.com:lijinglin3/vim.git ~/.vim
cd ~/.vim
git submodule update --init --recursive
```

for neovim

```bash
pip install --upgrade pynvim
git clone git@github.com:lijinglin3/vim.git ~/.config/nvim
cd ~/.config/nvim
git submodule update --init --recursive
```

## Init

```bash
vim +GoInstallBinaries +LeaderfInstallCExtension
```

## Update Plugins

```bash
git pull --recurse-submodules
git submodule update --remote
```

## Installed Plugins

- [ale](https://github.com/dense-analysis/ale)
- [coc.nvim](https://github.com/neoclide/coc.nvim)
- [gruvbox](https://github.com/morhetz/gruvbox)
- [LeaderF](https://github.com/Yggdroot/LeaderF)
- [nerdtree](https://github.com/preservim/nerdtree)
- [syntastic](https://github.com/vim-syntastic/syntastic)
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [vim-go](https://github.com/fatih/vim-go)
