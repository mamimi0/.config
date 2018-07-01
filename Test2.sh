#!/bin/bash
# HDMI
hdmi_check=$(xrandr |grep ' connected' |grep 'HDMI' |awk '{print $1}')
#sound_normal=$(pactl set-card-profile 0 output:analog-stereo) 

if [ ! -z "$hdmi_check" ]; then
   xrandr --output VIRTUAL1 --off --output eDP1 --off --output DP1 --off --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP2 --off  && pactl set-card-profile 0 output:hdmi-stereo 
   nitrogen --restore
   polystart&
else
   echo "Conecte la entrada de HDMI"
   exit 1
fi

#normal_mode=$(xrandr --output VIRTUAL1 --off --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off) 
