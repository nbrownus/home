export CLICOLOR=1
export TERM="xterm-color"
export GREP_OPTIONS='--color=auto -r'
export PROMPT_COMMAND='__git_ps1 "\n\u@\h \w" " \\\$ "'
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"

function bt {
    echo -ne "\033]0;"$*"\007"
}
