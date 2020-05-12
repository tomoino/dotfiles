# 移動しやすく
alias .. 'cd ..'
alias ... 'cd ../..'

# lsを使いやすく
alias ls 'ls --color=auto --show-control-chars --time-style=long-iso -FH'
alias ll 'ls -lA'
alias la 'ls -A'

alias topen 'touchAndOpen'
alias lopen 'latestFileOpen'

# git
alias gad 'git add'
alias gcm 'git commit'
alias gst 'git status'
alias glg 'git log'
alias gbr 'git branch'
alias gco 'git checkout'
alias gps 'git push'
alias gpsm 'git push origin master'
alias gpl 'git pull'
alias gcl 'git clone'

# docker
alias docker 'docker.exe'
<<<<<<< HEAD
alias docker-compose 'docker-compose.exe'
=======
alias docker-compose 'docker-compose.exe'

# cloudSQL
alias perticleSqlProxyOn './cloud_sql_proxy.exe -instances=perticle:us-central1:perticle=tcp:3306 -credential_file=perticle-67942c8145a9.json &'

# mysql
alias mysqlRL 'mysql -u root -p --host 127.0.0.1'
>>>>>>> cf2cf8d2616810da52897d24bd6cac83fdc910a6
