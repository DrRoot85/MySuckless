#!/bin/sh

# Import the colors
. "${HOME}/.cache/wal/colors.sh"

dmenu -c -l 10 -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"
