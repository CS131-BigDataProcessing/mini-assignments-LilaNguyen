#!/bin/bash

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
