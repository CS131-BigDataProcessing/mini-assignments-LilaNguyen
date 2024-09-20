#!/bin/bash

# Activity 2: Temperature in California
# Write a script to ask if it's hot or cold today, based on the weather.

TEMP=$1
FREEZING_CAP=67
HOT_CAP=85

if [ $TEMP -gt 55 -a $TEMP -lt $FREEZING_CAP ]; then
	echo "cold"
elif [ $TEMP -gt $FREEZING_CAP -a $TEMP -lt $HOT_CAP ]; then
	echo "nice"
elif [ $TEMP -gt $HOT_CAP ]; then
	echo "hot"
else
	echo "freezing"
fi
