#!/bin/bash
	noun=T.txt
	shuf -n 1 "${noun}"
	noun=S2.txt
	SW=$(shuf -n 1 "${noun}")
	echo "${SW}" | sed 's/ .*$//'
	S1=$(echo "${SW}" | sed 's/^.* //')
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
	lines=$(cat "${DOSI}" | wc -l )
	line=$( expr "${RANDOM}" % "${lines}" )
	if [ "${line}" -lt 2 ]
	then
		line="2"
	fi
	cat "${DOSI}" | tr '\t' ',' | bash ./dousi.sh "${line}"
	noun=Jl.txt
	shuf -n 1 "${noun}"
