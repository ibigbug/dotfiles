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

# make PATH available for tmux
. $HOME/.envrc

tmux_init()
{
  tmux new-session -s "daily-works" -d -n "fg-jobs" -c $HOME
  tmux -2 attach-session -d
}

# Only prompt for tmux if not in VS Code and not already in a tmux session
if [ "$TERM_PROGRAM" != "vscode" ]; then
  if command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ]; then
    echo -n "Start tmux? (y/n) [y]: "
    read -k 1 -t 9 response
    echo ""

    if [[ ! "$response" =~ ^[Nn]$ ]]; then
      tmux attach || tmux_init
    fi
  fi
fi

