# *** Pre instant-prompt setup

# Set up anything that may produce output and therefore need to be before the instant prompt

# Set the OpenAI API key.
# As calling the 1password CLI is slow, we cache the key to `/tmp/OPENAI_API_KEY`
OPENAI_API_KEY_FILE='/tmp/OPENAI_API_KEY'
if [[ -f "${OPENAI_API_KEY_FILE}" ]]; then
  export OPENAI_API_KEY=$(< "${OPENAI_API_KEY_FILE}")
fi

init-openai() {
  OPENAI_API_KEY_TMP=$(op read "op://Personal/OpenAI/environment-variable")
  
  if [[ $? -eq 0 ]] && [[ -n "${OPENAI_API_KEY_TMP}" ]]; then
    echo "${OPENAI_API_KEY_TMP}" > "${OPENAI_API_KEY_FILE}"
    export OPENAI_API_KEY=$(< "${OPENAI_API_KEY_FILE}")
  else
    echo "Warning! Could not read OpenAI API key from 1password."
  fi
}


# Setup ssh-agent
emulate ksh -c "source $(which ssh-find-agent.sh)"
ssh-add -l >&/dev/null || ssh-find-agent -a || eval $(ssh-agent) > /dev/null

# Load fzf
if [[ ! "$PATH" == *${HOME}/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}${HOME}/.fzf/bin"
fi

# Auto-completion
# ---------------
source "${HOME}/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "${HOME}/.fzf/shell/key-bindings.zsh"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Antigen
source ${HOME}/.zsh/antigen.zsh

antigen use oh-my-zsh

# Plugins from oh-my-zsh
antigen bundle git
antigen bundle bazel
antigen bundle command-not-found

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jeffreytse/zsh-vi-mode

antigen theme romkatv/powerlevel10k

antigen apply


# *** Environment variables ***

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

export PATH="${HOME}/.dotfiles/tools/zig-linux-x86_64-0.12.0-dev.3340+1b8d1b18c/:${PATH}"

# *** Aliases ***

# TODO: Make this work even if repo is not checked out at the path ~/.dotfiles
alias termconfig="${EDITOR} ~/.dotfiles/alacritty/alacritty.yml"
alias zshconfig="${EDITOR} ~/.zshrc"
alias i3config="${EDITOR} ~/.config/i3/config"
alias nvimconfig="cd ~/.dotfiles && nvim -O nvim nvim_bak"
alias dotconfig="${EDITOR} ~/.dotfiles"
alias i3-control-center="XDG_CURRENT_DESKTOP=GNOME; gnome-control-center"
alias find-todos-all="rg -n TODO"
alias find-todos-mine="rg -n 'TODO\((Matias|matias|MATIAS)\)'"
alias print-path-pretty='echo $PATH | tr ":" "\n"'

# Delete all local branches that are not checked out in this repo or worktree repo's
alias git-delete-local-branches="git branch | grep -v '[+*]' | xargs git branch -D"

# Setup local git user and email for repo
# TODO: Update this when I have a @varnum.
alias git-setup-local-user="git config user.name 'Matias Varnum' && git config user.email 'mattivc@gmail.com'"

# git commit lazy
alias gclz='git commit -m "$(date)"'



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


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh


# *** Load external config files ***

setopt +o nomatch # Don't print error if glob finds no matches
for CONFIG_FILE in ~/.zsh/external/*.zsh; do
	[ -e "$CONFIG_FILE" ] || continue
	. $CONFIG_FILE
done
setopt -o nomatch


if [ -e /home/matiaschristensen/.nix-profile/etc/profile.d/nix.sh ]; then . /home/matiaschristensen/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
