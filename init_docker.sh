#!/bin/bash
# echo exec fish > ~/.bashrc
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