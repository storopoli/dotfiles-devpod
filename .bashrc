PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# LANG Stuff
export LANG=en
export LC_ALL=en_US.UTF-8

# VIM keybindings
set -o vi

# User specific environment variables
export EDITOR=nvim
export VISUAL=nvim
alias ls='ls --color=auto'
alias l='ls -CF'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -la'
alias lg=lazygit
alias testnet="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"

# System binaries
PATH="/usr/local/bin:$PATH"
# Local binaries
if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]; then
	PATH="$HOME/.local/bin:$PATH"
fi
export PATH

# Vim/Nvim
[[ "$(command -v vim)" ]] && export EDITOR=vim
[[ "$(command -v nvim)" ]] && export EDITOR=nvim

# FZF
eval "$(fzf --bash)"

# atuin
[[ "$(command -v atuin)" ]] && eval "$(atuin init bash)"

# direnv
[[ "$(command -v direnv)" ]] && eval "$(direnv hook bash)"

# rustup
[[ "$(command -v rustup)" ]] && souce "$HOME/.cargo/env"
