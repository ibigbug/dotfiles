source $HOME/.antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle python
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen theme "candy"

antigen apply



alias e="emacsclient"
alias em="emacs -nw"
alias v="nvim"
alias vi="nvim"
alias py='python3'
alias py2='python2'

alias rm="rm -i"
alias cp="cp -i"

bindkey -e

export LANG=en_US.UTF-8

export EDITOR='nano'
export ALTERNATE_EDITOR="vim"

tmux_init()
{
  tmux new-session -s "daily-works" -d -n "fg-jobs" -c $HOME
  tmux -2 attach-session -d
}

if command -v tmux >/dev/null 2>&1; then
  test -z "$TMUX" && (tmux attach || tmux_init)
fi

. $HOME/.envrc
