# Non-zsh specific stuff
if [ -e ~/.shellrc ]; then
    . ~/.shellrc
fi

# Zsh specific stuff
bindkey -e # Emacs mode
setopt interactivecomments

# == History
export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
export HISTFILE="${XDG_DATA_HOME}/zsh/history" # relies on 'xdg' being sourced
mkdir -p $(dirname $HISTFILE)

# == Keyboard
# Home/end outside tmux
bindkey "[H" beginning-of-line
bindkey "[F" end-of-line
# Home/end inside tmux
bindkey "[1~" beginning-of-line
bindkey "[4~" end-of-line

# == Time
#export REPORTTIME=60
#export TIMEFMT="  %*E execution time (clock)"

# == Prompt
function preexec() {
  timer=$(($(\date +%s%0N)/1000000))
}
function precmd() {
  if [ $timer ]; then
    now=$(($(\date +%s%0N)/1000000))
    elapsed=$(($now-$timer))

    if [ $elapsed -lt 2000 ]; then
        TIME="${elapsed}ms"
    else
        elapsed=$((elapsed/1000))
        TIME="${elapsed}s"
    fi
    export RPROMPT="%F{cyan}${TIME} %{$reset_color%} %(?,%F{green}:%),%F{yellow}%? %F{red}:()%f"
    unset timer
  fi
}

hostname=`cat /etc/hostname`
export RPROMPT="%(?,%F{green}:%),%F{yellow}%? %F{red}:()%f"
export PS1="%~ "
case "${hostname}" in
  rosemary|tarragon)
    export PS1="%~ $"
    ;;
  *)
    export PS1="%m:%1~ $ "
    ;;
esac
