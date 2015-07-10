# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

DISABLE_UNTRACKED_FILES_DIRTY="true"

alias e="emacsclient"
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

plugins=(git brew python pip zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
bindkey -e

export LANG=en_US.UTF-8

export EDITOR='vim'
export ALTERNATE_EDITOR=""

. ~/.envrc
. ~/.spm_completion

tmux_init()
{
  tmux new-session -s "fg" -d -n "fg-jobs"    # 开启一个会话
  tmux new-window -n "bg"
  tmux split-window -v         # 开启一个横屏,并执行top命令
  tmux -2 attach-session -d           # tmux -2强制启用256color，连接已开启的tmux

}
# 判断是否已有开启的tmux会话，没有则开启
if which tmux 2>&1 >/dev/null; then
  test -z "$TMUX" && (tmux attach || tmux_init)
fi

mov2gif() {
  ffmpeg -i "$1" -vf scale=800:-1 -r 10 -f image2pipe -vcodec ppm - |\
    convert -delay 5 -layers Optimize -loop 0 - "$2"
}

export NVM_DIR="/Users/yuweiba/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
