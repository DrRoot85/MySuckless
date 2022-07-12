#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

##
# setxkbmap fr &

# setxkbmap --model apple_laptop 
setxkbmap -model apple_laptop -layout us,ara -variant ,mac -option grp:lctrl_lwin_toggle &
##
clipmenud &
#DWMStatus
dwmstatus 2>&1 >/dev/null &


# Exec Pipewire
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &

# Exec DWM
exec dwm 


# Add this to your .xinitrc or whatever file starts programs on startup.
# -R restores the last colorscheme that was in use.
wal -R
