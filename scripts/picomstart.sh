#!/bin/bash

[ "$(ps ax|grep -v grep|grep picom)" == "" ] && picom -CGb
