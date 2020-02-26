# disables loading of /etc/zprofile, which runs path_helper and fucks up $PATH
unsetopt GLOBAL_RCS

# oh my zsh - https://github.com/robbyrussell/oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="fishy"
plugins=(git vi-mode fasd)
source $ZSH/oh-my-zsh.sh
DISABLE_AUTO_UPDATE="true"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,paths,zsh.env,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
