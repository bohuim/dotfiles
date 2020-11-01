export ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=$HOME/dotfiles/zsh/custom
ZSH_THEME="spaceship"

plugins=(git)

# Options
setopt ignoreeof

source $ZSH/oh-my-zsh.sh
