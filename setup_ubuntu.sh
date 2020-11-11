#!/bin/bash
#====================================================================
# aptのアップデート
#====================================================================
cd ~
yes | sudo apt-get update
yes | sudo apt-get upgrade

#====================================================================
# gitの導入
#====================================================================
yes | sudo apt-get install git

#====================================================================
# sshの導入
#====================================================================
# mkdir ~/.ssh
# cd ~/.ssh
# ssh-keygen -t rsa
# cd ~
# yes | sudo apt-get install xclip
# cat ~/.ssh/id_rsa.pub | xclip -selection clipboard
# yes | sudo apt-get install xdg-utils
# xdg-open https://github.com
# read -p "Upload SSH public key to GitHub!"
# git clone git@github.com:tomoino/dotfiles.git

#====================================================================
# 『デスクトップ』『音楽』などの日本語フォルダー名を英語表記にする
#====================================================================
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

#====================================================================
# 文字化け対策
#====================================================================
gsettings set org.gnome.gedit.preferences.encodings auto-detected "['UTF-8','CURRENT','SHIFT_JIS','EUC-JP','ISO-2022-JP','UTF-16']"
gsettings set org.gnome.gedit.preferences.encodings shown-in-menu "['UTF-8','SHIFT_JIS','EUC-JP','ISO-2022-JP','UTF-16']"

#====================================================================
# vscodeの用意
#====================================================================
yes | sudo apt-get install curl
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o vscode.deb
yes | sudo apt install ./vscode.deb
code --version

#====================================================================
# brewの用意
#====================================================================
# yes | sudo apt-get install build-essential file
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
# test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
# test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# echo "eval $($(brew --prefix)/bin/brew shellenv)" >>~/.profile

#====================================================================
# fish
#====================================================================
yes | sudo apt-add-repository ppa:fish-shell/release-3
yes | sudo apt-get update
yes | sudo apt-get install -y fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
yes | sudo apt-get install fonts-powerline
fisher omf/theme-agnoster
echo exec fish > ~/.bashrc

#====================================================================
# python
#====================================================================
# curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
# echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
# echo 'eval "$(pyenv init -)"' >> ~/.bashrc
# echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
# source ~/.bashrc
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
