#!/bin/bash
	DOSI=""
	noun=T.txt
	lines=$(cat $noun | wc -l )
	line=$( expr ${RANDOM} % ${lines} )
	if [ ${line} -eq 0 ]
	then
		line="1"
	fi
	sed -n ${line}p $noun
	noun=S2.txt
	lines=$(cat $noun | wc -l )
	line=$( expr ${RANDOM} % ${lines} )
	if [ ${line} -lt 2 ]
	then
		line="2"
	fi
	sed -n ${line}p $noun | sed 's/ .*$//'
	S1=$(sed -n ${line}p $noun | sed 's/^.* //')
	if [ "$S1" = "m" ]
	then
		DOSI="J-mono.txt"
	elif [ "$S1" = "u" ]
	then
		DOSI="J-move.txt"
	elif [ "$S1" = "i" ]
	then
		DOSI="J-data.txt"
	elif [ "$S1" = "x" ]
	then
		DOSI="J-xyz.txt"
	elif [ "$S1" = "e" ]
	then
		DOSI="J-energy.txt"
	elif [ "$S1" = "s" ]
	then
		DOSI="J-sound.txt"
	elif [ "$S1" = "t" ]
	then
		DOSI="J-time.txt"
	else
		DOSI="JV.txt"
	fi
	lines=$(cat $DOSI | wc -l )
	line=$( expr ${RANDOM} % ${lines} )
	if [ ${line} -lt 2 ]
	then
		line="2"
	fi
	cat $DOSI | sed 's/\t/,/g' | bash ./dousi.sh $line
	noun=Jl.txt
	lines=$(cat $noun | wc -l )
	line=$( expr ${RANDOM} % ${lines} )
	if [ ${line} -eq 0 ]
	then
		line="1"
	fi
	sed -n ${line}p $noun
