# Setting vi mode
set -o vi

# Sudo setup
alias sudo='sudo env PATH=$PATH'
alias sudo='nocorrect sudo' # see http://tinyurl.com/8xb3pbk

# enabling 256 colors
TERM=xterm-256color

if [[ ! -s $DISPLAY && `which wmname` == "0" ]]; then
  wmname LG3D
fi
