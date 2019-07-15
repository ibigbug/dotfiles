# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

DISABLE_AUTO_UPDATE="true"

ZSH_THEME="ys"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(python git docker zsh-syntax-highlighting)

alias e="emacsclient"
alias em="emacs -nw"
alias v="nvim -v"
alias vi="nvim -v"
alias py='python3'
alias py2='python2'
alias fuckgfw='proxychains4 -q'

alias rm="rm -i"
alias cp="cp -i"

# functional aliases
alias ducks="du -cks * | sort -rn | head -11"
alias sock_stat="netstat -n | awk '/^tcp/ {++S[\$NF]} END {for(a in S) print a, S[a]}'"
alias nettop="nettop -nm tcp"


source $ZSH/oh-my-zsh.sh
bindkey -e

export LANG=en_US.UTF-8

export EDITOR='nano'
export ALTERNATE_EDITOR="vim"

. ~/.envrc

tmux_init()
{
  tmux new-session -s "daily-works" -d -n "fg-jobs"    # 开启一个会话
  tmux -2 attach-session -d           # tmux -2强制启用256color，连接已开启的tmux
}

if which tmux 2>&1 >/dev/null; then
  test -z "$TMUX" && (tmux attach || tmux_init)
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yuweiba/workplace/tools/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yuweiba/workplace/tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yuweiba/workplace/tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yuweiba/workplace/tools/google-cloud-sdk/completion.zsh.inc'; fi
