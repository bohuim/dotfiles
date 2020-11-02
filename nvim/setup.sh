#!/bin/sh

sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

mkdir -p ~/.config/nvim
ls -s $HOME/dotfiles/nvim/init.vim ~/.config/nvim

mkdir -p ~/.local/share
ln -s $HOME/dotfiles/nvim ~/.local/share/nvim

nvim --headless +PlugInstall +qa
