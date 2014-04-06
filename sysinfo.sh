#!/bin/bash

echo "          My System information script."
echo " "
echo " "

echo "The computer has: $(awk < /proc/meminfo '{ if ($1 == "MemTotal:")
 { print $2 }}') Kilobytes of RAM."
echo "The kernel version is: $(uname -r)."
echo "There is: $(df -Hla / | awk '/dev/ {print $3 " remaining of",$4 " \
on the / partition."}')"
echo "The load average is: $(cut -f1 -d ' ' /proc/loadavg). The CPU has\
 $(grep -c ^processor /proc/cpuinfo 2>/dev/null) cores."
echo "Current CPU usage is: $(top -bn 2 -d 0.01 | grep '^%Cpu' | 
tail -n 1 | awk '{print $2+$4+$6}')%"
echo "There are $(ls /var/cache/apt/archives/ | wc -l) packages in the\
/var/cache/apt/archives/ directory."

