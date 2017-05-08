[ -f ~/.env ] && source ~/.env

xrdb -override ~/.Xresources
xsetroot -cursor_name left_ptr

# Set DPI depending on the screen. When the
# screen's resolution is '2560x1440' the
# 27" Thunderbolt Cinema is hooked up and the
# MBP is running in "closed-display mode".
#
# Otherwise we're on either the MBPs retina or
# on the Thunderbolt with retina resolutions. Both
# of which need 220 PPI.
resolution=$(xdpyinfo | awk /dimensions/'{print $2}')
if [ "$resolution" == "2560x1440" ]; then
    ppi="109"
else
    ppi="220"
fi

xrandr --dpi $ppi
xrdb -override <<EOF
Xft.dpi: $ppi
EOF

# Tweak mouse constant deceleration
xinput set-prop 7 258 0.4 # VMware VMware Virtual USB Mouse
xinput set-prop 9 258 0.4 # ImPS/2 Generic Wheel Mouse

xset s off
xset +dpms
xset r rate 300 50
xset m 3/1 4

feh --no-fehbg --bg-max ~/wallpapers/astromech.jpg

# start a window compositor
# xcompmgr -n &

emacs &
urxvt &
exec xmonad
