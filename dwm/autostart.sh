#!/bin/bash

function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}

#
#/home/mahmoudhb/.config/suckless/dwm-bar/dwm_bar.sh &

#
feh --bg-fill $HOME/Pictures/wallpapers/1280x800-5422896-trance-wallpapers.jpg &

#
picom  -b  --config  $HOME/.config/picom/picom.conf &

#
/usr/bin/emacs --daemon &

#


# Launch notification daemon
dunst -config $HOME/.config/dunst/dunstrc &
