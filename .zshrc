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

# == Prompt
hostname=`cat /etc/hostname`
export RPROMPT="%(?,%F{green}:%),%F{yellow}%? %F{red}:()%f"
export PS1="%~ "
case "${hostname}" in
  rosemary|tarragon)
    ;;
  *)
    export PS1="%m:$PS1"
    ;;
esac
