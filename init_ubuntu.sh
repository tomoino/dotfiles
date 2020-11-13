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
if !(type fish > /dev/null 2>&1); then
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
fi
#====================================================================
# fish
#====================================================================
if !(type fish > /dev/null 2>&1); then
    yes | sudo apt-add-repository ppa:fish-shell/release-3
    yes | sudo apt-get update
    yes | sudo apt-get install -y fish
    # curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
    yes | sudo apt-get install fonts-powerline
    # fisher omf/theme-agnoster
    echo exec fish > ~/.bashrc
    ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
    ln -s ~/dotfiles/fish/alias.fish ~/.config/fish/alias.fish
    ln -s ~/dotfiles/fish/function.fish ~/.config/fish/function.fish
    mkdir ~/.config/fish/functions
    ln -s ~/dotfiles/fish/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
    fish
fi