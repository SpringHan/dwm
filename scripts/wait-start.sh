#!/bin/bash

sleep 5
[ "$(ps ax|grep -v grep|grep fcitx)" == "" ] && fcitx5 &
sleep 5
[ "$(ps ax|grep -v grep|grep kdeconnect-indicator)" == "" ] && [ "$(ps ax|grep -v grep|grep fcitx)" != "" ] && kdeconnect-indicator &
