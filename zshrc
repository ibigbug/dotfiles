# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

DISABLE_UNTRACKED_FILES_DIRTY="true"

alias e="emacs"
alias v='mvim -v'
alias vi='mvim -v'
alias py='python'
alias fuckgfw='proxychains4 -q'
alias nodeh='node --harmony'

alias rm="rm -i"
alias cp="cp -i"

# functional aliases
alias ducks="du -cks * | sort -rn | head -11"
alias nettop="nettop -nm tcp"

plugins=(git brew python pip)

source $ZSH/oh-my-zsh.sh
bindkey -e

export LANG=en_US.UTF-8

export EDITOR='vim'

. ~/.envrc
. ~/.spm_completion
