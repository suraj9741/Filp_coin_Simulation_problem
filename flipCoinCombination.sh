##!/bin/bash -x
echo "-----------------------Flip coin Combination-------------------------"
coin_flip(){
	n=$((RANDOM%2))
	if [ $n -eq 1 ]
	then
		echo "Head"
	else
		echo "Tail"
	fi
}
coin_flip
