#!/bin/sh

. $HOME/.profile.d/colors.sh

export CLICOLOR=1
export TERM="xterm-color"
export GREP_OPTIONS='--color=auto -r'

POINTER_CHAR="⬆"
PREINFO="\n$POINTER_CHAR $BIBLUE[ "$BICYAN"exit: $BIWHITE\$?$BIBLUE ] [ "$BICYAN"time: $BIWHITE\t$BIBLUE ]$END_COLOR"
PREGIT="$PREINFO\n$BIWHITE\u$BIBLUE@$BIRED\h$BIWHITE \w$END_COLOR"
POSTGIT=" $BIRED\$$END_COLOR "

#export PROMPT_COMMAND='__git_ps1 "\n\u@\h \w" " \\\$ "'
#export PROMPT_COMMAND='__git_ps1 "\n[exit: $?] [time: \t]\n\[\e[01;37m\]\u\[\e[01;34m\]@\[\e[01;31m\]\h\[\e[01;37m\] \w\[\e[0m\]" " \[\e[01;31m\]\$\[\e[0m\] "'
export PROMPT_COMMAND="__git_ps1 \"$PREGIT\" \"$POSTGIT\""

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"

function bt {
    echo -ne "\033]0;"$*"\007"
}
