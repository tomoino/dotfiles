# .bash_aliasesの中身
# echo '.bash_aliases'

# Aliases for MSYS2 bash
# alias hogeを一時的に無効にするには\hoge

# 移動しやすく
alias ..='cd ..'
alias ...='cd ../..'

# lsを使いやすく
alias ls='ls --color=auto --show-control-chars --time-style=long-iso -FH'
alias ll='ls -lA'
alias la='ls -A'

# git
alias gad='git add'
alias gcm='git commit'
alias gst='git status'
alias glg='git log'
alias gbr='git branch'
alias gco='git checkout'
alias gps='git push'
alias gpl='git pull'
alias gcl='git clone'
alias gdi='git diff'
alias grs='git reset'

function gcmm()
{
   git commit -m $1 -m '' -m $2
}

alias gcmm='gcmm'

# docker
alias dps='docker ps -a'
alias dim='docker images'
alias dbl='docker build .'
alias drun='docker run -dit'
alias dst='docker start'
alias dat='docker attach'
alias dex='docker exec'
alias dds='sudo service docker start'
alias dstp='docker stop'
alias drm='docker rm'
alias drmi='docker rmi'

function dfish()
{
   docker exec $1 fish
}

alias dfish='dfish'

# 画面消去
alias c=clear
alias cls=reset

# ディスクサイズ
alias df='df -h'
alias du='du -h'
alias du1='du -d1'

alias grep='grep --color'

# 設定の読み込み
alias relogin='exec $SHELL -l'
alias re=relogin