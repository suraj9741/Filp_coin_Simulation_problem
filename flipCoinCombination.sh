##!/bin/bash -x
echo "-----------------------Flip coin Combination-------------------------"
Head=0
Tail=0
loop=0
loops=21
HH=0
HT=0
TH=0
TT=0
declare -A coin
declare -A scoin
declare -A dcoin
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
#for ((i=0;i<${#scoin[@]};i++))
#do
#        echo "${scoin[$i]}"
#done
for ((i=0;i<$((${#scoin[@]}-1));i++))
do
	#echo $i $((i+1))
	#echo "${scoin[$i]}${scoin[$((i+1))]}"
	if [ "${scoin[$i]}${scoin[$((i+1))]}" = "HH" ]
	then
		HH=$((HH+1))
		coin[HH]=$HH
		dcoin[$i]=HH
	elif [ "${scoin[$i]}${scoin[$((i+1))]}" = "HT" ]
	then
		HT=$((HT+1))
                coin[HT]=$HT
		dcoin[$i]=HT
	elif [ "${scoin[$i]}${scoin[$((i+1))]}" = "TH" ]
	then
		TH=$((TH+1))
                coin[TH]=$TH
		dcoin[$i]=TH
	elif [ "${scoin[$i]}${scoin[$((i+1))]}" = "TT" ]
	then
		TT=$((TT+1))
                coin[TT]=$TT
		dcoin[$i]=TT
	fi
done
echo "${scoin[@]}"
#for ((i=0;i<${#scoin[@]};i++))
#do
#        echo "${scoin[$i]}"
#done
echo "${dcoin[@]}"
#for ((i=0;i<((${#scoin[@]}-1));i++))
#do
#        echo "${dcoin[$i]}"
#done
echo "Counting all :"
for i in H T HH HT TH TT
do
        echo "$i : ${coin[$i]}"
done
echo "Percentage of all :"
for i in H T
do
        persentage ${coin[$i]} ${#scoin[@]}
        echo "$i = $per %"
done
for i in H T HH HT TH TT
do
	persentage ${coin[$i]} $((${#scoin[@]}-1))
	echo "$i = $per %"
done
