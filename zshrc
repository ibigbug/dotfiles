# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(python git docker zsh-syntax-highlighting)

alias e="emacsclient"
alias em="emacs -nw"
alias v="mvim -v"
alias vi="mvim -v"
alias py='python'
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

export EDITOR='vim'
export ALTERNATE_EDITOR=""

. ~/.envrc

tmux_init()
{
  tmux new-session -s "daily-works" -d -n "fg-jobs"    # 开启一个会话
  tmux -2 attach-session -d           # tmux -2强制启用256color，连接已开启的tmux
}
# 判断是否已有开启的tmux会话，没有则开启
if which tmux 2>&1 >/dev/null; then
  test -z "$TMUX" && (tmux attach || tmux_init)
fi

share_playground() {
  curl -s -XPOST https://play.golang.org/share -d @$1 | xargs -I{} echo "https://play.golang.org/p/{}"
}

if [ -f "${HOME}/.gpg-agent-info" ]; then  
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
  export SSH_AGENT_PID
fi  
