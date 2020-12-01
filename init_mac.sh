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

        # M1 の場合には、Rosetta2 版の brew を brew_x86 という名前で実行できるようにしておく
        cd /usr/local/bin
        ln -s brew brew_x86
    fi

#====================================================================
# sshの導入
#====================================================================
    ssh-keygen -t rsa
    pbcopy < ~/.ssh/id_rsa.pub
    read -p "Upload SSH public key to GitHub!" # Github > settings > SSH and GPG keys > New SSH Key から追加
    ssh -T git@github.com # 確認
    cd ~
    git clone git@github.com:tomoino/dotfiles.git
fi
#====================================================================
# fish
#====================================================================
if !(type fish > /dev/null 2>&1); then
    if is_arm; then
        /opt/homebrew/bin/brew install fish # 一部armに未対応だったため、実際にはサイトから直接 DL & インストール
    else
        brew install fish
    fi   
    # curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
    echo /usr/local/bin/fish | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/fish
    
    git clone https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh # terminalのフォント変更を忘れずに。
    cd ..
    rm -r fonts

    mkdir ~/.config/fish
    ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
    ln -s ~/dotfiles/fish/alias.fish ~/.config/fish/alias.fish
    ln -s ~/dotfiles/fish/function.fish ~/.config/fish/function.fish
    mkdir ~/.config/fish/functions
    ln -s ~/dotfiles/fish/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
    mkdir ~/.config/fish/completions/

    # fishの色の設定
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

    fish
fi

# ターミナルのテーマ Iceberg は手動でインストールする必要あり
# http://cocopon.github.io/iceberg.vim/

fish ~/dotfiles/setup_mac.fish