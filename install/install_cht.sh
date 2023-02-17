#!/usr/bin/env bash

# Install cht.sh if it isn't already installed
if [ ! -x "$(cht.sh -v alacritty)" ]; then
  echo ">>>> Installing cht.sh <<<<"
  CHT_PATH="$HOME/.local/bin/cht.sh"
  curl https://cht.sh/:cht.sh > "$CHT_PATH"
  chmod +x "$CHT_PATH"
else
  echo ">>>> alacritty is already installed <<<<"
fi
