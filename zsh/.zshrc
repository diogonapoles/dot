HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '~/.config/zsh/.zshrc'

unsetopt PROMPT_SP
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

[[ $- != *i* ]] && return
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias cd="z"
alias grep='grep --color=auto'

autoload -U colors && colors	# load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd	interactive_comments	
stty stop undef		

plugins=(
  fast-syntax-highlighting
  git 
  mvn
  terraform
  you-should-use
  zsh-docker-aliases
  zsh-autosuggestions 
  zsh-syntax-highlighting 
)

autoload -Uz compinit
compinit

source $ZSH/oh-my-zsh.sh

eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

eval "$(thefuck --alias)"
eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
