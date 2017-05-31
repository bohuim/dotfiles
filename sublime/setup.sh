#!/bin/sh

SUBL_PACKAGE="$HOME/Library/Application Support/Sublime Text 3/Packages"
SUBL_USER=$SUBL_PACKAGE/User

rm -r "$SUBL_USER" 2> /dev/null
ln -s ~/dotfiles/sublime/User "$SUBL_USER"
