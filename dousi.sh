#!/bin/bash
IFS=','

linecount=0
T1=""
T2=""
T3=""
while read C1 C2 C3
do
	linecount=$(( $linecount + 1 ))
	if [ "$C1" ]
	then
		T1="$C1"
	fi
	if [ "$C2" ]
	then
		T2="$C2"
	fi
	if [ "$C3" ]
	then
		T3="$C3"
	fi

	if [ "$linecount" -ge "$1" ]
	then
		if [ "$C3" ]
		then
			echo "$T1" "$T2" "$T3"
			break
		fi
	fi
done
