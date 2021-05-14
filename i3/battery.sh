#!/bin/bash 
status=$(acpi)
battery=$(acpi -b 2>/dev/null | head -1 | awk '{print $4}' | tr -d '%[,;]')
remaing=$(acpi -b 2>/dev/null | head -1 | awk '{print $5}' | tr -d '%[,;]')
full=100
three=75
mid=50
low=25
empty=15
color=7
if [[ "$status" == *"Charging"* ]]; then
	char="$(tput setaf 2)"
else
	if [[ "$battery" -lt "$empty" ]]; then
		char="$(tput setaf 1) "
	elif [[ "$battery" -lt "$low" ]]; then
		char="$(tput setaf 3) "
	elif [[ "$battery" -lt "$mid" ]]; then
		char=" "
	elif [[ "$battery" -lt "$three" ]]; then
		char=" "
	else
		char=" "
	fi
fi

echo "$char $(tput setaf 7)$battery%"
