HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '~/.config/zsh/.zshrc'

unsetopt PROMPT_SP
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias grep='grep --color=auto'

autoload -U colors && colors	# load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd	interactive_comments	
stty stop undef		

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)

autoload -Uz compinit
compinit

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
eval "$(mise activate zsh)"
