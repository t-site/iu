#!/bin/bash

LINE=$(. rand.sh iu-handshake.txt 430 )
head -"${LINE}" iu-handshake.txt | tail -1
LINE=$(. rand.sh em.txt 256 )
head -"${LINE}" em.txt | tail -1
