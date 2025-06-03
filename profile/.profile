# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

PROFILE_SET=1

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.dotfiles/bin" ] ; then
    PATH="$HOME/.dotfiles/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/zig" ] ; then
    PATH="$HOME/zig:$PATH"
fi

if [ -d "$HOME/miniconda3/envs/dotfiles/bin" ] ; then
    PATH="$HOME/miniconda3/envs/dotfiles/bin:$PATH"
fi

if [ -d "$HOME/miniconda3/bin" ] ; then
    PATH="$HOME/miniconda3/bin:$PATH"
fi

PROFILE_EXTERNAL_PATH="${HOME}/.profile-external"
if [ -d ${PROFILE_EXTERNAL_PATH} ]; then
  CONFIG_FILES=$(find "${PROFILE_EXTERNAL_PATH}" -regex '.*.sh')

  for CONFIG_FILE in $CONFIG_FILES; do
    [ -e "$CONFIG_FILE" ] || continue
    . $CONFIG_FILE
  done
fi

if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
  . ~/.nix-profile/etc/profile.d/nix.sh
fi # added by Nix installer


if [ -e /home/matiaschristensen/.nix-profile/etc/profile.d/nix.sh ]; then . /home/matiaschristensen/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
