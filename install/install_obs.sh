#!/usr/bin/env bash

# Install obs if it isn't already installed

# Install obs
if [ ! -x "$(command -v obs)" ]; then
  echo ">>>> Installing obs <<<<"
  sudo add-apt-repository ppa:obsproject/obs-studio
  sudo apt update
  sudo apt install ffmpeg obs-studio
else
  echo ">>>> obs is already installed <<<<"
fi
