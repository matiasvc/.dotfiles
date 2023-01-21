# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ${HOME}/.zsh/antigen.zsh

antigen use oh-my-zsh

# Plugins from oh-my-zsh
antigen bundle git
antigen bundle command-not-found

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jeffreytse/zsh-vi-mode

antigen theme romkatv/powerlevel10k

antigen apply


# Autocomplete between `-` and `_`
HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# Use neovim as editor for `zsh-vi-mode`
export ZVM_VI_EDITOR='nvim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# aliases

# TODO: Make this work even if repo is not checked out at the path ~/.dotfiles
alias termconfig="${EDITOR} ~/.dotfiles/alacritty/alacritty.yml"
alias zshconfig="${EDITOR} ~/.zshrc"
alias i3config="${EDITOR} ~/.config/i3/config"
alias nvimconfig="cd ~/.dotfiles/nvim && ${EDITOR}"
alias dotconfig="${EDITOR} ~/.dotfiles"
alias i3-control-center="XDG_CURRENT_DESKTOP=GNOME; gnome-control-center"

# Delete all local branches that are not checked out in this repo or worktree repo's
alias git-delete-local-branches="git branch | grep -v '[+*]' | xargs git branch -D"

# git commit lazy
alias gclz='git commit -m "$(date)"'

setopt +o nomatch # Don't print error if glob finds no matches
for CONFIG_FILE in ~/.zsh/external/*.zsh; do
	[ -e "$CONFIG_FILE" ] || continue
	. $CONFIG_FILE
done
setopt -o nomatch

if [ -e /home/matiaschristensen/.nix-profile/etc/profile.d/nix.sh ]; then . /home/matiaschristensen/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# nnn config
export NNN_PLUG='o:fzopen;p:preview-tui;i:imgview'
export TERMINAL='alacritty'
export NNN_FIFO='/tmp/nnn.fifo'

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, either remove the "export" as in:
    #    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    #    (or, to a custom path: NNN_TMPFILE=/tmp/.lastd)
    # or, export NNN_TMPFILE after nnn invocation
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# Add cargo to path
export PATH="${HOME}/.cargo/bin:${PATH}"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('${HOME}/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOME}/miniconda3/etc/profile.d/conda.sh" ]; then
        . "${HOME}/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="~/miniconda3/bin:${PATH}"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh

