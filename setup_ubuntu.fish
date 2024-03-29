#!/bin/fish
# Ubuntu用：initの後に実行。
#====================================================================
# vscodeの用意 vscode公式のSettings Syncの登録は手動
#====================================================================
if not type -q code
    yes | sudo apt-get install curl
    curl -L https://go.microsoft.com/fwlink/\?LinkID=760868 -o vscode.deb
    yes | sudo apt install ./vscode.deb
    reload
    code --version
    rm vscode.deb
end
#====================================================================
# brewの用意
#====================================================================
# yes | sudo apt-get install build-essential file
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
# test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
# test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# echo "eval $($(brew --prefix)/bin/brew shellenv)" >>~/.profile
#====================================================================
# gcc や make など、開発ツールの用意
#====================================================================
if not type -q gcc
    yes | sudo apt install build-essential
end    
#====================================================================
# python
#====================================================================
if not type -q pyenv
    sudo apt install -y libffi-dev
    sudo apt install -y libssl-dev # openssl
    sudo apt install -y zlib1g-dev
    sudo apt install -y liblzma-dev
    sudo apt install -y libbz2-dev libreadline-dev libsqlite3-dev # bz2, readline, sqlite3
    curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
    # echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
    # echo eval (pyenv init - ) >> ~/dotfiles/fish/config.fish # config.fishに書き込まれていない場合は実行
    reload
    pyenv -v
    sudo apt install -y python-is-python3 # defaultでpythonコマンド使えない場合
    pyenv install 3.9.0
    pyenv global 3.9.0
    pyenv install 2.7.18
    reload
end

if not type -q pip
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    sudo python get-pip.py
end

if not type -q pipx
    pip install pipx
    pipx ensurepath
    pipx completions
end

if not type -q poetry
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
    poetry config virtualenvs.in-project true
    poetry completions fish > ~/.config/fish/completions/poetry.fish
end

#====================================================================
# tex
#====================================================================
if not type -q ptex2pdf
    sudo apt-get install -y texlive-full
    ln -s ~/dotfiles/latex/.latexmkrc ~/.latexmkrc
end

#====================================================================
# ghq
#====================================================================
if not type -q go
    # sudo apt install -y golang
    sudo wget https://storage.googleapis.com/golang/go1.15.5.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.15.5.linux-amd64.tar.gz
end

if not type -q ghq
    set GHQ_ROOT "~/projects"
    go get github.com/x-motemen/ghq
    echo "[ghq]" >> ~/.gitconfig
	echo "    root = $GHQ_ROOT" >> ~/.gitconfig
end

if not type -q peco
    go get github.com/peco/peco/cmd/peco
end

if not type -q hub
    go get github.com/github/hub
end

#====================================================================
# docker
# 前提：Docker Desktop for Windows DL済み https://www.docker.com/products/docker-desktop
#====================================================================
if not type -q docker
    # echo "">> ~/dotfiles/fish/env.fish
    # echo "\n set DOCKER_PATH /mnt/c/Program\ Files/Docker/Docker/resources/bin/">> ~/dotfiles/fish/env.fish
    # echo "set PATH \$DOCKER_PATH \$PATH">> ~/dotfiles/fish/env.fish
    curl https://get.docker.com | sh
end

#====================================================================
# exa
#====================================================================
if not type -q exa
    curl https://sh.rustup.rs -sSf | sh
    wget -c https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
    unzip exa-linux-x86_64-0.9.0.zip
    sudo mv exa-linux-x86_64 /usr/local/bin/exa
end

#====================================================================
# other
#====================================================================
if not type -q jq
    sudo apt -y update
    sudo apt -y install jq
end