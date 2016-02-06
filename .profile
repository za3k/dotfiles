if [ -d ~/.profile.d ]; then
    for FILENAME in ~/.profile.d/*; do
        . "${FILENAME}"
    done
fi
