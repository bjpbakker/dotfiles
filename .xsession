xrdb -override ~/.Xresources
xsetroot -cursor_name left_ptr
xrandr --dpi 220

xset s off
xset +dpms
xset r rate 200 30
xset m 30/10 4

# set the background image
# feh --bg-scale /path/to/image.png

# start a window compositor
# xcompmgr -n &

emacs &
urxvt &
exec xmonad
