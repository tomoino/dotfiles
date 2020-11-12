#!/bin/bash
# Ubuntu用：ダウンロードして実行するスクリプト。git installまで。
#====================================================================
# aptのアップデート
#====================================================================
cd ~
yes | sudo apt-get update
yes | sudo apt-get upgrade

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
# gitの導入
#====================================================================
yes | sudo apt-get install git

#====================================================================
# sshの導入
#====================================================================
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa
cd ~
yes | sudo apt-get install xclip
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard
yes | sudo apt-get install xdg-utils
xdg-open https://github.com
read -p "Upload SSH public key to GitHub!"
git clone git@github.com:tomoino/dotfiles.git