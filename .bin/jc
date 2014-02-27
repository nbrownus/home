#!/bin/sh

set -e

if [ -z "$1" ]
then
    echo "Usage: jc <hostname>" >&2
    exit 1
fi

PORT="$((49152 + $(date +"%s") % 10000))"

ssh -D"$PORT" -N "$1" &
trap "kill \"$!\"" EXIT INT QUIT TERM

jconsole -J-DsocksProxyHost="127.0.0.1" -J-DsocksProxyPort="$PORT" "service:jmx:rmi:///jndi/rmi://$1:${2:-"7199"}/jmxrmi"
