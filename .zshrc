
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete

zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

setopt PROMPT_PERCENT
setopt PROMPT_SUBST

PROMPT='%B[%n:%F{yellow}%25<..<%~%f%<<]%b$ '

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

# git status style
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}v%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}x%f'
zstyle ':vcs_info:git:*' formats '[%F{cyan}%b%f%c%u]'
zstyle ':vcs_info:git:*' actionformats '[%F{cyan}%b (%a)%f%c%u]'

RPROMPT='%B$vcs_info_msg_0_%b'

# Plugins
# Loading completions
fpath=(/datastore/code/minimal-zsh/completions $fpath)
compinit

fpath=(/datastore/code/minimal-zsh/plugins $fpath)
autoload -Uz /datastore/code/minimal-zsh/plugins


set -o vi
