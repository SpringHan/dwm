#!/bin/bash

[ "$(ps ax|grep -v grep|grep -e "picom -CGb")" == "" ] && picom -CGb
