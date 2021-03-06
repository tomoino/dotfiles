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
if !(type git > /dev/null 2>&1); then
    yes | sudo apt-get install git

    git config --global user.name "Tomohiro Inoue" 
    git config --global user.email 55827264+tomoino@users.noreply.github.com 

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
    mkdir ~/.config/fish
    ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
    ln -s ~/dotfiles/fish/alias.fish ~/.config/fish/alias.fish
    ln -s ~/dotfiles/fish/function.fish ~/.config/fish/function.fish
    mkdir ~/.config/fish/functions
    ln -s ~/dotfiles/fish/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
    mkdir ~/.config/fish/completions/
    touch ~/.config/fish/env.fish
    
    # fishの色の設定
    # set -U | grep fish_color_ で現在の設定を確認できる
    set -U fish_color_autosuggestion 969896
    set -U fish_color_cancel -r
    set -U fish_color_command 8abeb7
    set -U fish_color_comment f0c674
    set -U fish_color_cwd green
    set -U fish_color_cwd_root red
    set -U fish_color_end b294bb
    set -U fish_color_error de935f
    set -U fish_color_escape 00a6b2
    set -U fish_color_history_current --bold
    set -U fish_color_host normal
    set -U fish_color_match --background=brblue
    set -U fish_color_normal normal
    set -U fish_color_operator 00a6b2
    set -U fish_color_param b294bb
    set -U fish_color_quote b5bd68
    set -U fish_color_redirection 8abeb7
    set -U fish_color_search_match 'bryellow'  '--background=brblack'
    set -U fish_color_selection 'white'  '--bold'  '--background=brblack'
    set -U fish_color_status red
    set -U fish_color_user brgreen
    set -U fish_color_valid_path --underline
    
fi

fish ~/dotfiles/setup_ubuntu.fish