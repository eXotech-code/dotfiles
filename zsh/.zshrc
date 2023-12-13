autoload -Uz compinit
compinit
export EDITOR=/usr/bin/nvim
export TERM=xterm-256color

# Move back and forward one word by using option+left-arrow / option+right-arrow
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

PROMPT="%~$ "

# Make RVM available on Arch-based distros.
. /etc/profile.d/rvm.sh

# Set GOPATH to it's proper location.
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN
