
export EDITOR=vim

# n
export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install

# go
export GOPATH=$HOME/.go
