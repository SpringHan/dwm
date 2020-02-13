#!/bin/bash
# This file was made for `Dynamic Window Manager`'s status bar.

print_date(){
	date '+%a %Y-%m-%d %H:%M'
}

print_volume() {
	volume="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
	if test "$volume" -gt 0
	then
		echo -e "${volume}%"
	else
		echo -e "Mute"
	fi
}

print_temp(){
	test -f /sys/class/thermal/thermal_zone0/temp || return 0
	echo $(head -c 2 /sys/class/thermal/thermal_zone0/temp)C
}

xsetroot -name "Volume: $(print_volume) CPU: $(print_temp) $(print_date)"

exit 0
