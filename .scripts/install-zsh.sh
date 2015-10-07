#!/bin/sh

# TODO: Make this a bit better when you find more time
cd ~/
sudo dnf install zsh;
sudo dnf install wget;
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
sudo chsh -s %(which zsh)
git clone https://github.com/olivierverdier/zsh-git-prompt.git ~/.zsh-git-pr
