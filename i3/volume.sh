#!/bin/bash
vol=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))
value=${vol::-1}
mute=$(awk -F"[][]" '/dB/ { print $6 }' <(amixer sget Master))
vhigh=85
vmed=75
vdown=50
voff=25
vmute=5
if [[ "$mute" == "off" ]]; then
	char=" "
else
	if [[ "$value" -lt "vmute" ]]; then
		char=""
	elif [[ "$value" -lt "voff" ]]; then
		char=""
	elif [[ "$value" -lt "vdown" ]]; then
		char=""
	elif [[ "$value" -lt "vmed" ]]; then
		char="♪"
	elif [[ "$value" -lt "vhigh" ]]; then
		char="♪♪"
	else
		char="♪♪♪"
	fi
fi

echo "$char $vol"
