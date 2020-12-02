#!/bin/fish
# Ubuntu用：initの後に実行。
#====================================================================
# Homebrew
#====================================================================
# brew bundleを利用できる場合は利用する
if test -f ~/dotfiles/brew/arm/.Brewfile; or test -f ~/dotfiles/brew/rosetta2/.Brewfile; or test -f ~/dotfiles/brew/intel/.Brewfile
    if is_arm
        echo "brew bundle in Rosetta2 ..."
        cd ~/dotfiles/brew/arm
        brew bundle
        echo "brew bundle in Arm native ..."
        cd ~/dotfiles/brew/rosetta2
        brew bundle
    else
        echo "brew bundle in Intel ..."
        cd ~/dotfiles/brew/intel
        brew bundle
    end
else
#====================================================================
# GUIアプリ
#====================================================================
    brew cask install alfred
    brew cask install google-chrome
    brew cask install google-chrome-canary
    brew cask install iterm2
    # fontは Cascadia Code PL https://github.com/microsoft/cascadia-code/releases 
    brew cask install notion
    brew cask install slack
    brew cask install visual-studio-code
    # fontは Ricty Diminished for Powerline
    brew cask install karabiner-elements
    brew cask install shiftit
    brew cask install hyperswitch
#====================================================================
# ghq
#====================================================================
    # まだARMに対応していないみたい
    # if not type -q go
    #     brew install golang
    # end

    # if not type -q ghq
    #     brew install ghq
    #     echo "[ghq]" >> ~/.gitconfig
    #     echo "    root = $GHQ_ROOT" >> ~/.gitconfig
    # end

    # if not type -q peco
    #     brew install peco
    # end

    # if not type -q hub
    #     brew install hub
    # end

end

#====================================================================
# python
#====================================================================
# if not type -q pyenv
#     sudo apt install -y libffi-dev
#     sudo apt install -y libssl-dev # openssl
#     sudo apt install -y zlib1g-dev
#     sudo apt install -y liblzma-dev
#     sudo apt install -y libbz2-dev libreadline-dev libsqlite3-dev # bz2, readline, sqlite3
#     curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
#     # echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
#     # echo eval (pyenv init - ) >> ~/dotfiles/fish/config.fish # config.fishに書き込まれていない場合は実行
#     reload
#     pyenv -v
#     sudo apt install -y python-is-python3 # defaultでpythonコマンド使えない場合
#     pyenv install 3.9.0
#     pyenv global 3.9.0
#     pyenv install 2.7.18
#     reload
# end

# if not type -q pip
#     curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#     sudo python get-pip.py
# end

# if not type -q pipx
#     pip install pipx
#     pipx ensurepath
#     pipx completions
# end

# if not type -q poetry
#     curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
#     poetry config virtualenvs.in-project true
#     poetry completions fish > ~/.config/fish/completions/poetry.fish
# end

#====================================================================
# tex
#====================================================================
# if not type -q ptex2pdf
#     sudo apt-get install -y texlive-full
#     ln -s ~/dotfiles/latex/.latexmkrc ~/.latexmkrc
# end

#====================================================================
# ghq
#====================================================================
# if not type -q go
#     # sudo apt install -y golang
#     sudo wget https://storage.googleapis.com/golang/go1.15.5.linux-amd64.tar.gz
#     sudo tar -C /usr/local -xzf go1.15.5.linux-amd64.tar.gz
# end

# if not type -q ghq
#     go get github.com/x-motemen/ghq
#     echo "[ghq]" >> ~/.gitconfig
# 	echo "    root = $GHQ_PROJECTS" >> ~/.gitconfig
# end

# if not type -q peco
#     go get github.com/peco/peco/cmd/peco
# end

# if not type -q hub
#     go get github.com/github/hub
# end
