#!/usr/bin/env bash

# Install fd and related packages if it isn't already installed

# Install fd
if [ ! -x "$(command -v fd)" ]; then
  echo ">>>> Installing fd <<<<"
  FD_VERSION='8.4.0'
  wget -P /tmp/ https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd_${FD_VERSION}_amd64.deb
  sudo dpkg -i /tmp/fd_${FD_VERSION}_amd64.deb
else
  echo ">>>> fd is already installed <<<<"
fi
