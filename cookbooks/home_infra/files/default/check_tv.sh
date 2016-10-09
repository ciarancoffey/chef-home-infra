#!/bin/bash
while true; do
    TVON=''
    ping -c1 -W1 10.0.0.110 1>2 > /dev/null || TVON="nope"
    if [ "$TVON" = "nope" ]
    then
        #echo "I should kill boblight"
        if [ ! -z "$(pidof boblightd)" ]
        then
            pkill boblightd
        fi
    else 
        #echo "I should check if bobligh is runnung"
        if [ "$(pidof boblightd)" ]
        then
            echo "boblight is running, doing nothing"
        else
            echo "Let's run boblight"
            boblightd -f  1>2 > /dev/null &
        fi
    fi
    sleep 1
done