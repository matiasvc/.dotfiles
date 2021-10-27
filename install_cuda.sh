#!/bin/env bash

# Path of folder where this script is, which should be the .dotfiles folder
DOTFILES_PATH=$(dirname $(realpath -s $0))

# The version of ubuntu that is running this script
UBUNTU_CODENAME=`cat /etc/lsb-release | awk '/DISTRIB_CODENAME/ { CODENAME=$2} END {print CODENAME}' FS='='`

APT_PATH="${DOTFILES_PATH}/apt/${UBUNTU_CODENAME}"

if [[ ! -d "$APT_PATH" ]]; then
	echo "This script does not support ${UBUNTU_CODENAME}" > /dev/stderr
	echo "Unable to find $APT_PATH" > /dev/stderr
	exit 1
fi

# The folder where the apt list files are stored

wget -P /tmp/ https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv /tmp/cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub

sudo rm -f /etc/apt/sources.list.d/cuda.list
sudo ln -s ${APT_PATH}/cuda.list /etc/apt/sources.list.d/cuda.list

sudo apt update
sudo apt install -y cuda

