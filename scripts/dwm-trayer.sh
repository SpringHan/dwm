#!/bin/sh

if [ $1 == "1" ]
then
	eval "trayer --edge top --align right --expand false --width 20 &"
else
	killall trayer
fi
