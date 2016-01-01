#!/bin/sh
echo Install all AppStore Apps at first!
# no solution to automate AppStore installs
read -p "Press any key to link dotfiles... "
echo  '\n'
cd
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
.npm completion >> ~/dotfiles/npm_completion
ln -s ~/dotfiles/npm_completion ~/.npm_completion
chsh -s $(which zsh)

read -p "Press any key to install apps... "
echo  '\n'

echo "install vlc"
apt-get install vlc browser-plugin-vlc

echo "install chrome"

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
deb http://dl.google.com/linux/chrome/deb/ stable main
apt-get update
apt-get install google-chrome-stable

echo "install sublimetext 3"
add-apt-repository ppa:webupd8team/sublime-text-3
apt-get update
apt-get install sublime-text

echo "install banshee pinta meld wireshark and mp3 support"
apt-get install banshee 
apt-get install pinta
apt-get install meld
apt-get install wireshark
apt-get install ubuntu-restricted-extras
