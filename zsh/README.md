ZSH Setup
---

### 1. Install `zsh` higher than v5.1
Mac
```
brew install zsh
```

Ubuntu
```
sudo apt-get install zsh
```
Version might not be higher than v5.1 on Ubuntu LTS 14.04


### 2. Run `setup.sh`
What it does:
- Install `oh-my-zsh` via curl, per the [official documentation](https://github.com/robbyrussell/oh-my-zsh#basic-installation)
- Symlink `~/.zshrc ~> ./.zshrc` 

Everything else is automatical setup via the configuration in `.zshrc` and `$ZSH_CUSTOM`

