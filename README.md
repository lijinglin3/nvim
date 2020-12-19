# vim

## 使用方式

```bash
# 安装
git clone git@github.com:lijinglin3/vim.git ~/.vim
cd ~/.vim
git submodule update --init --recursive

# 初始化 YouCompleteMe
cd ~/.vim/pack/plugins/start/YouCompleteMe
python3 install.py --go-completer
```

## 更新插件

```bash
git pull --recurse-submodules
git submodule update --remote
```

## 已安装插件

- [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)
- [ale](https://github.com/dense-analysis/ale)
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [gruvbox](https://github.com/morhetz/gruvbox)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
- [nerdtree](https://github.com/preservim/nerdtree)
- [syntastic](https://github.com/vim-syntastic/syntastic)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [vim-go](https://github.com/fatih/vim-go)
