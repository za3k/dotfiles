export XAUTHORITY=/tmp/XAuthority

hostname=`cat /etc/hostname`
case "$hostname" in
    rosemary)
        echo 1 | sudo /usr/bin/tee /sys/module/snd_hda_intel/parameters/power_save >/dev/null
        ;;
esac

case "$hostname" in
    rosemary)
        if [[ '/dev/tty1' = $(/usr/bin/tty) ]]; then
            which startx >/dev/null 2>/dev/null && exec startx
        fi
        ;;
esac

[ -x .dot/lint ] && .dot/lint 2>/dev/null
