#!/bin/bash -x

echo ".............................. Welcome to Flip Coin Simulation ............................."

#DECLARE A DICTIONARY
declare -A flipStore

#VARIABLES
isFlip=0
maximum=0
temp=0

#FUNCTION TO FIND HEAD AND TAIL COMBINATION
function findFlip()
{
	for((index=0; index<$1; index++))
	do
		side=""
		for((i=0; i<$2; i++))
		do
			#GENERATE RANDOM NUMBER
			randomNumber=$((RANDOM%2))
			if [ $randomNumber -eq $isFlip ]
			then
				side+=H
			else
				side+=T
			fi
		done
		flipStore[$side]=$((${flipStore[$side]}+1))
	done
	echo "Count of all combination     :${flipStore[@]}"
}


#FUNCTION TO FIND PERCENTAGE AND ALSO FIND MAXIMUM HEAD OR TAIL WINNING COMBINANTION
function findPercentageFlip()
{
	for j in ${!flipStore[@]}
	{
		flipStore[$j]=`echo "scale=2; $((${flipStore[$j]}))/$times*100 " | bc`
		temp=${flipStore[$j]}
		if (( $(echo "$temp >= $maximum"| bc) ))
		then
			maximum=$temp
			key=$j
		fi
	}
}

#CHECKING HEADS OR TAILS
read -p "Enter number of times you want to flip:" times
read -p "Enter choice 1)Singlet 2)Doublet 3)Triplet and so on:" coins
findFlip $times $coins
findPercentageFlip
echo "All head and tail combination:${!flipStore[@]}"
echo "percentage of all combination:${flipStore[@]}"
echo "Max winning combination      :" $maximum "-" $key
