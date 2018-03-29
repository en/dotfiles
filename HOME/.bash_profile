#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=emacs

# Go
if [ -d "$HOME/go/bin" ]; then
    export PATH=$PATH:$HOME/go/bin
fi

# Rust
if [ -d "$HOME/.cargo" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
    export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
fi

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
