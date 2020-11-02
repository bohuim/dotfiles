#!/bin/sh

rm -i $HOME/.gitconfig
ln -s $HOME/dotfiles/git/.gitconfig ~/.gitconfig

rm -i $HOME/.gitignore
ln -s $HOME/dotfiles/git/.gitignore ~/.gitignore
