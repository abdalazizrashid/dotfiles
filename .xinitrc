#!/bin/sh

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# Statusbar loop
while true; do
	xsetroot -name "$( date +"%F %R" ) | $(cat /sys/class/power_supply/BAT0/capacity)"
   sleep 1m    # Update time every minute
done &


#xrandr --output eDP-1 --dpi 192 & 
xrdb -merge ~/.Xresources 
xss-lock -l -- screenlock -n &
unclutter &
exec sxhkd &
exec i3 
