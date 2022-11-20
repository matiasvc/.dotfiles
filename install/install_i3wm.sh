#!/usr/bin/env bash

# Install i3wm and related packages if it isn't already installed

# Path of folder where this script is, which should be the .dotfiles/install folder
INSTALL_PATH="$(dirname $(realpath -s $0))"

# The version of ubuntu that is running this script
UBUNTU_CODENAME=`cat /etc/lsb-release | awk '/DISTRIB_CODENAME/ { CODENAME=$2} END {print CODENAME}' FS='='`

# Install i3wm
if [ ! -x "$(command -v i3)" ]; then
  echo ">>>> Installing i3 <<<<"
  # Install the key
  /usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2022.02.17_all.deb /tmp/keyring.deb SHA256:52053550c4ecb4e97c48900c61b2df4ec50728249d054190e8a0925addb12fc6
  sudo dpkg -i /tmp/keyring.deb

  # Copy apt file
  LIST_FILENAME="sur5r-i3.list"
  TMP_PATH="/tmp/${LIST_FILENAME}"
  ETC_PATH="/etc/apt/sources.list.d/${LIST_FILENAME}"
  DOTFILES_PATH="${INSTALL_PATH}/apt/${LIST_FILENAME}"
  sudo rm -f ${ETC_PATH}
  sudo sed 's/RELEASE/'"${UBUNTU_CODENAME}"'/g' ${DOTFILES_PATH} > ${TMP_PATH}
  sudo mv ${TMP_PATH} ${ETC_PATH}
  
  sudo apt update && sudo apt install -y i3 polybar
else
  echo ">>>> i3 is already installed <<<<"
fi
