# Source the aliases file
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

fastfetch

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -e /home/jay/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jay/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
