#!/bin/bash
ICON=$HOME/.config/i3/Icons/icon.png
import -window root $HOME/.config/i3/image.png
ss=$HOME/.config/i3/image.png
TMPBG=/tmp/screen.png
scrot /tmp/screen.png
convert $ss -scale 10% -scale 1000% $ss
convert $ss $ICON -gravity center -composite -matte $ss
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -u -i $ss
rm -r -f $HOME/.config/i3/image.png
