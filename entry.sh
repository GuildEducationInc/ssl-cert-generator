#!/usr/bin/env sh
if [ "$1" = "daemon" ];  then
 trap "echo stop && killall crond && exit 0" SIGTERM SIGINT
 crond && while true; do sleep 1; done;
else
 /smtp-relay-automation.sh
fi