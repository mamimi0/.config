#!/bin/bash 
#Time
timeout="10000"
#Screenshot
sc=$(scrot /tmp/screen.png)

#Funcion de ImageMagick
function conv {
   convert /tmp/screen.png -blur 0x5 -gravity center ~/.config/i3/locked.png -composite /tmp/lockscreen.png 
}

$sc && conv
i3lock -i /tmp/lockscreen.png
