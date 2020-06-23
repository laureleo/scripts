#!/bin/bash

# Bash script for controlling brightness

echo -e "[info]: Changing Brightness. Value is:"
#First positional argument into the bash script 

#Location of brightness file
DIR="/sys/class/backlight/intel_backlight/brightness"

#Brightness value
BRIGHT=$(cat $DIR)

#echo -e "[info]: Old value "$BRIGHT""
if [ "$1" = '+' ]; then
    NEWBRIGHT=$(echo "$BRIGHT + 10000" | bc)
elif [ "$1" = '-' ]; then
    NEWBRIGHT=$(echo "$BRIGHT - 10000" | bc)
fi

#echo -e "[info]: New value "$NEWBRIGHT""

#Update the stored brighness value
echo $NEWBRIGHT | sudo tee $DIR

