# Record all interactive shell sessions
if [[ -f /bin/record-shell && -z "$RECORDING" && $- == *i* ]]; then if shopt -q login_shell; then :; else exec /bin/record-shell; fi; fi

# Non-bash-specific stuff
if [ -e ~/.shellrc ]; then
    . ~/.shellrc
fi

# == Bash completion
# enable programmable completion features (you don't need to enable this, if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if [ -e /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# == Record Script
record() { history | tail -1 | awk '{ print 1+$1 }' > /tmp/record; }
replay() { fc -l `cat /tmp/record` `history | tail -1 | awk '{ print $1-1 }'` | cut -d\  -f2-; }

# == Super-minimal prompt
hostname=`cat /etc/hostname`
case "${hostname}" in
  giant-ant)
    export PS1="\[[35m\]\w\[[m\] \[[31m\]a\[[m\] \$ "
    ;;
  giant-queen-bee)
    export PS1="\[[35m\]\w\[[m\] \[[37m\]b\[[m\] \$ "
    ;;
  rosemary)
    export PS1="\w \$ "
    ;;
  *)
    export PS1="\h:\w \$ "
    ;;
esac

# == Eternal history
# Don't put duplicate lines in the history
HISTCONTROL=ignoredups
# Append to the history file, don't overwrite it
shopt -s histappend
# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=infinite
# Creates an eternal bash log in the form
# Add hook. Must appear AFTER sourcing the prompt
# PID USER INDEX TIMESTAMP COMMAND
export HISTTIMEFORMAT="%s "
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo $$ $USER \
                   "$(history 1)" >> ~/.bash_eternal_history && echo $$ $USER $(history 1) | /bin/log bash'

# == Shell UI
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# Visual bell
set bell-style=visual
