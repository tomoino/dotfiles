#!/bin/bash

DOT_FILES_DIR="/c/Users/$USER/dotfiles/vscode"
TARGET_DIR="/c/Users/$USER/AppData/Roaming/Code/User"
DOT_FILES=(keybindings.json settings.json)

for file in ${DOT_FILES[@]}
do
#    rm $TARGET_DIR/$file
    ln -s $DOT_FILES_DIR/$file $TARGET_DIR/$file
done