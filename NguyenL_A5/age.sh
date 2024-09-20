#!/bin/bash

# Activity 1: Age
# Categorize someone based on their age

AGE=$1
CHILD_CAP=13
TEEN_CAP=20
ADULT_CAP=65

if [ $AGE -lt $CHILD_CAP ]; then
	echo "child"
elif [ $AGE -lt $TEEN_CAP ]; then
	echo "teen"
elif [ $AGE -lt $ADULT_CAP ]; then
	echo "adult"
else
	echo "elderly"
fi
