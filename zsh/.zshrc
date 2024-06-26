autoload -Uz compinit
compinit
export EDITOR=/usr/bin/nvim
export TERM=xterm-256color

# Move back and forward one word by using option+left-arrow / option+right-arrow
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

PROMPT="%~$ "

# Set GOPATH to it's proper location.
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN

# For syncing obsidian files.
export OBSIDIAN_VAULT="$HOME/Documents"
export PATH="$HOME/.dotfiles/obsidian-sync:$PATH"

export PATH=$PATH:/home/jakub/bin
