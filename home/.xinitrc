#!/bin/bash

#-------------------------------#
#  ╻ ╻╻┏┓╻╻╺┳╸┏━┓┏━╸            #
#  ┏╋┛┃┃┗┫┃ ┃ ┣┳┛┃              #
# ╹╹ ╹╹╹ ╹╹ ╹ ╹┗╸┗━╸            #
# by Morgareth                  #
# no login manager since forever#
#-------------------------------#


##----------------------------------------------------------------------------##
## Update Xresources
##----------------------------------------------------------------------------##

if [ -f .Xresources ] ; then
    xrdb ~/.Xresources
fi

##----------------------------------------------------------------------------##
## Fonts
##----------------------------------------------------------------------------##

xset +fp /home/morgareth/.fonts/
xset fp rehash

##----------------------------------------------------------------------------##
## General settings
##----------------------------------------------------------------------------##

#typematic delay/ rate
xset r rate 300 50

#Change blank time to 1 hour
xset s 3600 3600

#no bell
xset b off

# set monitor to sleep
xset s 600 600

xrandr --dpi 96
xrandr --auto

##----------------------------------------------------------------------------------------------------------------------##
## Autostart programs + scripts
##----------------------------------------------------------------------------------------------------------------------##

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


devmon --exec-on-drive   "notify-send -t 3000 --icon=drive-removable-media --urgency=low \"Device %f %l has been Automounted\"" \
       --exec-on-unmount "notify-send -t 3000 --icon=drive-removable-media --urgency=low \"Device %f %l has been Unmounted\""  \
       --exec-on-remove  "notify-send -t 3000 --icon=drive-removable-media --urgency=low \"Device %f has been Removed\"" &
udevil &
earlyoom &
[ ! -s ~/.config/mpd/pid ] && mpd
xsetroot -cursor_name left_ptr &
hsetroot -fill Walpapers/the-great-wave.png &
xcompmgr -cCfF -t-9 -l-11 -r5 -o 0.18 -l-6 -t-4 -D8 -I 0.020 -O 0.020  &
(sleep 2s && dunst) &
redshift -l -18.914608:-48.275380 -g 0.8 -m randr -v  &
numlockx on  &
nmpc   &
sxhkd &
exec bspwm
