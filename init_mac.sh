#!/bin/bash
# Mac用：ダウンロードして実行するスクリプト。git installまで。

# アーキテクチャ名は UNAME に入れておく
UNAME=`uname -m`
is_arm() { test "$UNAME" == "arm64"; }
#====================================================================
# git含むコマンドラインツールとRosetta2の導入
#====================================================================
if !(type git > /dev/null 2>&1); then
    echo "Installing Command line tools ..."
    xcode-select --install # コマンドラインツールインストール

    if is_arm; then
        # ソフトウェアアップデートで Rosetta2 をインストール。面倒なのでライセンス確認クリックをスキップ
        echo "Installing Rosetta2 ..."
        /usr/sbin/softwareupdate --install-rosetta --agree-to-license
    fi

fi 

#====================================================================
# homebrewの導入
#====================================================================
if !(type brew > /dev/null 2>&1); then
    echo "Installing homebrew in /usr/local for Intel or Rosetta2 ..."
    arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if is_arm; then
        echo "Installing Homebrew ..."
        
        cd /opt
        sudo mkdir homebrew
        sudo chown $USER homebrew
        curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
    fi
fi

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
fi

fish ~/dotfiles/setup_ubuntu.fish