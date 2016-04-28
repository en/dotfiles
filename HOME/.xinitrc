#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# if [ -f ~/.fehbg ]; then
#     sh ~/.fehbg &
# fi

xset b off &
# disable DPMS and prevent screen from blanking
xset s off -dpms

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
exec awesome
