dotfiles
========

Run these commands :

    cd
    git clone git@github.com:dufoli/dotfiles.git
    ln -s ~/dotfiles/bash_aliases ~/.bash_aliases
    ln -s ~/dotfiles/bash_logout ~/.bash_logout
    ln -s ~/dotfiles/bashrc ~/.bashrc
    ln -s ~/dotfiles/emacs ~/.emacs
    ln -s ~/dotfiles/grc/ ~/.grc
    ln -s ~/dotfiles/gitconfig ~/.gitconfig
    ln -s ~/dotfiles/global-gitignore ~/.gitignore
    ln -s ~/dotfiles/inputrc ~/.inputrc
    ln -s ~/dotfiles/ls_colors ~/.ls_colors
    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/zsh_aliases ~/.zsh_aliases
    ln -s ~/dotfiles/zshrc ~/.zshrc
    ln -s ~/dotfiles/tmux.conf ~/.tmux.conf


	npm completion >> ~/dotfiles/npm_completion
    ln -s ~/dotfiles/npm_completion ~/.npm_completion

Change default bash :

    chsh

Restore Page down do tild :
edit [path]/.oh-my-zsh/lib/key-bindings.zsh and comment part for Page Down key

Thanks to PingTimeout and MaxenceG2M :-)

