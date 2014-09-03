# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

export UPDATE_ZSH_DAYS=15

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git python brew)

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='mvim -v'
fi

alias nettop="nettop -nm tcp"
alias vi="mvim -v"
alias v="mvim -v"
alias e="emacs"

export WORKON_HOME="$HOME/.venvs"
source /usr/local/bin/virtualenvwrapper.sh
