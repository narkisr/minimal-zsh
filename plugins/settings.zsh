# Setting vi mode
export EDITOR='nvim'
set -o vi

# Sudo setup
alias sudo='sudo env PATH=$PATH'
alias sudo='nocorrect sudo' # see http://tinyurl.com/8xb3pbk

# enabling 256 colors
TERM=xterm-256color

if [[ ! -s $DISPLAY && `which wmname` == "0" ]]; then
  wmname LG3D
fi

# History perserve and searching
bindkey '^R' history-incremental-search-backward
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Home bin
export PATH=$PATH:~/bin/


# virsh default uri (enable current user to see all vms)
export LIBVIRT_DEFAULT_URI="qemu:///system"

