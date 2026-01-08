#!/bin/bash

# Backup existing vimrc if it exists and isn't a symlink
if [ -f ~/.vimrc ] && [ ! -L ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.backup
    echo "Backed up existing .vimrc to .vimrc.backup"
fi

# Symlink vimrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
echo "Linked .vimrc"

# For Neovim compatibility
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/.vimrc ~/.config/nvim/init.vim
echo "Linked init.vim for Neovim"

echo "Dotfiles installed successfully!"


