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

### 2. Install `VimPlug` 
Per [official documentation](https://github.com/junegunn/vim-plug#neovim):
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 3. Symlink config and Install
```
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
```

After doing the above, first run will pop some error messages,
most likely related to themes or plugins.  
And that's because we haven't installed them yet.

Open up vim and run
```
:PlugInstall
```

### 4. (Optional) Symlink config to `~/.nvimrc`
This is for quick access to the config file:
```
ln -s ~/dotfiles/nvim/init.vim ~/.nvimrc
```

