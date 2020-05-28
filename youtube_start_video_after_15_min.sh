#!/bin/sh
read -p "Youtube address? " address
read -p "Restart after how many (+ve int) minutes? " min
page=$(wget "$address" -O - 2>/dev/null)
title=$(echo "$page" | grep "<title>")
title=$(echo "$title" | tr "\n" "|" | grep -o '<title>.*</title>' | sed 's/\(<title>\|<\/title>\)//g;s/|/\n/g')
# title=$(echo "$title" | grep -o '<title>.*</title>' | sed 's/\(<title>\|<\/title>\)//g')
echo "Starting video"
while [ 1 ]; do
	google-chrome --new-window --mute-audio "$address"
	echo `expr $min \* 60`
	sleep `expr $min \* 60`
	echo "reopening window now"
	echo $title
	wmctrl -c $title
done
