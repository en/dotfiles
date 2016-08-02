#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=emacs

# Go
if [ -d "$HOME/go" ]; then
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
fi

# Rust
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH=$PATH:$HOME/.cargo/bin
fi

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
