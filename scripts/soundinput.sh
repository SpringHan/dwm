#!/bin/bash

sound=$(zenity --title Sound --text Input sound --width 500 --entry 2>/dev/null)
if [[ -n "${sound}" ]];then
	eval "pactl -- set-sink-volume 0 ${sound}%"
fi
