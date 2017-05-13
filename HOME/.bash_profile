#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=vim

# Go
if [ -d "$HOME/go/bin" ]; then
    export PATH=$PATH:$HOME/go/bin
fi

# Rust
if [ -d "$HOME/.cargo" ]; then
    export CARGO_HOME=$HOME/.cargo
    export PATH=$PATH:$CARGO_HOME/bin
fi

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
