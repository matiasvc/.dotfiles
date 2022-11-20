# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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

if [ -d "/usr/local/cuda/bin" ] ; then
    PATH=/usr/local/cuda/bin:${PATH}
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}
fi

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib64
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib32
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/lib
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/lib64
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/lib32

PROFILE_EXTERNAL_PATH="${HOME}/.profile-external"
if [ -d ${PROFILE_EXTERNAL_PATH} ]; then
  CONFIG_FILES=$(find "${PROFILE_EXTERNAL_PATH}" -regex '.*.sh')

  for CONFIG_FILE in $CONFIG_FILES; do
    [ -e "$CONFIG_FILE" ] || continue
    . $CONFIG_FILE
  done
fi

if [ -e /home/matiaschristensen/.nix-profile/etc/profile.d/nix.sh ]; then . /home/matiaschristensen/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

