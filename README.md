# dotfiles


## tmux crash

```
brew install reattach-to-user-namespace
```

## For neovim

edit `~/.config/nvim/init.vim`

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
```
