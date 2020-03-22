#!/bin/bash

sleep 5
[ "$(ps ax|grep -v grep|grep fcitx)" == "" ] && fcitx &
