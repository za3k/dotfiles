# X style settings go in .Xresources
xrdb -merge .Xresources

# xflux turns off blue light at night. The zipcode is for longitude only.
which xflux >/dev/null 2>/dev/null && xflux -z 45230 &

# Screen locking
xscreensaver -nosplash &

# No system bell, please
xset b off

# Computer-specific hardware settings for X windows
if which dmidecode >/dev/null 2>/dev/null; then
    system=`sudo dmidecode -s system-family 2>/dev/null` # Sudo prompting for a password causes X start to hang
    case "$system" in
        "ThinkPad T460s")
            # T460s stuff
            echo "ThinkPad T460s detected"
            # Try not to let my palm brushing the touchpad register as a mouse move
            synclient PalmDetect=1
            # Set mount sensitivity (acceleration)
            xinput --set-prop "SynPS/2 Synaptics TouchPad" 'Device Enabled' 0
            xinput --set-prop "TPPS/2 IBM TrackPoint" 'libinput Accel Speed' 0.2
            ;;
        *)
            echo "Unknown computer (edit .xinitrc): $system" >&2
            ;;
    esac
fi

case "$HOSTNAME" in
  rosemary)
    if [ -x /home/zachary/.projects/short-programs/habit-tracker ]; then
        if which xterm >/dev/null 2>/dev/null; then
            xterm /home/zachary/.projects/short-programs/habit-tracker &
        fi
    fi
    ;;
esac

# Caps lock should be escape
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# Add right alt as compose (alt_gr) key
#xmodmap -e 'remove Mod1 = Alt_R'
#xmodmap -e 'keysym Alt_R = Multi_key'

# Unmute mic + speaker
if which amixer >/dev/null 2>/dev/null; then
    amixer sset Headphone unmute 100%
fi

# Launch the wm
exec awesome
