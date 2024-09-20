#!/bin/bash

# Activity 1: Displaying messages
echo "The time and date are: Thu Sep 19 04:08:17 EDT 2024"

echo "Let's see who is logged into the system: 
xleefa24 pts/5        2024-09-19 02:08 (172.29.96.34)
xleefa24 pts/10       2024-09-19 04:04 (172.29.96.35)
PhamTiffanyTuyetNhung pts/13       2024-09-15 23:20
lnguyenfa24 pts/38       2024-09-19 03:29 (172.29.96.36)"

echo "For lnguyenfa24, the home directory is /mnt/scratch/FA24_CS131_Jessica/lnguyenfa24"


# Activity 2: Working with positional arguments
NAME=$1
AMOUNT_OF_MONEY=$2
echo "My name is $NAME and I have \$$AMOUNT_OF_MONEY in my wallet."

# Activity 3: Math time
mathvar1=$[1+5]
mathvar2=$[mathvar1*20]
mathvar3=10
mathvar4=$[mathvar1*(mathvar2+mathvar3)]
echo "Variable 1 is $mathvar1. Variable 2 is $mathvar2. Using $mathvar3 for Variable 3, our final Variable 4 is $mathvar4."


# Activity 4: More math. Working with floating-point solution
## using variable=$(echo "options; expression" | bc)
floating=$(echo "scale=3; 4.5/1.7" | bc)
echo "Our floating variable is $floating"

