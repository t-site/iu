#!/bin/bash
MEMDIR="./mem/"
MEMF=$( basename "$1" )
MEM="${MEMDIR}${MEMF/txt/mem}"
lines=$( cat "$1" | wc -l )
M=$( cat "${MEM}" )
RWINDOW=$(( ${2} / "${lines}" ))
RANGE=$(( ${RANDOM} / "${RWINDOW}" ))
if [ "${RANGE}" -le "1" ]
then
	RANGE=2
fi
RR=${RANDOM}
PM=$(( ${RR} % 2 ))
if [ "${PM}" -eq 0 ]
then
	RR="-$RR"
fi
LIN=$(( ${RR} % ${RANGE} ))
OUT=$(( "${M}" + "${LIN}" ))

while [ "${OUT}" -gt "${lines}" ]
do
	OUT=$(( "${OUT}" - "${lines}" ))
done
while [ "${OUT}" -lt 1 ]
do
	OUT=$(( "${OUT}" + "${lines}" ))
done

echo "${OUT}" > "${MEM}" 
echo "${OUT}"
