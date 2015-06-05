#!/bin/sh

# gpg-agent is king of stupid and kills sockets if you use it to test if an agent already exists
echo "/bye" | gpg-connect-agent > /dev/null 2>&1
if [ "$?" != "0" ]; then
    gpg-agent --daemon --options "$HOME/.gnupg/gpg-agent.conf" --write-env-file "${HOME}/.gpg-agent-info"
fi

. "${HOME}/.gpg-agent-info"
export GPG_AGENT_INFO
export SSH_AUTH_SOCK
export SSH_AGENT_PID

GPG_TTY=$(tty)
export GPG_TTY
