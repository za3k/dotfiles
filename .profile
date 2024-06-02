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

# Skip until it's done -- on pause in 2022
#[ -x ~/.projects/za3kstrap/za3kstrap ] && ~/.projects/za3kstrap/za3kstrap lint-packages
