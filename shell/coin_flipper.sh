#!/bin/bash

clear
echo "Flipping a coin..."
echo ""
echo "         _"
sleep 0.2
clear
echo "Flipping a coin..."
echo "         _"
echo ""
sleep 0.2
clear
echo "Flipping a coin..."
echo "         \\"
echo ""
sleep 0.2
clear
echo "Flipping a coin..."
echo "         -"
echo ""
sleep 0.2
clear
echo "Flipping a coin..."
echo "         /"
echo ""
sleep 0.2
clear
echo "Flipping a coin..."
echo "         -"
echo ""
sleep 0.2
clear
echo "Flipping a coin..."
echo ""
echo "         \\"
sleep 0.2
clear
echo "Flipping a coin..."
echo ""
echo "         _"
sleep 1
clear
echo "The coin says..."
BINR=$(( ( RANDOM % 2 )  + 0 ))
if [ $BINR == 1 ]
then
AYS="HEADS"
fi
if [ $BINR == 0 ]
then
AYS="TAILS"
fi
sleep 1
echo "     _____ "
echo "    /"$AYS"\\"
echo "    \\_____/"
echo "    \\|||||/"
