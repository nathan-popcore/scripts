#!/bin/bash
file=$HOME/Desktop/macinfo.txt
touch $file
date > $file
echo "$HOSTNAME" >> $file
echo "$USER" >> $file
fdesetup status >> $file
system_profiler SPHardwareDataType | egrep "Serial Number|Model|Memory|CPU|Processor Name|Speed" |sort |sed 's/      //g' >> $file
curl -s https://support-sp.apple.com/sp/product?cc=$(
  system_profiler SPHardwareDataType \
        | awk '/Serial/ {print $4}' \
            | cut -c 9-
  
  ) | sed 's|.*<configCode>\(.*\)</configCode>.*|\1|' >> $file

