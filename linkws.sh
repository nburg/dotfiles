#!/bin/bash

if ! command -v git &> /dev/null; then
  echo 'git not found'
  exit
fi

cd ~/.dotfiles/workstation
for i in `ls -A`; do
  if [ -e ~/$i ]; then
    rm -rf ~/$i
  fi
  ln -s ~/.dotfiles/workstation/$i ~/$i
done

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
