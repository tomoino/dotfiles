#!/bin/bash

DOT_FILES_DIR="/c/Users/$USER/dotfiles"
TARGET_DIR="/home/$USER"
DOT_FILES=(.bashrc .bash_profile .bash_aliases)

for file in ${DOT_FILES[@]}
do
    ln -s $DOT_FILES_DIR/bash/$file $TARGET_DIR/$file
done