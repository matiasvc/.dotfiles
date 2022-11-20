#!/usr/bin/env bash

# Install alacritty if it isn't already installed

# Install alacritty
if [ ! -x "$(command -v alacritty)" ]; then
  echo ">>>> Installing alacritty <<<<"
  sudo add-apt-repository ppa:aslatter/ppa -y
  sudo apt update
  sudo apt install -y alacritty
else
  echo ">>>> alacritty is already installed <<<<"
fi
