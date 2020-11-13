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
    sudo apt install build-essential
end    
#====================================================================
# python
#====================================================================
if not type -q pyenv
    curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | fish
    # echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
    # echo eval (pyenv init - ) >> ~/dotfiles/fish/config.fish # config.fishに書き込まれていない場合は実行
    reload
    pyenv -v
    yes | sudo apt-get install zlib1g-dev
    yes | sudo apt install libffi-dev # 3.7以上で必要
    pyenv install 3.9.0
    pyenv global 3.9.0
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