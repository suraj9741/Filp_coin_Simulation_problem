##!/bin/bash -x
echo "-----------------------Flip coin Combination-------------------------"
Head=0
Tail=0
loop=0
loops=21
declare -A coin
declare -A scoin
coin_flip(){
	n=$((RANDOM%2))
	if [ $n -eq 1 ]
	then
		Head=$((Head+1))
		coin[H]=$Head
		scoin[$1]=H
	else
		Tail=$((Tail+1))
		coin[T]=$Tail
		scoin[$1]=T
	fi
}
persentage(){
	per=$(awk 'BEGIN { print '$1' / '$2' * '100'}')
}
while [ $loop -lt $loops ]
do
	coin_flip $loop
	loop=$((loop+1))
done
echo "Heades = $Head & Tails = $Tail Out of = $loops"
echo "${scoin[@]}"
for i in "${!coin[@]}"
do
        echo "$i : ${coin[$i]}"
done
persentage $Head $loops
echo "Head = $per %"
persentage $Tail $loops
echo "Tail = $per %"
