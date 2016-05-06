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

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
