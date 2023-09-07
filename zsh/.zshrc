autoload -Uz compinit
compinit
export EDITOR=/usr/bin/nvim
export TERM=xterm-256color
export

PROMPT="%~$ "

# Make RVM available on Arch-based distros.
. /etc/profile.d/rvm.sh

# Set GOPATH to it's proper location.
export GOPATH=$HOME/go
