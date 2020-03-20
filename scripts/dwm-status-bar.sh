#!/bin/bash
# This file was made for `Dynamic Window Manager`'s status bar.

print_date(){
	date '+%a %Y-%m-%d %H:%M'
}

print_uptime(){
	cat /proc/uptime | awk -F. '{run_days=$1 / 86400;run_hour=($1 % 86400)/3600;run_minute=($1 % 3600)/60 % 60;printf("%d-%d:%d",run_days,run_hour,run_minute)}'
}

print_mem(){
	a=0
	i=0
	swapSizes=0
	swapNum=$(($(awk 'END {print NR}' /proc/swaps) - 1 ))
	until [ ${a} == 1 ]
	do
		i=`expr ${i} + 1`
		line=`expr ${i} + 1`
		swapSize[${i}]=`expr $(($(sed -n ${line}p /proc/swaps | awk '{print $3}') - $(sed -n ${line}p /proc/swaps | awk '{print $4}'))) / 1024`
		swapSizes=`expr ${swapSizes} + ${swapSize[$i]}`
		if [ ${i} == ${swapNum} ]; then
			a=1
		fi
	done
	memfree=`expr $(($(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}') / 1024)) + ${swapSizes}`
	echo -e "$memfree"
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
	echo -e "$(head -c 2 /sys/class/thermal/thermal_zone0/temp)C"
}

xsetroot -name "Mem: $(print_mem)M Vol: $(print_volume) UT:[$(print_uptime)] Temp: $(print_temp) [$(print_date)]"

exit 0
