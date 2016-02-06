if [ -e ~/.shellrc ]; then
    . ~/.shellrc
fi
if [ -d ~/.bash.d ]; then
    for FILENAME in ~/.bash.d/*; do
        . "${FILENAME}"
    done
fi
