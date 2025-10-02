#!/bin/bash

hora=$(date +%H)

if [ $hora -ge 8 ] && [ $hora -le 15 ]; then
	echo "Buenos días"
elif [ $hora -ge 15 ] && [ $hora -le 20 ]; then
	echo "Buenas tardes"
else
	echo "Buenas noches"
fi


