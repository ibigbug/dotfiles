# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

DISABLE_UNTRACKED_FILES_DIRTY="true"

alias nettop="nettop -nm tcp"
alias e="emacs"
alias v='mvim -v'
alias vi='mvim -v'
alias py='python'
alias node='node --harmony'

plugins=(osx git brew python pip)

source $ZSH/oh-my-zsh.sh
bindkey -e

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim -v'
fi

. ~/.envrc
. ~/.spm_completion
