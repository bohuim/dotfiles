NEW_PATH=""

# bin
NEW_PATH=$NEW_PATH:$HOME/bin
# export PATH=$PATH:$HOME/bin

# .local
NEW_PATH=$NEW_PATH:$HOME/.local/bin
# export PATH=$PATH:$HOME/.local/bin

# RUST
# export PATH=$PATH:$HOME/.cargo/bin

# Export
export PATH=$NEW_PATH:$PATH
