#!/bin/env bash

# Path of folder where this script is, which should be the .dotfiles folder
DOTFILES_PATH=$(dirname $(realpath -s $0))

wget -P /tmp/ https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv /tmp/cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub

sudo rm -f /etc/apt/sources.list.d/cuda.list
sudo ln -s ${DOTFILES_PATH}/apt/cuda.list /etc/apt/sources.list.d/cuda.list

sudo apt update
sudo apt install -y --install-suggests cuda

