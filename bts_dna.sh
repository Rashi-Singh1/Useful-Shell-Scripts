#!/bin/sh
read -p "Youtube address? " address
page=$(wget "$address" -O - 2>/dev/null)
title=$(echo "$page" | grep "<title>")
title=$(echo "$title" | tr "\n" "|" | grep -o '<title>.*</title>' | sed 's/\(<title>\|<\/title>\)//g;s/|/\n/g')
# title=$(echo "$title" | grep -o '<title>.*</title>' | sed 's/\(<title>\|<\/title>\)//g')
while [ 1 ]; do
	echo "Starting video"
	google-chrome --new-window "$address"
	sleep 1200
	echo "reopening window now"
	wmctrl -c "$title"
done
