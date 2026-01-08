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

# Install Everforest color scheme
mkdir -p ~/.vim/pack/colors/opt
if [ ! -d ~/.vim/pack/colors/opt/everforest ]; then
    git clone --depth 1 https://github.com/sainnhe/everforest.git ~/.vim/pack/colors/opt/everforest
    echo "Installed Everforest color scheme"
fi
