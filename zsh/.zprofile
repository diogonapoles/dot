# export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin:$PATH"

export ZSH="$ZDOTDIR/.oh-my-zsh"
# export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

if [[ -f ~/.zshrc ]] then
  source ~/.zshrc
fi
