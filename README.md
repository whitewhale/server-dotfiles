# WhiteWhale server dotfiles

### Install with the following

* Clone the dotfiles: `git clone https://github.com/whitewhale/server-dotfiles.git .dotfiles`
* Move into .dotfiles dir and run `./create_links`
* Install Vundle: `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* Install vim plugins by running `PluginsInstall` in vim's command mode

### Using zsh with oh-my-zsh

* Install oh-my-zsh with `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
* Oh My ZSH replaces the ~/.zshrc file with its own and renames the existing .zshrc file to .zshrc.pre-oh-my-zsh.  Restore the .zshrc that is part of this repo.
  * `rm .zshrc`
  * `mv .zshrc.pre-oh-my-zsh .zshrc`
* Make zsh the default shell with `chsh -s /usr/bin/zsh username`
