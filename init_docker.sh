#!/bin/bash
# link dotfiles
mkdir ~/.config
mkdir ~/.config/fish
ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/fish/alias.fish ~/.config/fish/alias.fish
ln -s ~/dotfiles/fish/function.fish ~/.config/fish/function.fish
mkdir ~/.config/fish/functions
ln -s ~/dotfiles/fish/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
mkdir ~/.config/fish/completions/
touch ~/dotfiles/fish/env.fish
touch ~/.config/fish/fish_variables
    
# fish color
set fish_color_autosuggestion 969896
set fish_color_cancel -r
set fish_color_command 8abeb7
set fish_color_comment f0c674
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_end b294bb
set fish_color_error de935f
set fish_color_escape 00a6b2
set fish_color_history_current --bold
set fish_color_host normal
set fish_color_match --background=brblue
set fish_color_normal normal
set fish_color_operator 00a6b2
set fish_color_param b294bb
set fish_color_quote b5bd68
set fish_color_redirection 8abeb7
set fish_color_search_match 'bryellow'  '--background=brblack'
set fish_color_selection 'white'  '--bold'  '--background=brblack'
set fish_color_status red
set fish_color_user brgreen
set fish_color_valid_path --underline

# exa
curl https://sh.rustup.rs -sSf | sh
wget -q https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
unzip exa-linux-x86_64-0.9.0.zip
sudo mv exa-linux-x86_64 /usr/local/bin/exa
