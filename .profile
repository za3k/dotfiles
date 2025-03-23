export XAUTHORITY=/tmp/XAuthority

[ -f /etc/profile.d/debuginfod.sh ] && . /etc/profile.d/debuginfod.sh

hostname=`cat /etc/hostname`
case "$hostname" in
    rosemary)
        echo 1 | sudo /usr/bin/tee /sys/module/snd_hda_intel/parameters/power_save >/dev/null
        ;;
esac

case "$hostname" in
    rosemary)
        if [[ '/dev/tty1' = $(/usr/bin/tty) ]]; then
            which startx >/dev/null 2>/dev/null && exec startx &>/dev/null
        fi
        ;;
esac

case "$hostname" in
    rosemary)
        : # Skip until it's done -- on pause in 2022
        ;;

    juice)
        [ -x ~/.projects/za3kstrap/za3kstrap ] && ~/.projects/za3kstrap/za3kstrap lint-packages

        ;;
esac

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/zachary/.opam/opam-init/init.sh' && . '/home/zachary/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
# END opam configuration
