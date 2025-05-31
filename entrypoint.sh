#!/bin/sh
# vim:sw=4:ts=4:et

set -e

if [ -z "${SS_ENTRYPOINT_QUIET_LOGS:-}" ]; then
    exec 3>&1
else
    exec 3>/dev/null
fi

if [ "$1" = "sslocal" -o "$1" = "ssserver" -o "$1" = "ssmanager" -o "$1" = "ssservice" ]; then
    if [ -f "/.ssconfig.json" ]; then
        echo >&3 "$0: Configuration complete; ready for start up"
    else
        echo >&3 "$0: No configuration files found in /, skipping configuration"
    fi

    COREVER=$(uname -r | grep -Eo '[0-9].[0-9]+' | sed -n '1,1p')
    CMV=$(echo $COREVER | awk -F '.' '{print $1}')
    CSV=$(echo $COREVER | awk -F '.' '{print $2}')

    if [ $(echo "$CMV >= 3" | bc) ]; then
        if [ $(echo "$CSV > 7" | bc) ]; then
        TFO='--tcp-fast-open'
        fi
    fi 
    RT_ARGS="-U $TFO $ARGS"
fi

exec $@ $RT_ARGS