#!/bin/sh
# Script to configure X, start common apps, and start xmonad.

# Configure PATH so that we can access our scripts below
PATH=$PATH:~/.cabal/bin:~/bin

# Configure X
xsetroot -cursor_name left_ptr &
xrdb -merge ~/.Xdefaults &
setxkbmap -layout us -variant altgr-intl
xmodmap ~/.Xmodmap

# start urxvt daemon
urxvtd --quiet --opendisplay --fork

# Start redshift
redshift -l 53.5:9.9 -t 4500:3800 &

# Start screensaver
xscreensaver &
exec $HOME/.cabal/bin/xmonad
