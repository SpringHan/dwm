#!/bin/bash

# sleep 5
# [ "$(ps ax|grep -v grep|grep fcitx)" == "" ] && fcitx5 &
sleep 5
[ "$(ps ax|grep -v grep|grep kdeconnect-indicator)" == "" ] && kdeconnect-indicator &
sleep 5

xset s 0
xset dpms 0 0 0
xset -dpms
