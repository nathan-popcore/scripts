#!/bin/bash
file=$HOME/Desktop/macinfo.txt
touch $file
date > $file
echo "$HOSTNAME" >> $file
echo "$USER" >> $file
fdesetup status >> $file
system_profiler SPHardwareDataType | egrep "Serial Number|Model|Memory|CPU|Processor Name|Speed" |sort |sed 's/      //g' >> $file

