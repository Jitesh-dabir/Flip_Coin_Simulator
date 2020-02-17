#!/bin/bash -x

echo ".............................. Welcome to Flip Coin Simulation ............................."

#VARIABLE
isFlip=1

#GENERATE RANDOM NUMBER
randomNumber=$((RANDOM%2))

#CHECKING HEADS OR TAILS
if [ $randomNumber -eq $isFlip ]
then
	echo "It is Heads"
else
	echo "It is Tails"
fi
