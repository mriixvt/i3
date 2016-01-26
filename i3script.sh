#!/bin/bash

# shell scipt to prepend i3status with more stuff

i3status --config ~/.i3/i3status.conf | while :
do
        read line
		LG=$(setxkbmap -query | awk '/layout/{print $2}') 
		if [ $LG == "us" ]
		then
			dat="[{ \"full_text\": \"$LG\", \"color\":\"#009E00\" },"
		else
			dat="[{ \"full_text\": \"$LG\", \"color\":\"#C60101\" },"
		fi
		if [ $LG == "ru" ]
		then
			dat="[{ \"full_text\": \"$LG\", \"color\":\"#0000FF\" },"
		fi
		echo "${line/[/$dat}" || exit 1
done
