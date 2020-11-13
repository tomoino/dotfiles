#!/bin/fish
# Ubuntu用：initの後に実行。
#====================================================================
# vscodeの用意
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
# python
#====================================================================
# curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
# echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
# echo eval (pyenv init - ) >> ~/dotfiles/fish/config.fish # config.fishに書き込まれていない場合は実行
# reload
# pyenv -v
# yes | sudo apt-get install zlib1g-dev
# yes | sudo apt install libffi-dev # 3.7以上で必要
# pyenv install 3.9.0
# pyenv global 3.9.0

# pip install pipx
# pipx ensurepath
# pipx completions

# curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
# poetry config virtualenvs.in-project true
