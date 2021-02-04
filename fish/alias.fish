# 移動しやすく
alias .. 'cd ..'
alias ... 'cd ../..'

# lsを使いやすく
#alias ls 'ls --color=auto --show-control-chars --time-style=long-iso -FH'
# alias ll 'ls -lA'
alias ll 'exa -hla --git'
alias la 'ls -A'

# git
alias gad 'git add'
alias gcm 'git commit'
alias gst 'git status'
alias glg 'git log'
alias gbr 'git branch'
alias gco 'git checkout'
alias gps 'git push'
alias gpl 'git pull'
# alias gcl 'git clone'
alias gdi 'git diff'
alias grs 'git reset'

alias gcl 'ghq get'
alias gli 'ghq list --unique'
alias gcd 'cd (ghq root)/(ghq list | peco)'
alias gh 'hub browse (ghq list | peco | cut -d "/" -f 2,3)'
alias ghc 'hub browse (basename (dirname $PWD))/(basename $PWD)'

# docker
alias dps 'docker ps -a'
alias dim 'docker images'
alias dbl 'docker build .'
alias drun 'docker run -dit'
alias dst 'docker start'
alias dat 'docker attach'
alias dex 'docker exec'
alias dds 'sudo service docker start'

# Google Cloud Platform
alias gcloud '~/google-cloud-sdk/bin/gcloud'

# pyenv
alias pe 'pyenv'
alias pel 'pyenv local'
alias peg 'pyenv global'
alias pei 'pyenv install'
alias peil 'pyenv install --list'
alias pev 'pyenv versions'

# poetry
alias poi 'poetry install'
alias poini 'poetry init'
alias popy 'poetry run python'
alias poa 'poetry add'

# heroku 一時的なalias
alias hpg 'heroku pg:psql -a alibi-api'
alias hdeploy 'git push heroku main'

# 画面消去
alias c 'clear'
alias cls 'reset'

# ディスクサイズ
alias df 'df -h'
alias du 'du -h'
alias du1 'du -d1'

alias grep 'grep --color'