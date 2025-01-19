# Mikko's config
pfetch

# enable colors
autoload -U colors && colors
setopt autocd		# Automatically cd into typed directory.

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/(\1) /p'
}

COLOR_USR=$'%B%F{blue}'
COLOR_DIR=$'%B%F{yellow}'
COLOR_DEF=$'%B%F{green}'
COLOR_GIT=$'%B%F{blue}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}❯ '

# history in cache directory
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=${ZDOTDIR}/.histfile

# ls colors
#LS_COLORS="di=1;34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
#export LS_COLORS

# auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# key binds
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

# stop odd behavior with tryong to glob match
setopt nonomatch

# aliases
alias sudo='sudo '
alias please='sudo $(fc -ln -1)'
alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias grep='grep --color=auto'
alias vim='nvim'
alias vi='nvim'
alias svim='sudo -e'
alias svi='sudo -e'
alias -- -='cd -'
alias ..='cd ..'
alias clamdscan='clamdscan --multiscan --fdpass -v'
alias yeet='paru -Rsc'
alias ssh='TERM='xterm-256color' ssh'
alias monerod='monerod --prune-blockchain --data-dir /run/media/mikko/Murderface/monero/blockchain'
alias mbsync="mbsync -c "$XDG_CONFIG_HOME"/isync/mbsyncrc"
alias ytd="yt-dlp"
alias fobs="flatpak run com.obsproject.Studio"

# load fast-syntax-highlighting
source /home/mikko/.config/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# load zsh-autosuggestions
source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh

# substring search
source /usr/share/zsh/site-functions/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Created by `pipx` on 2024-03-17 18:13:29
export PATH="$PATH:/home/mikko/.local/bin"
