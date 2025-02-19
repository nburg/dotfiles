#!/bin/bash

if ! command -v git &> /dev/null; then
  echo 'git not found'
  exit
fi

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
source ~/.bashrc
