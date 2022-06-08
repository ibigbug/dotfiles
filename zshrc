# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

DISABLE_AUTO_UPDATE="true"

ZSH_THEME="candy"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(python git docker)

alias e="emacsclient"
alias em="emacs -nw"
alias v="nvim"
alias vi="nvim"
alias py='python3'
alias py2='python2'

alias rm="rm -i"
alias cp="cp -i"

source $ZSH/oh-my-zsh.sh
bindkey -e

export LANG=en_US.UTF-8

export EDITOR='nano'
export ALTERNATE_EDITOR="vim"

tmux_init()
{
  tmux new-session -s "daily-works" -d -n "fg-jobs" -c $HOME
  tmux -2 attach-session -d
}

if which tmux 2>&1 >/dev/null; then
  test -z "$TMUX" && (tmux attach || tmux_init)
fi

. $HOME/.envrc
