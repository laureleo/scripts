#!/bin/bash

# Bash script for controlling brightness using xrandr

#First positional argument into the bash script 


BRIGHT=$(cat brightness_curr_val)
screen_name=$(xrandr | grep " connected" | cut -f1 -d " ") 

if [ "$1" = '+' ]; then
    NEWBRIGHT=$(echo "$BRIGHT + 0.05" | bc)
    if [ "$(echo "$NEWBRIGHT > 1.0" | bc)" -eq 1 ]; then
        NEWBRIGHT='1.0'
    fi
elif [ "$1" = '-' ]; then
    NEWBRIGHT=$(echo "$BRIGHT - 0.05" | bc)
    if [ "$(echo "$NEWBRIGHT < 0.15" | bc)" -eq 1 ]; then
        NEWBRIGHT='0.15'
    fi
fi

#Update the stored brighness value
echo $NEWBRIGHT > brightness_curr_val

echo -e "[info]: Screen Brightness set to "$NEWBRIGHT"%"
xrandr --output $screen_name --brightness $NEWBRIGHT
