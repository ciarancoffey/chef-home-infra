#!/bin/bash
while true; do
    TVON=''
    ping -c1 -W1 10.2.2.10 1>2 > /dev/null || TVON="nope"
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
            bash -i -c "/usr/bin/boblightd -f  1>2 > /dev/null &"
        fi
    fi
    sleep 1
done
