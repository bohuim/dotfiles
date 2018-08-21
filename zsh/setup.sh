#!/bin/sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

rm -i $HOME/.zshrc
ln -s $HOME/dotfiles/zsh/.zshrc $HOME
