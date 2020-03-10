#!/bin/bash

time=$(date "+%H")

if [ ${time} -ge 18 ] || [ ${time} -lt 6 ]
then
	feh --randomize --bg-fill ~/picture_dark
else
	feh --randomize --bg-fill ~/picture
fi
