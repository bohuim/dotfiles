[macOS] iTerm2 Settings
---

iTerm2 stores settings in a `.plist` file and can specify a folder, so no need to symlink

## Sync Commands
Specifying the sync folder can be done in the GUI or via the commands below:
```sh
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
```

