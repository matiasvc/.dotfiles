#!/bin/env bash

# This script installs all needed programs and libraries.

# Path of folder where this script is, which should be the .dotfiles folder
DOTFILES_PATH=$(dirname $(realpath -s $0))

# The version of ubuntu that is running this script
UBUNTU_CODENAME=`cat /etc/lsb-release | awk '/DISTRIB_CODENAME/ { CODENAME=$2} END {print CODENAME}' FS='='`

if [[ "$UBUNTU_CODENAME" =~ ^(bionic) ]]; then
	echo "The machine is running Ubuntu ${UBUNTU_CODENAME}"
else
	echo "This script does not support ${UBUNTU_CODENAME}" > /dev/stderr
	exit 1
fi

# The folder where the apt list files are stored
APT_PATH="${DOTFILES_PATH}/apt/${UBUNTU_CODENAME}"

# Install everything that can be installed with apt

sudo apt update

# Install packages
# build-essential: basic compilers and libraries
# wget & curl: HTTP file retrivers
# git: source control
# feh: image viewer & desktop background
# xautoloc: auto password lock
# htop, nmon & bmon: system monitora
# ffmpeg: video codec and converter
# ffmpegthumbnailer: used by ranger for video thumbnails
# cmake: build system
# ninja-build: build system
# vlc: video player
# python3 python3-pip: python along with pip package manager
# polybar: status bar
# shellcheck: bash script linter
# ncdu: disk usage analyzer utility
# gparted: disk partitioning and formatting utility
# nfs-common: for acessing synology drive
# imagemagick: image utilities
# cifs-utils: utilities for mounting SMB/CIFS shares
# w3m-img: display images in ranger
sudo apt-get install -y \
	build-essential \
	wget curl \
	git \
	feh \
	xautolock \
	htop nmon bmon \
	ffmpeg \
	ffmpegthumbnailer \
	cmake cmake-doc \
	ninja-build \
	vlc \
	python3 python3-pip \
	polybar \
	shellcheck \
	ncdu \
	gparted \
	cifs-utils \
	w3m-img



# Install i3wm
echo "Would you like to install i3?"
select yn in "Yes" "No"; do
	case $yn in
		Yes )
			if [ ! -x "$(command -v i3)" ]; then
				echo ">>>> Installing i3 <<<<"
				# Install the key
				/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2021.02.02_all.deb /tmp/keyring.deb SHA256:cccfb1dd7d6b1b6a137bb96ea5b5eef18a0a4a6df1d6c0c37832025d2edaa710
				sudo dpkg -i /tmp/keyring.deb

				# Copy apt file
				sudo rm -f /etc/apt/sources.list.d/sur5r-i3.list
				sudo ln -s ${APT_PATH}/sur5r-i3.list /etc/apt/sources.list.d/sur5r-i3.list

				sudo apt update && sudo apt install -y i3
			else
				echo ">>>> i3 is already installed <<<<"
			fi
			; break;;
		No )
			echo "Skipping i3"
	esac
done

# install fd
echo "Would you like to install fd?"
select yn in "Yes" "No"; do
	case $yn in
		Yes )
			if [ ! -x "$(command -v fd)" ]; then
				echo ">>>> Installing fd <<<<"
				FD_VERSION='8.2.1'
				wget -P /tmp/ https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd_${FD_VERSION}_amd64.deb
				sudo dpkg -i /tmp/fd_${FD_VERSION}_amd64.deb
			else
				echo ">>>> fd is already installed <<<<"
			fi
		No )
			echo "Skipping fd"
	esac
done

# install fzf
echo "Would you like to install fzf?"
select yn in "Yes" "No"; do
	case $yn in
		Yes )
			if [ ! -d "${HOME}/.fzf" ]; then
				echo ">>>> Installing fzf <<<<"
				FZF_VERSION='0.27.2'
				git clone --depth 1 --branch ${FZF_VERSION} https://github.com/junegunn/fzf.git ${HOME}/.fzf
				${HOME}/.fzf/install
			else
				echo ">>>> fzf is already installed <<<<"
			fi
		No )
			echo "Skipping fzf"
	esac
done

# install ranger
echo "Would you like to install fzf?"
select yn in "Yes" "No"; do
	case $yn in
		Yes )
			if [ ! -x "$(command -v ranger)" ]; then
				echo ">>>> Installing ranger <<<<"
				RANGER_VERSION='1.9.3'
				git clone --depth 1 --branch v${RANGER_VERSION} https://github.com/ranger/ranger.git /tmp/ranger
				sudo apt update && sudo apt install -y python python3 # Install requirements
				# TODO: Look at other relevant ranger preview programs
				sudo make -C /tmp/ranger/ install
			else
				echo ">>>> ranger is already installed <<<<"
			fi
		No )
			echo "Skipping fzf"
	esac
