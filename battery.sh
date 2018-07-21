#! /bin/bash
#Simple script that checks for the battery and sends a notification it also plays a sound, nice.
cv=(24) #Critical Value
hcv=$(("$cv" / 2))
bp=$(cat /sys/class/power_supply/BAT*/capacity |awk '{print $1}')

if [ "$bp" -le "$cv"  ]; then
    notify-send -u normal -t 10000 "Battery is low" && paplay $HOME/.slow-spring-board.ogg
else
    if [ "$bp" = "$hcv" ]; then
       notify-send -u critical -t 5000 "Battery is running out" 
    fi
fi
