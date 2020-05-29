#!/bin/bash

if [ -d ~/.dotfiles ]; then
  cd ~/.dotfiles
  git pull
else
  git clone https://github.com/nburg/dotfiles.git ~/.dotfiles
fi

cd ~/.dotfiles/home
for i in `ls -A`; do
  if [ -e ~/$i ]; then
    rm -rf ~/$i
  fi
  ln -s ~/.dotfiles/home/$i ~/$i
done
touch ~/.sudo_as_admin_successful
vim -E -u NONE -S ~/.dotfiles/.vim/vundle.vim +PluginInstall +qall > /dev/null
source ~/.bashrc
