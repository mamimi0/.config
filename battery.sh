#!/usr/bin/bash
path=/sys/class/power_supply/BAT0/
status=$(cat $path/status)
capacity=$(cat $path/capacity) 
if [ $status == "Discharging" ]; then
  if [ $capacity -lt 10 ]; then DISPLAY=:0.0 notify-send "Battery is low" && aplay $HOME/sms.wav
  fi
fi
