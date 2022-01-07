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
alias zshconfig="${EDITOR} ~/.zshrc"
alias i3config="${EDITOR} ~/.config/i3/config"
alias nvimconfig="cd ~/.dotfiles/nvim && ${EDITOR}"
alias dotconfig="${EDITOR} ~/.dotfiles"

# git commit lazy
alias gslz='git commit -m "$(date)" && git push'

setopt +o nomatch # Don't print error if glob finds no matches
for CONFIG_FILE in ~/.zsh/external/*.zsh; do
	[ -e "$CONFIG_FILE" ] || continue
	. $CONFIG_FILE
done
setopt -o nomatch

if [ -e /home/matiaschristensen/.nix-profile/etc/profile.d/nix.sh ]; then . /home/matiaschristensen/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/matiasvc/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/matiasvc/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/matiasvc/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/matiasvc/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh

