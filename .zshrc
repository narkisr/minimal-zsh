
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete

zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

setopt PROMPT_PERCENT
setopt PROMPT_SUBST


autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='%F{red} ✘ %f'
    fi
}

# git status style
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{red} ✘ %f'
zstyle ':vcs_info:*' unstagedstr '%F{red} ✘  %f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:git:*' formats ' %F{cyan}%b%f%c%u'
zstyle ':vcs_info:git:*' actionformats ' %F{cyan}%b (%a)%f%c%u '

PROMPT='%F{blue}% %m ➜  %B%F{white}%n:%F{yellow}%25<..<%~%f%<<%b%B$vcs_info_msg_0_%b$ '

# Loading completions
fpath=(~/.minimal-zsh/completions $fpath)
compinit


# Plugins
for file in ~/.minimal-zsh/plugins/*; do
   source "$file"
done

# load z if it exists
source /opt/z/z.sh
