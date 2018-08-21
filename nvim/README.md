NeoVim Setup
---

### 1. Install NeoVim `nvim`
Mac
```
brew install neovim
```

Ubuntu (16.04 and newer only)
```
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

### 2. Run `setup.sh`
What it does:
- Symlinks `VimPlug` to the appropriate directory
    - official placement is at `~/.local/share/nvim/autoload/plug.vim`
