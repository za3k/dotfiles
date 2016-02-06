# X style settings go in .Xresources
xrdb -merge .Xresources
# xflux turns off blue light at night. The zipcode is for longitude only.
xflux -z 94702 &
# Try not to let my palm brushing the touchpad register as a mouse move
synclient PalmDetect=1
# Screen locking
xscreensaver -nosplash &
# No system bell, please
xset b off
# Caps lock should be escape
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
# Launch the wm (ratpoison reads .ratpoisonrc, which loads real WM)
exec ratpoison