done

# install neovim
echo "Would you like to install fzf?"
select yn in "Yes" "No"; do
	case $yn in
		Yes )
			if [ ! -x "$(command -v nvim)" ]; then
				echo ">>>> Installing neovim <<<<"
				# Copy apt file
				sudo rm -f /etc/apt/sources.list.d/neovim.list
				sudo ln -s ${APT_PATH}/neovim.list /etc/apt/sources.list.d/neovim.list
				sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 55F96FCF8231B6DD
				sudo apt update && sudo apt install -y neovim
			else
				echo ">>>> neovim is already installed <<<<"
			fi
		No )
			echo "Skipping fzf"
	esac
done

# install alacritty
echo "Would you like to install fzf?"
select yn in "Yes" "No"; do
	case $yn in
		Yes )
			if [ ! -x "$(command -v alacritty)" ]; then
				echo ">>>> Installing alacritty <<<<"
				# Copy apt file
				sudo rm -f /etc/apt/sources.list.d/alacritty.list
				sudo ln -s ${APT_PATH}/alacritty.list /etc/apt/sources.list.d/alacritty.list
				sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8AC9B4BBBAB4900B
				sudo apt update && sudo apt install -y alacritty
			else
				echo ">>>> alacritty is already installed <<<<"
			fi
		No )
			echo "Skipping fzf"
	esac
done

# install tarsnap
echo "Would you like to install fzf?"
select yn in "Yes" "No"; do
	case $yn in
		Yes )
			if [ ! -x "$(command -v tarsnap)" ]; then
				echo ">>>> Installing tarsnap <<<<"

				wget -q https://pkg.tarsnap.com/tarsnap-deb-packaging-key.asc -O- | sudo apt-key add -

				sudo rm -f /etc/apt/sources.list.d/tarsnap.list
				sudo ln -s ${APT_PATH}/tarsnap.list /etc/apt/sources.list.d/tarsnap.list

				sudo apt update
				sudo apt install -y tarsnap
			else
				echo ">>>> tarsnap is already installed <<<<"
			fi
		No )
			echo "Skipping fzf"
	esac
done

# install llvm12
echo "Would you like to install fzf?"
select yn in "Yes" "No"; do
	case $yn in
		Yes )
			if [ ! -x "$(command -v clang-12)" ]; then
				echo ">>>> Installing llvm12 <<<<"
				sudo wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
				sudo rm -f /etc/apt/sources.list.d/llvm12.list
				sudo ln -s ${APT_PATH}/llvm12.list /etc/apt/sources.list.d/llvm12.list
				sudo apt update
				sudo apt install -y \
					libllvm-12-ocaml-dev libllvm12 llvm-12 llvm-12-dev llvm-12-doc llvm-12-examples llvm-12-runtime \
					clang-12 clang-tools-12 clang-12-doc libclang-common-12-dev libclang-12-dev libclang1-12 clang-format-12 clangd-12 \
					libfuzzer-12-dev \
					lldb-12 \
					lld-12 \
					libc++-12-dev libc++abi-12-dev \
					libomp-12-dev \
					libclc-12-dev
				# Create symlinks for all LLVM executables without the '-12' suffix
				for TOOL_NAME in \
				clang++ clang clang-apply-replacements clang-change-namespace clang-check clang-cl clang-cpp \
				clangd clang-doc clang-extdef-mapping clang-format clang-format-diff clang-include-fixer \
				clang-move clang-offload-bundler clang-offload-wrapper clang-query clang-refactor clang-rename \
				clang-reorder-fields clang-scan-deps \
				lldb lldb-argdumper lldb-instr lldb-server lldb-vscode \
				lld lld-link
				do
					echo $TOOL_NAME
					sudo rm -f /usr/local/bin/$TOOL_NAME
					sudo ln -s /usr/bin/$TOOL_NAME-12 /usr/local/bin/$TOOL_NAME
				done

			else
				echo ">>>> llvm12 is already installed <<<<"
			fi
		No )
			echo "Skipping fzf"
	esac
done

# install gcc-10 and g++-10
# Not needed as hirsute ships with gcc-10 and g++-10
#if [ ! -x "$(command -v gcc-10)" ] || ! [ -x "$(command -v g++-10)" ]; then
#	echo ">>>> Installing gcc-10 and g++-10 <<<<"
#	sudo rm -f /etc/apt/sources.list.d/ubuntu-toolchain.list
#	sudo ln -s ${DOTFILES_PATH}/apt/ubuntu-toolchain.list /etc/apt/sources.list.d/ubuntu-toolchain.list
#	sudo apt update
#	sudo apt install -y \
#		binutils gcc-10 g++-10
#
#else
#	echo ">>>> gcc-10 and g++-10 is already installed <<<<"
#fi
