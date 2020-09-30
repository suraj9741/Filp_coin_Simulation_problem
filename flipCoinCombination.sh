##!/bin/bash -x
echo "-----------------------Flip coin Combination-------------------------"
H=0
T=0
loop=0
loops=21
HH=0
HT=0
TH=0
TT=0
HHH=0
HHT=0
HTH=0
HTT=0
THH=0
THT=0
TTH=0
TTT=0
declare -A coin
declare -A scoin
declare -A dcoin
declare -A tcoin
declare -A coint
coin_flip(){
	n=$((RANDOM%2))
	if [ $n -eq 1 ]
	then
		H=$((H+1))
		coin[H]=$H
		scoin[$1]=H
	else
		T=$((T+1))
		coin[T]=$T
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
for ((i=0;i<$((${#scoin[@]}-2));i++))
do
        #echo $i $((i+1))
        #echo "${scoin[$i]}${scoin[$((i+1))]}${scoin[$((i+2))]}"
        if [ "${scoin[$i]}${scoin[$((i+1))]}${scoin[$((i+2))]}" = "HHH" ]
        then
                HHH=$((HHH+1))
                coin[HHH]=$HHH
                tcoin[$i]=HHH
        elif [ "${scoin[$i]}${scoin[$((i+1))]}${scoin[$((i+2))]}" = "HHT" ]
        then
                HHT=$((HHT+1))
                coin[HHT]=$HHT
                tcoin[$i]=HHT
        elif [ "${scoin[$i]}${scoin[$((i+1))]}${scoin[$((i+2))]}" = "HTH" ]
        then
                HTH=$((HTH+1))
                coin[HTH]=$HTH
                tcoin[$i]=HTH
        elif [ "${scoin[$i]}${scoin[$((i+1))]}${scoin[$((i+2))]}" = "HTT" ]
        then
                HTT=$((HTT+1))
                coin[HTT]=$HTT
                tcoin[$i]=HTT
	elif [ "${scoin[$i]}${scoin[$((i+1))]}${scoin[$((i+2))]}" = "THH" ]
        then
                THH=$((THH+1))
                coin[THH]=$THH
                tcoin[$i]=THH
	elif [ "${scoin[$i]}${scoin[$((i+1))]}${scoin[$((i+2))]}" = "THT" ]
        then
                THT=$((THT+1))
                coin[THT]=$THT
                tcoin[$i]=THT
	elif [ "${scoin[$i]}${scoin[$((i+1))]}${scoin[$((i+2))]}" = "TTH" ]
        then
                TTH=$((TTH+1))
                coin[TTH]=$TTH
                tcoin[$i]=TTH
	elif [ "${scoin[$i]}${scoin[$((i+1))]}${scoin[$((i+2))]}" = "TTT" ]
        then
                TTT=$((TTT+1))
                coin[TTT]=$TTT
                tcoin[$i]=TTT
        fi
done
echo "Total Singlet Combination = ${#scoin[@]}"
echo "${scoin[@]}"
#for ((i=0;i<${#scoin[@]};i++))
#do
#        echo "${scoin[$i]}"
#done
echo "Total Doublet Combination = $((${#scoin[@]}-1))"
echo "${dcoin[@]}"
#for ((i=0;i<((${#scoin[@]}-1));i++))
#do
#        echo "${dcoin[$i]}"
#done
echo "Total Triplet Combination = $((${#scoin[@]}-2))"
echo "${tcoin[@]}"
#for ((i=0;i<((${#scoin[@]}-2));i++))
#do
#        echo "${tcoin[$i]}"
#done
echo "Counting all :"
for i in H T HH HT TH TT HHH HHT HTH HTT THH THT TTH TTT
do
        echo "$i : $(($i))"
done
echo "Percentage of all :"
for i in H T
do
        persentage $(($i)) ${#scoin[@]}
        echo "$i = $per %"
done
for i in HH HT TH TT
do
	persentage $(($i)) $((${#scoin[@]}-1))
	echo "$i = $per %"
done
for i in HHH HHT HTH HTT THH THT TTH TTT
do
        persentage $(($i)) $((${#scoin[@]}-2))
        echo "$i = $per %"
done

