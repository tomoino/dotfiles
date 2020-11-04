#!/bin/bash
#====================================================================
# aptのアップデート
#====================================================================
# yes | sudo apt-get update
# yes | sudo apt-get upgrade

#====================================================================
# gitの導入
#====================================================================
# sudo apt-get install git
# git clone https://github.com/tomoino/dotfiles.git

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
sudo apt-get install curl
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o vscode.deb
sudo apt install ./vscode.deb
code --version

#====================================================================
# brewの用意
#====================================================================
sudo apt-get install build-essential file
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
echo "eval $($(brew --prefix)/bin/brew shellenv)" >>~/.profile

#====================================================================
# fish
#====================================================================
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install -y fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
sudo apt-get install fonts-powerline
fisher omf/theme-agnoster
echo exec fish > ~/.bashrc
