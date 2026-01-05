# dotfiles

## Tmux

Install https://github.com/tmux-plugins/tpm

<Prefix> I to install plugins

cp/ln tmux-powerline to ~/.config/

## Rainbarf

brew install rainbarf

ln $PWD/.rainbarf.conf $HOME


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
