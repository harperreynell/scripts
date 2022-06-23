#!/bin/bash

#Author : Harper Reynell
#Date   : Feb 21 2022

#0    black     COLOR_BLACK     0,0,0
#1    red       COLOR_RED       1,0,0
#2    green     COLOR_GREEN     0,1,0
#3    yellow    COLOR_YELLOW    1,1,0
#4    blue      COLOR_BLUE      0,0,1
#5    magenta   COLOR_MAGENTA   1,0,1
#6    cyan      COLOR_CYAN      0,1,1
#7    white     COLOR_WHITE     1,1,1
BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGNETA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`
RESET=`tput sgr0`

#functions
output() {
	read -p "${YELLOW}Type your name here${RESET}: " NAME
	read -p "${YELLOW}Type number of tasks${RESET}: " NTASKS

	echo "$(date) $NAME" >> res.txt
}

#first arg = first num, second arg = second num, third arg = given answer, fourth arg = operation
check(){
	if [ $4 -eq 0 ]
	then
		REALRES=$(($1 + $2))
		if [ $3 -eq $REALRES ]
		then
			return 1
		else
			return 0
		fi
	fi

	if [ $4 -eq 1 ]
	then
		REALRES=$(($1 - $2))
		if [ $3 -eq $REALRES ]
		then
			return 1
		else
			return 0
		fi
	fi

	if [ $4 -eq 2 ]
	then
		REALRES=$(($1 * $2))
		if [ $3 -eq $REALRES ]
		then
			return 1
		else
			return 0
		fi
	fi

	if [ $4 -eq 3 ]
	then
		REALRES=$(($1 / $2))
		if [ $3 -eq $REALRES ]
		then
			return 1
		else
			return 0
		fi
	fi
}
#vals

RANDOM=$$
NCORR=0

#main
output

START=`date +%s`
for(( i = 0; i < $NTASKS; i++ ))
do
	SYMB=$(($RANDOM % 4))
	if [ $SYMB -eq 0 ]
	then
		NUM1=$(($RANDOM % 100))
		NUM2=$(($RANDOM % 100))
		read -p "$NUM1 + $NUM2 = " YOURANS
		check $NUM1 $NUM2 $YOURANS 0
		RET=$?
		if [ $RET -eq 1 ]
		then
			echo "${GREEN}CORRECT${RESET}"
			NCORR=$(($NCORR + 1))
		else
			echo "${RED}INCORRECT${RESET}"
		fi
	else
		if [ $SYMB -eq 1 ]
		then
			NUM1=$(($RANDOM % 100))
			NUM2=$(($RANDOM % 100))
			read -p "$NUM1 - $NUM2 = " YOURANS
			check $NUM1 $NUM2 $YOURANS 1
			RET=$?
			if [ $RET -eq 1 ]
			then
				echo "${GREEN}CORRECT${RESET}"
				NCORR=$(($NCORR + 1))
			else
				echo "${RED}INCORRECT${RESET}"
			fi
		else
			if [ $SYMB -eq 2 ]
			then
				NUM1=$(($RANDOM % 100))
				NUM2=$(($RANDOM % 100))
				read -p "$NUM1 * $NUM2 = " YOURANS
				check $NUM1 $NUM2 $YOURANS 2
				RET=$?
				if [ $RET -eq 1 ]
				then
					echo "${GREEN}CORRECT${RESET}"
					NCORR=$(($NCORR + 1))
				else
					echo "${RED}INCORRECT${RESET}"
				fi
			else
				if [ $SYMB -eq  3 ]
				then
					NUM1=$(($RANDOM % 100))
					NUM2=$(($NUM1 * $(($RANDOM % 10))))
					read -p "$NUM2 ÷ $NUM1 = " YOURANS
					check $NUM2 $NUM1 $YOURANS 3
					RET=$?
					if [ $RET -eq 1 ]
					then
						echo "${GREEN}CORRECT${RESET}"
						NCORR=$(($NCORR + 1))
					else
						echo "${RED}INCORRECT${RESET}"
					fi
				fi
			fi
		fi
	fi
done
END=`date +%s`
TIME=$((END - START))

echo "$NCORR CORRECT ANSWERS OUT OF $NTASKS in $TIME seconds" >> res.txt
echo "YOUR RESULTS WILL OPEN IN 3 SECONDS"
echo -n "${YELLOW}1......................."
sleep 1
echo -n "2......................."
sleep 1
echo "3.......................${GREEN}OK${RESET}"
sleep 1
xdg-open res.txt
