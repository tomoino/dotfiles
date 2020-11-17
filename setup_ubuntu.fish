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