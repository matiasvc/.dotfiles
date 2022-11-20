#!/usr/bin/env bash

# Install neovim if it isn't already installed

# Path of folder where this script is, which should be the .dotfiles/install folder
INSTALL_PATH="$(dirname $(realpath -s $0))"

# The version of ubuntu that is running this script
UBUNTU_CODENAME=`cat /etc/lsb-release | awk '/DISTRIB_CODENAME/ { CODENAME=$2} END {print CODENAME}' FS='='`

# Install neovim
if [ ! -x "$(command -v nvim)" ]; then
  echo ">>>> Installing neovim <<<<"
  sudo apt update
  sudo apt-get install -y software-properties-common
  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo apt-get update
  sudo apt-get install -y neovim
else
  echo ">>>> neovim is already installed <<<<"
fi
