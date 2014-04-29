#!/bin/bash

echo "          My System information script."
echo " "
echo " "

DIRECTORY = "/var/cache/apt/archives/"

echo "The computer has: $(awk < /proc/meminfo '{ if ($1 == "MemTotal:")
 { print $2 }}') Kilobytes of RAM."
echo "The kernel version is: $(uname -r)."

# How much space is left on /?

echo "There is: $(df -Hla / | awk '/dev/ {print $3 " remaining of",$4 " \
on the / partition."}')"
echo "The load average is: $(cut -f1 -d ' ' /proc/loadavg). The CPU has\
 $(grep -c ^processor /proc/cpuinfo 2>/dev/null) cores."
echo "Current CPU usage is: $(top -bn 2 -d 0.01 | grep '^%Cpu' | \
tail -n 1 | awk '{print $2+$4+$6}')%"

# Checking to see if this directory exists.
# http://stackoverflow.com/questions/59838/how-to-check-if-a-directory-exists-in-a-shell-script

if [[ -d "${DIRECTORY}" && ! -L "${DIRECTORY}" ]]; then

	echo "There are $(ls $DIRECTORY | wc -l) packages in\
 the $DIRECTORY directory."

	else
		echo "You are not using a Debian based distribution.";
fi

echo "This is the arp table:"
echo " "
echo "$(cat /proc/net/arp)"
echo " "
