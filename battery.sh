#!/usr/bin/bash
path=/sys/class/power_supply/BAT0/
status=$(cat $path/status)
if [ $status == "Discharging" ]; then
  capacity=$(cat $path/capacity) 
    if [ $capacity -lt 10 ]; then DISPLAY=:0.0 notify-send "Battery is low" && aplay $HOME/sms.wav
  fi
fi
