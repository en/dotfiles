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
if [ -d "$HOME/.cargo" ]; then
    export CARGO_HOME=$HOME/.cargo
    export PATH=$PATH:$CARGO_HOME/bin
fi

if [ -d "$HOME/github.com/rust/src" ]; then
    export RUST_SRC_PATH=$HOME/github.com/rust/src
fi

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
