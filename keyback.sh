#!/bin/bash
checkfile=$(whereis -u brightnessctl)
echo $checkfile
if [ -z "$checkfile" ]; then
	echo "Brightnessctl not installed. Please run pacman -Sy brightnessctl"
else
	brightnesscheck=$(cat /sys/class/leds/tpacpi::kbd_backlight/brightness)
	if [ $brightnesscheck == 0 ]; then
		brightnessctl --device='tpacpi::kbd_backlight' set 1 
	elif [ $brightnesscheck == 1 ]; then
		brightnessctl --device='tpacpi::kbd_backlight' set 2 
	elif [ $brightnesscheck == 2 ]; then
		brightnessctl --device='tpacpi::kbd_backlight' set 0 
	fi
fi
